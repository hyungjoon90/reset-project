package ga.beauty.reset.controller;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.api.client.auth.oauth2.RefreshTokenRequest;

import ga.beauty.reset.dao.entity.Members_Vo;
import ga.beauty.reset.dao.entity.User_Vo;
import ga.beauty.reset.services.Login_Service;
import ga.beauty.reset.services.Sign_Service;
import ga.beauty.reset.services.login.Login_Google;
import ga.beauty.reset.services.login.Login_Kakko;
import ga.beauty.reset.services.login.Login_Naver;
import ga.beauty.reset.services.login.Login_Normal;

@Controller
public class Login_Controller {
	
	private static final Logger logger = Logger.getLogger(Login_Controller.class);

	// 서비스 분기용
	private Login_Service login_Service;

	
	@Autowired
	private Sign_Service sign_Service;
	
	@Autowired
	private Login_Service login_Kakko;
	@Autowired
	private Login_Service login_Naver;
	@Autowired
	private Login_Service login_Google;
	@Autowired
	private Login_Service login_Normal;
	
	//일반유저...
	@RequestMapping(value="/sign/", method=RequestMethod.GET)
	public String showSignpage(HttpServletRequest req ) {
		// TODO : comp 값 있으면 기업 유저등록으로 리턴해야됨 / login/login_sign_comp;
		HttpSession session = req.getSession();
		if(session.getAttribute("login_route") == null  ) {
			session.setAttribute("login_route", "normal");
		}
		return "login/login_sign"; 
	}
	
	//일반유저등록
	@RequestMapping(value="/sign/", method=RequestMethod.POST) // Ajax
	@ResponseBody
	@Transactional
	public Map<String,?> sign(User_Vo userBean,Members_Vo memberBean) {
		int result = 0;
		System.out.println(userBean);
		System.out.println(memberBean);
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("result", result);
		return map;	
	}
	
	
	// 일반 유저 등록시 중복체크 검사
	@RequestMapping(value="/sign/{command}", method=RequestMethod.POST, headers="Accept=application/json")// ajax
	@ResponseBody
	public Map<String,?> checkSomething(@PathVariable String command, @RequestParam Members_Vo compare) {
		int result = 1;
		try {
			result = sign_Service.checkSomething(command,compare);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("result", result);
		return map;
	}
	
	// 기업유저 등록시
	//@RequestMapping(value="/sign/")
	// TODO 기업유저 등록해야됨.
	
	
	@RequestMapping(value ="/login/", method=RequestMethod.GET)
	public String showLoginMain(HttpServletRequest req) {
		req.getSession().setAttribute("old_url", req.getHeader("referer"));
		return "login/login_main";
	}
	
	// 로그인 방식-결과 에따라 sign으로 이동할지 기존페이지로 rediect 할지 정해야됨.
	@RequestMapping(value ="/login/{loginPath}", method = {RequestMethod.GET, RequestMethod.POST})
	public String selectLoginService(@PathVariable String loginPath, Model model
			, HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
		if("naver".equals(loginPath)) {
			login_Service = login_Naver;
		}else if("kakko".equals(loginPath)){
			login_Service = login_Kakko;
		}else if("google".equals(loginPath)) {
			login_Service = login_Google;
		}else {
			// 일반로그인
			login_Service = login_Normal;
		}
		try {
			logger.debug("["+req.getContextPath()+"] {"+loginPath+"} : login-click ");
			// 로그인 서비스 시작
			model = login_Service.login(model,req);
		} catch (Exception e) {
			logger.debug("["+req.getContextPath()+"] {"+loginPath+"} : login_Service.login().. err..");
			e.printStackTrace();
			// 에러페이지
		}// try-catch end
		
		if(req.getSession().getAttribute("login_route").toString().equals("google")) return "login/login_google";
		else if(req.getAttribute("login_err")==null) return (String) req.getAttribute("login_result");
		else return "errPage";
	}//selectLoginService()
	
	
}
