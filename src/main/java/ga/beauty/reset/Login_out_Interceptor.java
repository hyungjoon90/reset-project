package ga.beauty.reset;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Login_out_Interceptor extends HandlerInterceptorAdapter{

	private static final Logger logger = Logger.getLogger(Login_out_Interceptor.class);
	
	public Login_out_Interceptor() {
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("login_on")!=null && ((boolean)session.getAttribute("login_on") == true) ) {
			
		}else {
			
		}
		super.afterCompletion(request, response, handler, ex);
	}
	
	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		super.afterConcurrentHandlingStarted(request, response, handler);
	}
	 
	
}
