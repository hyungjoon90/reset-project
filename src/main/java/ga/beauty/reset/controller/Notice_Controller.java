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

import ga.beauty.reset.services.Notice_Service;
import ga.beauty.reset.services.Qna_Service;

@Controller
public class Notice_Controller {
	private static final Logger log = Logger.getLogger(Notice_Controller.class);
	
	@Autowired
	Notice_Service service;
	


	
}//class end
