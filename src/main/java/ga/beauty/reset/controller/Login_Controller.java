package ga.beauty.reset.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ga.beauty.reset.services.Login_Service;
import ga.beauty.reset.services.login.Login_Google;
import ga.beauty.reset.services.login.Login_Kakko;
import ga.beauty.reset.services.login.Login_Naver;
import ga.beauty.reset.services.login.Login_Normal;

@Controller
@RequestMapping(value= "/login")
public class Login_Controller {
	
	private static final Logger logger = Logger.getLogger(Login_Controller.class);

	private Login_Service login_Service;
	
	
	@RequestMapping(value ="/", method=RequestMethod.GET)
	public String showLoginMain() {
		return "login/login_main";
	}
	
	// 로그인 방식-결과 에따라 signUP으로 이동할지 기존페이지로 rediect 할지 정해야됨.
	@RequestMapping(value ="/{loginPath}", method = {RequestMethod.GET, RequestMethod.POST})
	public String selectLoginService(@PathVariable String loginPath, Model model
			, HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
		if("naver".equals(loginPath)) {
			login_Service = new Login_Naver();
		}else if("kakko".equals(loginPath)){
			// 카카오 연동
			login_Service = new Login_Kakko();
		}else if("google".equals(loginPath)) {
			// 구글연동
			login_Service = new Login_Google();
		}else {
			// 일반로그인
			login_Service = new Login_Normal();
		}
		
		try {
			logger.debug("["+req.getContextPath()+"] {"+loginPath+"} : login-click ");
			// 로그인 서비스 시작
			model = login_Service.login(model,req,resp);
		} catch (UnsupportedEncodingException e) {
			logger.debug("["+req.getContextPath()+"] {"+loginPath+"} : login_Service creating err..");
			e.printStackTrace();
			// 에러페이지
		} catch (Exception e) {
			logger.debug("["+req.getContextPath()+"] {"+loginPath+"} : login_Service.login() err..");
			e.printStackTrace();
			// 에러페이지
		}// try-catch end
	
		
		return "login/login_signup";
	}
	
	
}
