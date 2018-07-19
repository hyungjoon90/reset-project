package ga.beauty.reset.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ga.beauty.reset.services.mypage.Mypage_Admin_Service;
import ga.beauty.reset.utils.LogEnum;

@Controller
public class Admin_Controller {

	Logger logger = Logger.getLogger(Admin_Controller.class);
	
	@Autowired
	Mypage_Admin_Service mypage_Admin_Service;
	
	public Admin_Controller() {
	}

	@RequestMapping("/admin/")
	public String showDashBoard(Model model, HttpSession session) {
		model.addAttribute("goRoot", "../");
		String email =(String) session.getAttribute("login_email");
		String nick =(String) session.getAttribute("login_nick");
		logger.info(LogEnum.INTER+"["+email+"/"+nick+"] 유저가 /admin/페이지에 접속함.");
		return "admin/admin_main";
	}
	
	
}
