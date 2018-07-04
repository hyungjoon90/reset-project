package ga.beauty.reset.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ga.beauty.reset.Home_Controller;
import ga.beauty.reset.services.Login_Service;
import ga.beauty.reset.services.login.Login_Naver;

@Controller
@RequestMapping(value= "/login/")
public class Login_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(Login_Controller.class);

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
				login_Service = new Login_Naver();
				return login_Service.login(model,req);
			} catch (UnsupportedEncodingException e) {
				logger.debug("login_Service 생성도중 에러");
				e.printStackTrace();
				// 에러페이지
			} catch (Exception e) {
				logger.debug("login_Service.login() 중 에러");
				e.printStackTrace();
				// 에러페이지
			}// try-catch end
		}else {
			
		}
		
		
		return "login/login_signup";
	}
	
	
}
