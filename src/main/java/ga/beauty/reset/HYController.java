package ga.beauty.reset;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HYController {

	private static final Logger logger = LoggerFactory.getLogger(HYController.class);
	
	@RequestMapping(value = "/event/test", method = RequestMethod.GET)
	public String test(Model model) {
		logger.debug("형준씨컨트롤러");
		return "event/HY_Test";
	}
}
