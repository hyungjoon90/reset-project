package ga.beauty.reset.services.login;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import ga.beauty.reset.controller.Login_Controller;
import ga.beauty.reset.services.Login_Service;

@Service
@Scope("session")
public class Login_Naver implements Login_Service{

	private static final Logger logger = Logger.getLogger(Login_Controller.class);

	private final String clientId = "tfJeSZAfwMMgSJ0l4M9h";//애플리케이션 클라이언트 아이디값";
	private final String clientSecret = "13p5vTz404";//애플리케이션 클라이언트 시크릿값";
	private String redirectURI;

	private String access_token = "";
	private String refresh_token = "";
	
	ObjectMapper mapper = new ObjectMapper();

	private HttpSession userSession;
	
	//
	public Login_Naver() throws UnsupportedEncodingException {
		redirectURI =  URLEncoder.encode("http://localhost:8080/reset/login/naver", "UTF-8");
	}

	@Override
	public Model logout(Model model, HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	@Override
	public Model login(Model model, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//https://developers.naver.com/docs/login/api/ 참조 -- jsp부분
		String code = req.getParameter("code");
		String state = req.getParameter("state");
		userSession = req.getSession();
		
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;

		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if(responseCode==200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else {  // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer res = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
		}
		
		br.close();
		
		if(responseCode==200) {
			// reset - 서비스로직
			logger.debug(res.toString());
			JsonNode tokenJson = mapper.readTree(res.toString());
			access_token= tokenJson.get("access_token").asText();
			refresh_token= tokenJson.get("refresh_token").asText();
			// 소셜로 로그인인지, 회원가입인지를 파악하기 위해서 다오에게서 데이터를 받아옴.
			// 로그인일 경우 리다이렉트, 회원가입일땐 model에 이메일, 
			this.checkEmail();
		}

		//	    
		return model;

	}

	private String checkEmail() throws IOException {
		String resultJson= getInfofromProfile();
		JsonNode tokenJson = mapper.readTree(resultJson);
		String email= tokenJson.get("email").asText();
		String gender= tokenJson.get("gender").asText();
		
		logger.debug("email/gender:"+email+"/"+gender);
		
		return "";
	}

	private String getInfofromProfile() throws IOException {

		String token = access_token; // 네이버 로그인 접근 토큰;
		String header = "Bearer " + token; // Bearer 다음에 공백 추가
		String apiURL = "https://openapi.naver.com/v1/nid/me";
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("Authorization", header);
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if(responseCode==200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else {  // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			response.append(inputLine);
		}
		br.close();
		JsonNode tokenJson = mapper.readTree(response.toString());
		return tokenJson.get("response").toString();

	}

	private void checkLoginOrSignUp() {
		
	}


}
