package ga.beauty.reset.controller;


import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ga.beauty.reset.services.Items_Service;

@Controller
public class Items_Controller {
	Logger log=Logger.getLogger(getClass());
	
	@Autowired
	Items_Service service;
	
	String view="redirect:/ranking/";
	
	@RequestMapping("/ranking")
	public String ranking(@RequestParam("id") int cate,Model model) throws SQLException {
		log.debug("param: "+cate);
		service.listPage(model, cate);
		return "ranking/ranking";
	}

}
