package ga.beauty.reset.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ga.beauty.reset.services.Exp_Service;

@Controller
public class Exp_Controller {
	Logger log=Logger.getLogger(getClass());
	
	@Autowired
	Exp_Service exp_Service;
	
	@RequestMapping(value="/reset/exp/", method=RequestMethod.POST)
	public void expUp(@RequestBody HttpServletRequest req,HttpServletResponse resp) throws IOException, SQLException {
		log.debug("실행");
//		log.debug("param: "+email+"/"+type);
//		resp.getWriter().print(exp_Service.up(email,type));
	}
	
	@RequestMapping(value="/reset/exp/", method=RequestMethod.DELETE)
	public void expdown(@RequestParam("email") String email,@RequestParam("type") String type, HttpServletRequest req,HttpServletResponse resp) throws IOException, SQLException {
		log.debug("param: "+email+"/"+type);
		resp.getWriter().print(exp_Service.down(email,type));
	}
}
