package ga.beauty.reset.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ga.beauty.reset.services.Login_Service;
import ga.beauty.reset.services.login.Login_Naver;

@Controller
@RequestMapping(value= "/login/")
public class Login_Controller {
	
	private static final Logger logger = Logger.getLogger(Login_Controller.class);

	private Login_Service login_Service;
	
	
	@RequestMapping(value ="/", method=RequestMethod.GET)
	public String showLoginMain() {
		return "login/login_main";
	}
	
	@RequestMapping(value ="/{loginPath}", method=RequestMethod.GET)
	public String selectLoginService(@PathVariable String loginPath, Model model
			, HttpServletRequest req) {
		if("naver".equals(loginPath)) {
			try {
				logger.debug("["+req.getLocalAddr()+"]naver로 로그인 시도");
				login_Service = new Login_Naver();
				login_Service.login(model,req);
			} catch (UnsupportedEncodingException e) {
				logger.debug("login_Service 생성도중 에러");
				e.printStackTrace();
				// 에러페이지
			} catch (Exception e) {
				logger.debug("login_Service.login() 중 에러");
				e.printStackTrace();
				// 에러페이지
			}// try-catch end
		}else if("kakko".equals(loginPath)){
			// 카카오 연동
		}else if("google".equals(loginPath)) {
			// 구글연동
		}else {
			// 일반
		}
		
		
		return "login/login_signup";
	}
	
	
}
