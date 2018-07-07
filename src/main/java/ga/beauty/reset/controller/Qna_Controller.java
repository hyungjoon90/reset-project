package ga.beauty.reset.controller;

import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ga.beauty.reset.dao.entity.Qna_Vo;
import ga.beauty.reset.services.Qna_Service;

@Controller
public class Qna_Controller {
	private static final Logger log = Logger.getLogger(Qna_Controller.class);
	
	@Autowired
	Qna_Service service;
	
	String view="redirect:/qna/";


	
	@RequestMapping(value="/qna/qnaEmail", method= RequestMethod.GET)
	public String showForm() {
		System.out.println("입력폼");
		return "qna/qnaEmail";
		
	}	
	
/*	@RequestMapping(value="/qna/qnaEmail", method = RequestMethod.GET)
	public String list(Model model) throws SQLException {
	service.listPage(model);
	log.debug(getClass());
	return "qna/qnaEmail";

	}*/
	
	@RequestMapping(value="/qna/qna", method= RequestMethod.POST )
	public String add(Qna_Vo bean, Model model) throws SQLException {
		System.out.println("전송");
		service.addPage(bean);
		System.out.println("전송됨.");
		return "qna/qnaResult";
	}

	@RequestMapping(value="/qna/qnaResult", method= RequestMethod.POST)
	public String showResult() {
		return "qna/qnaResult";
	}

	@RequestMapping(value="/admin")
	public String adminPage() {
		System.out.println("어드민페이지");
		return "admin/qnaList";
	}
	
	@RequestMapping(value="/admin", method = RequestMethod.GET)
	public String adminQanList(Model model) throws SQLException {
		service.listPage(model);
		return view;
	}	
}//class end
