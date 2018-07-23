package ga.beauty.reset.controller;

import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ga.beauty.reset.dao.entity.Notice_Vo;
import ga.beauty.reset.services.Notice_Service;

@Controller
public class Notice_Controller {
	private static final Logger log = Logger.getLogger(Notice_Controller.class);
	
	@Autowired
	Notice_Service service;
	
	String view = "redirect:/notice";
	public Notice_Controller() {
	}
		
	//공지사항 리스트 보여주기
	@RequestMapping(value="/notice")
	public String showList(Model model) throws SQLException {
		service.listPage(model);
		System.out.println("리스트 보여주기");
		return "admin/notice";
	}	
	
	//공지사항 입력
	@RequestMapping(value="/notice",method=RequestMethod.POST)
	public String add(@ModelAttribute Notice_Vo bean) throws SQLException {
		System.out.println("입력페이지, 입력전");
		service.addPage(bean);
		System.out.println("입력후");
		return view;
	}
	
	//공지사항 수정
	@RequestMapping(value="/notice/{no_no}", method=RequestMethod.PUT)
	public String edit(@PathVariable("no_no") int no_no, @ModelAttribute Notice_Vo bean, Model model) throws SQLException {
		service.updatePage(bean);
		return view;
	}
	
	//공지사항 삭제
	@RequestMapping(value="/notice/{no_no}",method=RequestMethod.DELETE)
	public String delete(@PathVariable("no_no") int no_no) throws SQLException {
		System.out.println("삭제시도");
		service.deletePage(no_no);
		System.out.println("삭제완료");                                                                                                                                                                                                                                                                                                                                                                                           
		return view;
	}
}//class end
