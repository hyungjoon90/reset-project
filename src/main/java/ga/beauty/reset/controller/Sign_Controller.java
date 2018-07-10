package ga.beauty.reset.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ga.beauty.reset.dao.entity.Companys_Vo;
import ga.beauty.reset.dao.entity.Members_Vo;
import ga.beauty.reset.dao.entity.User_Vo;
import ga.beauty.reset.services.Sign_Service;

@Controller
public class Sign_Controller {

	
	public Sign_Controller() {
	}
	
	@Autowired
	private Sign_Service sign_Service;
	
	//일반유저는 그냥 , 기업유저는 signType 값 이음
	@RequestMapping(value="/sign/", method=RequestMethod.GET)
	public String showSignpage(HttpServletRequest req ) {
		HttpSession session = req.getSession();
		String signType = req.getParameter("signType");

		if(signType != null && 
				( session.getAttribute("user_type").equals("CEO")
					|| session.getAttribute("user_type").equals("직원")
				) 
			) {
			return "sign/sign_company";
		}
		if(session.getAttribute("login_route") == null  ) {
			session.setAttribute("login_route", "normal");
		}
		return "sign/sign_normal"; 
	}
	
	//일반유저등록
	@RequestMapping(value="/sign/", method=RequestMethod.POST) // Ajax
	@ResponseBody
	public Map<String,Object> sign(User_Vo userBean,Members_Vo memberBean,Companys_Vo componyBean) {
		int result = 0;
		try {
			if(userBean.getUser_type().equals("일반")) {
				sign_Service.signUp(userBean, memberBean);
			}else {
				sign_Service.signUp(userBean, componyBean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("result", result);
		return map;	
	}
	
	
	// 일반 유저 등록시 중복체크 검사
	@RequestMapping(value="/sign/{command}", method=RequestMethod.POST)// ajax
	@ResponseBody
	public Map<String,Object> checkSomething(@PathVariable String command, Members_Vo compare) {
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
	
}
