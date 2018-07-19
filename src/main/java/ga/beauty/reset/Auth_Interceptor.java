package ga.beauty.reset;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Auth_Interceptor extends HandlerInterceptorAdapter{

	Logger logger = Logger.getLogger(Auth_Interceptor.class);
	
	public Auth_Interceptor() {
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
        String ip = request.getHeader("X-FORWARDED-FOR");
        Locale locale = request.getLocale();
        if (ip == null) ip = request.getRemoteAddr();		
/*		if(session.getAttribute("login_on")==null) {
        	logger.info("@비정상접속@"+"{ip:"+ip+", locale:"+locale+"}");
			response.sendRedirect("/login/");
			return false;
		}*/ // TODO 이거 나중에 살려야됨.
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}
	
	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
        // XXX 여기에 login-listener 올리자
		super.afterConcurrentHandlingStarted(request, response, handler);
	}
	 
	
}
