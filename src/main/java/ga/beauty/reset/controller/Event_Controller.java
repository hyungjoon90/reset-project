package ga.beauty.reset.controller;

import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ga.beauty.reset.dao.entity.Event_Vo;
import ga.beauty.reset.services.Event_Service;

@Controller
public class Event_Controller {

	private static final Logger logger = LoggerFactory.getLogger(Event_Controller.class);
	
	@Autowired
	Event_Service service;
	
	String view="redirect:/event";

	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String list(Model model) throws SQLException {
		service.listPage(model);
		return "event/event_list";
	}
	
	@RequestMapping(value = "/event/{eve_no}", method = RequestMethod.GET)
	public String detail(@PathVariable int eve_no ,Model model) throws SQLException {
		Event_Vo bean=new Event_Vo();
		bean.setEve_no(eve_no);
		service.detailPage(model, bean);
		return "event/event_detail";
	}
	
	@RequestMapping("/event/add")
	public String addForm(Model model) {
		return "event/event_add";
	}
	
	@RequestMapping(value = "/event", method = RequestMethod.POST)
	public String add(@ModelAttribute Event_Vo bean) throws SQLException {
		service.addPage(bean);
		return view;
	}
	
	@RequestMapping(value = "/event/{eve_no}", method = RequestMethod.DELETE)
	public String delete(@PathVariable int eve_no) throws SQLException {
		Event_Vo bean=new Event_Vo();
		bean.setEve_no(eve_no);
		service.deletePage(bean);
		return view+"/event_list";
	}
	
}
