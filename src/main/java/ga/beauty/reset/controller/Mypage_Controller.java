package ga.beauty.reset.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import ga.beauty.reset.services.mypage.Mypage_ADV_Service;
import ga.beauty.reset.services.mypage.Mypage_EMP_Service;
import ga.beauty.reset.services.mypage.Mypage_NOR_Service;

@Controller
public class Mypage_Controller {

	private static final Logger logger = Logger.getLogger(Mypage_Controller.class);
	
	@Autowired
	Mypage_NOR_Service mypage_NOR_Service; 
	@Autowired
	Mypage_EMP_Service mypage_EMP_Service; 
	@Autowired
	Mypage_ADV_Service mypage_ADV_Service; 
	
	public Mypage_Controller() {
	}

	
	@RequestMapping(value = "/mypage/", method = RequestMethod.GET)
	public String showMain(@SessionAttribute(name="user_type") String user_type ) {
		if("CEO".equals(user_type) || "직원".equals(user_type)) {
			return "mypage/mypage_emp_main";
		}else if("광고주".equals(user_type)) {
			return "mypage/mypage_adv_main";
		}else if("일반".equals(user_type)) {
			return "mypage/mypage_nor_main";
		}else {
			// TODO 에러
			return "err";
		}
	}// showMain()
	
	
	
	
}// 
