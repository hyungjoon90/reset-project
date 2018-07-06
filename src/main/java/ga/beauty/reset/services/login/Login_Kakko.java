package ga.beauty.reset.services.login;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import ga.beauty.reset.services.Login_Service;


@Service
public class Login_Kakko implements Login_Service{

	private static final Logger logger = Logger.getLogger(Login_Kakko.class);
	
	private String tokenErr = "토큰에러";
	private String profileErr = "프로필에러";
	private String emailErr = "이메일에러";
	
	private final String clientId = "f709273524fdad8902b81660b68a0735";//애플리케이션 클라이언트 아이디값";
	private String redirectURI ="http://localhost:8080/reset/login/kakko";

	private String access_token = "";
	private String refresh_token = "";

	private HttpSession userSession;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	ObjectMapper mapper = new ObjectMapper();
	
	public Login_Kakko() throws UnsupportedEncodingException {
	}
	
	@Override
	public Model logout(Model model, HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Model login(Model model, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// 요청(코드) >>  토큰얻기(코드) >> ( 앱연결(토큰) ) >> 프로필(토큰) 

		request = req;
		response = resp;
		userSession = req.getSession();
		String code = req.getParameter("code");

		int resultCode = 0;
		
		if( (resultCode = getToken(code))!=200  ) {
			model.addAttribute("login_err",tokenErr);
			return model;
		} 
		// 한번만 실행되면 됨
		this.setKakkoId();
		
		// checkEmail : 가능한 에러 > profile / email 
		// 소셜로 로그인인지, 회원가입인지를 파악하기 위해서 다오에게서 데이터를 받아옴.
		// 로그인일 경우 리다이렉트, 회원가입일땐 model에 이메일,
		
		String result= this.checkEmail(); // 정상적이면 이메일
		if(result.equals(profileErr)) {
			// TODO 프로필에러... 
		}else if(result.equals(emailErr)) {
			// TODO 이메일 재확인 처리해야됨
		}
		userSession.setAttribute("login_type", "kakko");
		userSession.setAttribute("access_token", access_token);
		userSession.setAttribute("login_type", "kakko");
		return model;
	}
	
	private int getToken(String code) throws ClientProtocolException, IOException {
		logger.debug(code);
		// 시작
		String apiURL = "https://kauth.kakao.com/oauth/token";
		
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", clientId)); // REST API KEY
		postParams.add(new BasicNameValuePair("redirect_uri", redirectURI)); // 리다이렉트 URI
		postParams.add(new BasicNameValuePair("code", code)); // 로그인 과정중 얻은 code 값

		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(apiURL);
		post.setEntity(new UrlEncodedFormEntity(postParams));
		final HttpResponse response = client.execute(post); // 연결시작
		
		int responseCode=0;
		responseCode = response.getStatusLine().getStatusCode();
		String responseString ="";
		responseString = EntityUtils.toString(response.getEntity());

		logger.debug("Post parameters - getToken(kakko) : " + postParams);
		logger.debug("Response Code - getToken(kakko) : " + responseCode);
		JsonNode tokenJson = null;
		if(responseCode==200) {
			tokenJson = mapper.readTree(responseString);
			access_token= tokenJson.get("access_token").asText();
			refresh_token= tokenJson.get("refresh_token").asText();
			logger.debug("access_token Code : " + access_token);
			logger.debug("refresh_token Code : " + refresh_token);
		}else {
			logger.debug("Response Err - getToken(kakko) :" + responseString);
		}
		return responseCode;
	}
	
	
	// 앱연결을 위해서 필요한 ID를 등록합니다. 한번만 등록되며,
	// 추후에 카카오톡 연결 해제시 해제만 시키면됩니다.
	private void setKakkoId() throws ClientProtocolException, IOException {
		
		String apiURL = "https://kapi.kakao.com/v1/user/signup";
		final String header1 = "Bearer "+access_token; 
//		final String header2 = "application/x-www-form-urlencoded;charset=utf-8;";
		
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(apiURL);
		post.setHeader("Authorization", header1 );
//		post.setHeader("Content-Type", header2 );
		
		final HttpResponse response = client.execute(post);
		
		int responseCode = response.getStatusLine().getStatusCode();
		JsonNode idJson = mapper.readTree(response.getEntity().getContent());

		logger.debug("Response Code -setKakkoId(kakko) : " + responseCode);
		if(responseCode==200) {
//			String app_id = idJson.get("id").asText();
//			logger.debug("app_id : " + app_id);
//			userSession.setAttribute("app_id", app_id);
		}else {
			logger.debug(response.getStatusLine().getReasonPhrase());
			logger.debug("Response Err -setKakkoId(kakko) : "+idJson.asText());
		}
	}
	
	private String checkEmail() throws IOException {
		String resultString= getInfofromProfile();

		if(resultString.equals(profileErr)) {
			return resultString;
		}
		
		JsonNode tokenJson = mapper.readTree(resultString);
		//JsonNode idJson = tokenJson.get("id"); 필요할때 쓰자
		JsonNode accountJson = tokenJson.get("kakao_account");
		boolean hasEmail = accountJson.get("has_email").asBoolean();
		boolean validEmail = accountJson.get("is_email_valid").asBoolean();
		boolean verifedEmail = accountJson.get("is_email_verified").asBoolean();
		String email = accountJson.get("email").asText();
		if( hasEmail &&  validEmail &&  verifedEmail ) {
			return email;
		}else {
			return emailErr;
		}
	
	}

	private String getInfofromProfile() throws ClientProtocolException, IOException {

		String header1 = "Bearer " + access_token; // Bearer 다음에 공백 추가
		String header2 = "application/x-www-form-urlencoded;charset=utf-8;";//Content-type
		String apiURL = "https://kapi.kakao.com/v2/user/me";

		List<NameValuePair> parameters = new ArrayList<NameValuePair>();
		parameters.add(new BasicNameValuePair("property_keys", "[\"kakao_account.email\"]"));

		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(apiURL);
		post.addHeader("Authorization",header1);
		post.setEntity(new UrlEncodedFormEntity(parameters));
		
		HttpResponse response = client.execute(post);
		int responseCode = response.getStatusLine().getStatusCode();
		String responseString = EntityUtils.toString(response.getEntity(), "utf-8");
		logger.debug("Response Code -getInfo(kakko) : "+responseCode);
		if(responseCode != 200) {
			logger.debug("Response Err -getInfo(kakko): ("+request.getRemoteHost()+")/"+responseString);
			return profileErr;
		}
		return responseString;
	}// getInfofromProfile()
	
	private void checkLoginOrSignUp() {
		
	}
}
