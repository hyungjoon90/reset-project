package ga.beauty.reset.controller.advice;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ga.beauty.reset.utils.LogEnum;

@ControllerAdvice
public class Exception_ControllerAdvice {

	Logger logger = Logger.getLogger(getClass());
	
	public Exception_ControllerAdvice() {
		logger.info(LogEnum.INIT+"("+getClass()+") 생성완료");
	}
	
	@ExceptionHandler(Exception.class)
	@RequestMapping(value="/error")
	public String exception(Exception e) {
		logger.error(LogEnum.ERROR+(e.getMessage().replace( System.getProperty( "line.separator" ), "")));
		return "error/error";
	}
}
