package ga.beauty.reset.controller;

import java.sql.SQLException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Mail_controller {
	Logger log = Logger.getLogger(getClass());
	
	@Autowired
	private JavaMailSenderImpl mailSender;

	
	@RequestMapping(value="/mailSender", method=RequestMethod.GET)
	public String showForm() {
		return "mailSender";
	}
	
	
	//이메일 전송하기
	
		@RequestMapping(value="/qna/qnaEmail" , method = RequestMethod.POST)
		public String mailSender(HttpServletRequest request, Model model) throws MessagingException{
			
			String setfrom ="resetbeauty@gmail.com";
			String toemail = request.getParameter("toemail");
			String title = "re : " + request.getParameter("title");
			String contents = request.getParameter("contents");
			
			MimeMessage msg = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
			
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(toemail);
			messageHelper.setSubject(title);
			messageHelper.setText(contents);
			
			mailSender.send(msg);
			
			return "qna/qnaResult";
		
			
		}

}
