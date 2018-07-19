package ga.beauty.reset;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class Home_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(Home_Controller.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
        String ip = req.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = req.getRemoteAddr();		
        logger.info("@접속@"+"{ip:"+ip+", locale:"+locale+"}");
		return "index";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public void ajaxTest() {
	
	}
	
}
