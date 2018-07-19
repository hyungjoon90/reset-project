package ga.beauty.reset.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ga.beauty.reset.dao.entity.Eve_addr_Vo;
import ga.beauty.reset.services.Eve_addr_Service;
import ga.beauty.reset.services.Event_Service;

@Controller
public class Eve_Addr_Controller {
	private static final Logger logger = LoggerFactory.getLogger(Eve_Addr_Controller.class);
	
	@Autowired
	Eve_addr_Service service;
	
	@Autowired
	Event_Service eventService;
	
	String view="redirect:/eveaddr";
	
	@RequestMapping(value = "/admin/eveaddr", method = RequestMethod.GET)
	public String list(Model model) throws SQLException {
		eventService.listPage(model);
		return "eve_addr/eve_addr_list";
	}
	
	@RequestMapping(value = "/admin/eveaddr/{eve_no}", method = RequestMethod.GET)
	public String detail(@PathVariable int eve_no ,Model model,HttpServletRequest req) throws SQLException {
		Eve_addr_Vo bean=new Eve_addr_Vo();
		bean.setEve_no(eve_no);
		service.listPage(model, bean);
		return "eve_addr/eve_addr_detail";
	}
	
	@RequestMapping(value="/event/{eve_no}/addr", method=RequestMethod.GET)
	public String addForm(@PathVariable("eve_no") int eve_no,Model model) throws SQLException{
		model.addAttribute("event",eve_no);
		return "event/event_addr";
	}
	
	
	@RequestMapping(value="/event/{eve_no}/addr", method=RequestMethod.POST)
	public String add(@PathVariable("eve_no") int eve_no,HttpServletRequest req) throws SQLException{
		Eve_addr_Vo bean = new Eve_addr_Vo();
		bean.setEve_no(eve_no);
		bean.setEmail(req.getParameter("email"));
		bean.setName(req.getParameter("name"));
		//주소 
		String address =req.getParameter("roadAddrPart1") + req.getParameter("addrDetail");
		bean.setAddress(address);
		
		bean.setPhone(req.getParameter("phone"));
		
		bean.setPostcode(Integer.parseInt(req.getParameter("zipNo")));
		
		service.addPage(bean);
		return "redirect:/event/"+eve_no;
	}
}
