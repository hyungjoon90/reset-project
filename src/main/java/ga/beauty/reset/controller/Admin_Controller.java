package ga.beauty.reset.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ga.beauty.reset.services.mypage.Mypage_Admin_Service;

@Controller
public class Admin_Controller {

	@Autowired
	Mypage_Admin_Service mypage_Admin_Service;
	
	public Admin_Controller() {
	}

	@RequestMapping("/admin/")
	public String showDashBoard(Model model) {
		model.addAttribute("goRoot", "../");
		return "admin/admin_main";
	}
	
}
