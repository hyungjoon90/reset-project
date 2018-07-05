package ga.beauty.reset.services.login;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.metadata.PostgresTableMetaDataProvider;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.fasterxml.jackson.databind.util.JSONWrappedObject;

import ga.beauty.reset.controller.Login_Controller;
import ga.beauty.reset.services.Login_Service;


@Service
public class Login_Kakko implements Login_Service{

	private static final Logger logger = Logger.getLogger(Login_Kakko.class);
	
	private final String clientId = "f709273524fdad8902b81660b68a0735";//애플리케이션 클라이언트 아이디값";
	private String redirectURI ="http://localhost:8080/reset/login/kakko";

	private String access_token = "";
	private String refresh_token = "";
	
	ObjectMapper mapper = new ObjectMapper();

	private HttpSession userSession;
	public Login_Kakko() throws UnsupportedEncodingException {
	}
	
	// 흐름 >> 코드 >> 토큰 >> 앱 연결 >> 프로필 조회가능
	
	
	
	@Override
	public Model logout(Model model, HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Model login(Model model, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String code = req.getParameter("code");
		String state = req.getParameter("state");

		userSession = req.getSession();
		String apiURL = "https://kauth.kakao.com/oauth/token";
		logger.debug(code);
				
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", clientId)); // REST API KEY
		postParams.add(new BasicNameValuePair("redirect_uri", redirectURI)); // 리다이렉트 URI
		postParams.add(new BasicNameValuePair("code", code)); // 로그인 과정중 얻은 code 값

		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(apiURL);
		JsonNode tokenJson = null;
		int responseCode=0;
		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);
			responseCode = response.getStatusLine().getStatusCode();

			logger.debug("Post parameters : " + postParams);
			logger.debug("Response Code : " + responseCode);
			if(responseCode==200) {
				tokenJson = mapper.readTree(response.getEntity().getContent());
				access_token= tokenJson.get("access_token").asText();
				refresh_token= tokenJson.get("refresh_token").asText();
				logger.debug("access_token Code : " + access_token);
				logger.debug("refresh_token Code : " + refresh_token);
				// session에 로그인경로 / 토큰값을 넣어둠?
				userSession.setAttribute("login_type", "kakko");
				userSession.setAttribute("access_token", access_token);
				userSession.setAttribute("login_type", "kakko");
				
				// get
				this.getKakkoId();
				
				// checkout
				//this.checkout();
			}else {

				
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//	    
		return model;

		
	}
	
	// 앱연결을 위해서 필요한 ID를 받아옵니다. 필요한건 acess 토큰
	private void getKakkoId() throws ClientProtocolException, IOException {
//		POST /v1/user/signup HTTP/1.1
//		Host: kapi.kakao.com
//		Authorization: Bearer {access_token}
//		Content-Type: application/x-www-form-urlencoded;charset=utf-8
		
		String apiURL = "https://kapi.kakao.com/v1/user/signup";
		
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(apiURL);
		final String header1 = "Bearer "+access_token; 
		final String header2 = "application/x-www-form-urlencoded;charset=utf-8;";
		post.setHeader("Authorization", header1 );
		post.setHeader("Content-Type", header2 );
		
		final HttpResponse response = client.execute(post);
		int responseCode = response.getStatusLine().getStatusCode();

		logger.debug("ID-Response Code : " + responseCode);
		if(responseCode==200) {
			JsonNode idJson = mapper.readTree(response.getEntity().getContent());
			String app_id = idJson.get("id").asText();
			logger.debug("app_id : " + app_id);
			// session에 로그인경로 / 토큰값을 넣어둠?
			userSession.setAttribute("app_id", app_id);
		}
	}
	
	private String checkout() throws IOException {
		// 소셜로 로그인인지, 회원가입인지를 파악하기 위해서 다오에게서 데이터를 받아옴.
		// 로그인일 경우 리다이렉트, 회원가입일땐 model에 이메일,
		String resultJson= getInfofromProfile();
		JsonNode tokenJson = mapper.readTree(resultJson);
		String email= tokenJson.get("email").asText();
		String gender= tokenJson.get("gender").asText();
		
		logger.debug("email/gender:"+email+"/"+gender);
		
		return "";
	}



	private String getInfofromProfile() {
//		curl -v -X POST https://kapi.kakao.com/v2/user/me \
//			  -H "Authorization: Bearer xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" \
//			  -d 'property_keys=["kakao_account.email"]'
//		HTTP/1.1 200 OK
//		{
//		  "id":123456789,
//		  "properties":{
//		     "nickname":"홍길동",
//		  },
//		  "kakao_account": { 
//		    "has_email": true, 
//		    "is_email_valid": true,   
//		    "is_email_verified": true,   
//		    "email": "xxxxxxx@xxxxx.com"
//		  }
//		}		
//		
		String token = access_token; // 로그인 접근 토큰;
		String header = "Bearer " + token; // Bearer 다음에 공백 추가
		String apiURL = "https://openapi.naver.com/v1/nid/me";

//		property_keys=["kakao_account.email"]

		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", clientId)); // REST API KEY
		postParams.add(new BasicNameValuePair("redirect_uri", redirectURI)); // 리다이렉트 URI

		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(apiURL);
		JsonNode tokenJson = null;
		int responseCode=0;
			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);
			responseCode = response.getStatusLine().getStatusCode();

			logger.debug("Post parameters : " + postParams);
			logger.debug("Response Code : " + responseCode);
			if(responseCode==200) {
				tokenJson = mapper.readTree(response.getEntity().getContent());
				access_token= tokenJson.get("access_token").asText();
				refresh_token= tokenJson.get("refresh_token").asText();
				logger.debug("access_token Code : " + access_token);
				logger.debug("refresh_token Code : " + refresh_token);
				// session에 로그인경로 / 토큰값을 넣어둠?
				userSession.setAttribute("login_type", "kakko");
				userSession.setAttribute("access_token", access_token);
				userSession.setAttribute("login_type", "kakko");
				
			}
		return tokenJson.get("response").toString();
	}
	
	
}
