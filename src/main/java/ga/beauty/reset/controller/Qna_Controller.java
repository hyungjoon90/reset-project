package ga.beauty.reset.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ga.beauty.reset.dao.entity.Notice_Vo;
import ga.beauty.reset.dao.entity.Qna_Vo;
import ga.beauty.reset.services.Qna_Service;

@Controller
public class Qna_Controller {
	private static final Logger log = Logger.getLogger(Qna_Controller.class);

	@Autowired
	Qna_Service service;

	String view = "redirect:/qna/";
	String view2 = "redirect:/admin/qnaList";

	@RequestMapping(value = "/qna/qnaEmail", method = RequestMethod.GET)
	public String show(Model model) {
		System.out.println("입력폼");
		model.addAttribute("goRoot", "../");
		return "qna/qnaEmail";
	}

	/*
	 * @RequestMapping(value="/qna/qnaEmail", method = RequestMethod.GET) public
	 * String list(Model model) throws SQLException { service.listPage(model);
	 * log.debug(getClass()); return "qna/qnaEmail";
	 * 
	 * }
	 */

	@RequestMapping(value = "/qna/qna", method = RequestMethod.POST)
	public String add(Qna_Vo bean, Model model) throws SQLException {
		System.out.println("전송");
		service.addPage(bean);
		System.out.println("전송됨.");
		return "qna/qnaResult";
	}

	@RequestMapping(value = "/qna/qnaResult", method = RequestMethod.POST)
	public String showResult() {
		return "qna/qnaResult";
	}
	
	
	//admin의 qna
	@RequestMapping(value = "/admin/qnaList")
	public String showList(Model model) throws SQLException {
		service.listPage(model);
		System.out.println("리스트 보여주기");
		return "admin/qnaList";
	}

	@RequestMapping(value = "/admin/qnaDetail/{qa_no}", method=RequestMethod.GET)
	public String detail(@PathVariable int qa_no, Model model) throws SQLException {
	System.out.println("qa_no:"+qa_no);
	model.addAttribute("bean", service.selectOnePage(qa_no));
	return "admin/qnaDetail";
	}
	
/*	@RequestMapping(value = "/admin/qnaDetail/{qa_no}", method=RequestMethod.POST)
	public String addAdminPage(Qna_Vo bean) throws SQLException {
		System.out.println("디테일에서 답변 입력, 입력전");
		service.updatePage(bean);
		System.out.println("디테일에서 답변 입력, 입력후");
		return "admin/qnaDetail/{qa_no}";
	}
*/
//	http://gcomx.blogspot.com/2017/11/jquery-ajax-controller-list.html
	
	//TODO

	@RequestMapping(value="/admin/qnaDetail/{qa_no}", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> json(@PathVariable int qa_no, Model model,Qna_Vo bean) throws SQLException {
		System.out.println(bean.getAnswer());
		System.out.println("키값:"+bean.getQa_no());
		int resultNum = service.updatePage(bean);
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(resultNum==1) {
//		String parameter = String.valueOf(Json.get(0).get("answer")); //parameter는 json의 첫번째 answer의 값을 가져옴
			result.put("result", resultNum);
			result.put("new_answer",bean.getAnswer());
		}
		//result.put("bean", service.selectOnePage(qa_no));
		return result;
	}

	
	@RequestMapping(value = "/admin/qnaDetail/{qa_no }", method = RequestMethod.PUT)
	public String edit(@PathVariable int qa_no, @ModelAttribute Qna_Vo bean, Model model) throws SQLException {
		service.updatePage(bean);
		model.addAttribute("qa_no", qa_no);
		return view;
	}
	
/*	@RequestMapping(value = "/admin/qnaDetail/{bean.qa_no }", method = RequestMethod.DELETE)
	public String delete(@PathVariable int qa_no) throws SQLException {
		service.deletePage(qa_no);
		return view2;
	}*/


}// class end
