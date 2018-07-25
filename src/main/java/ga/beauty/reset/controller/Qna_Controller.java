package ga.beauty.reset.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ga.beauty.reset.dao.entity.Qna_Vo;
import ga.beauty.reset.services.Qna_Service;

@Controller
public class Qna_Controller {
	private static final Logger log = Logger.getLogger(Qna_Controller.class);

	@Autowired
	Qna_Service service;

	String view = "redirect:/qna/";
	String view2 = "redirect:/admin/qnaList";

	//고객의 문의사항
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String show(Model model) {
		System.out.println("입력폼");
		model.addAttribute("goRoot", "../");
		return "qna/qnaEmail";
	}
	
	//고객이 문의 내용을 입력하고 전송
	@RequestMapping(value = "/qna/", method = RequestMethod.POST)
	public String add(Qna_Vo bean) throws SQLException {
		System.out.println("전송");
		service.addPage(bean);
		System.out.println("전송됨.");
		return view;	
	}
	
	//admin의 qna
	@RequestMapping(value = "/admin/qna")
	public String showList(Model model) throws SQLException {
		service.listPage(model);
		System.out.println("리스트 보여주기");
		return "admin/qnaList";
	}

	//admin qna detail
	@RequestMapping(value = "/admin/qna/{qa_no}", method=RequestMethod.GET)
	public String detail(@PathVariable int qa_no, Model model) throws SQLException {
	System.out.println("qa_no:"+qa_no);
	model.addAttribute("bean", service.selectOnePage(qa_no));
	return "admin/qnaDetail";
	}

	//admin qna answer ajax
	@RequestMapping(value="/admin/qna/{qa_no}", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> json(@PathVariable int qa_no, Model model,Qna_Vo bean) throws SQLException {
		System.out.println(bean.getAnswer());
		System.out.println("키값:"+bean.getQa_no());
		int resultNum = service.updatePage(bean);
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(resultNum==1) {
			result.put("result", resultNum);
			result.put("new_answer",bean.getAnswer());
		}

		return result;
	}

}// class end
