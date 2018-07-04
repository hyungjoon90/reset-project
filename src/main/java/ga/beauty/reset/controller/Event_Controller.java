package ga.beauty.reset.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import ga.beauty.reset.services.Event_Service;

@Controller
public class Event_Controller {

	@Autowired
	Event_Service service;
	
	String view="redirect:/event/";
}
