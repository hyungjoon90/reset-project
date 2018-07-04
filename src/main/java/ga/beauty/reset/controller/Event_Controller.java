package ga.beauty.reset.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Event_Controller {

	private static final Logger logger = Logger.getLogger(Event_Controller.class);
	
	@RequestMapping(value = "/event/test", method = RequestMethod.GET)
	public String test(Model model) {
		return "event/event_Test";
	}
}
