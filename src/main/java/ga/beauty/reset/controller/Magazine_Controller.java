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

import ga.beauty.reset.dao.entity.Magazine_Vo;
import ga.beauty.reset.services.Magazine_Service;

@Controller
public class Magazine_Controller {
	private static final Logger logger = LoggerFactory.getLogger(Magazine_Controller.class);
	
	@Autowired
	Magazine_Service service;
	
	String view="redirect:/magazine";
	
	@RequestMapping(value="/magazine", method=RequestMethod.GET)
	public String list(Model model) throws SQLException{
		service.listPage(model);
		return "magazine/magazine_list";
	}
	
	
	@RequestMapping(value="/magazine/{mag_no}", method=RequestMethod.GET)
	public String detail(@PathVariable("mag_no") int mag_no,Model model) throws SQLException{
		Magazine_Vo bean =new Magazine_Vo();
		bean.setMag_no(mag_no);
		service.detailPage(model, bean);
		return "magazine/magazine_detail";
	}
	
	@RequestMapping("/magazine/add")
	public String addForm(Model model) throws SQLException{
		return "magazine/magazine_add";
	}
	
	@RequestMapping(value="/magazine", method=RequestMethod.POST)
	public String add(@ModelAttribute Magazine_Vo bean) throws SQLException{
		service.addPage(bean);
		return "view";
	}
	
	@RequestMapping(value="/magazine/{mag_no}", method=RequestMethod.DELETE)
	public String delete(@PathVariable("mag_no") int mag_no) throws SQLException{
		Magazine_Vo bean =new Magazine_Vo();
		bean.setMag_no(mag_no);
		service.deletePage(bean);
		return view;
	}
	
}//class end
