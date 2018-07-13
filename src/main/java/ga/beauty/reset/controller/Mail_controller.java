package ga.beauty.reset.controller;

import java.sql.SQLException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ga.beauty.reset.dao.entity.Qna_Vo;
import ga.beauty.reset.services.Qna_Service;

@Controller
public class Mail_Controller {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	Qna_Service service;
	
	//TODO
	
	@RequestMapping(value="/mail/qna/{qa_no}" , method = RequestMethod.POST)
	@ResponseBody
	public String qnaSender(@PathVariable int qa_no) throws MessagingException, SQLException{
		
		Qna_Vo bean = service.selectOnePage(qa_no);
		String setfrom ="resetbeauty@gmail.com";
		String toemail = bean.getEmail();
		String title = "Re : " + bean.getCon();
		String contents = bean.getCon()+"\n\n\n"+ bean.getAnswer();
		
		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
		
	
		messageHelper.setFrom(setfrom);
		messageHelper.setTo(toemail);
		messageHelper.setSubject(title);
		messageHelper.setText(contents);
	
		mailSender.send(msg);
	
		return "456";
		
	}
	
	
}
