package ga.beauty.reset;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ga.beauty.reset.utils.LogEnum;

public class Auth_Interceptor extends HandlerInterceptorAdapter{

	Logger logger = Logger.getLogger(Auth_Interceptor.class);
	
	public Auth_Interceptor() {
		logger.info(LogEnum.INIT+"("+getClass()+") 생성완료");
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
        String ip = request.getHeader("X-FORWARDED-FOR");
        Locale locale = request.getLocale();
        // TODO [kss] 마무리작업시
        if (ip == null) ip = request.getRemoteAddr();		
		if(session.getAttribute("login_on")==null || (Boolean) session.getAttribute("login_on")==false) {
        	logger.info(LogEnum.EEROR_CON+"비로그인한 {ip:"+ip+", locale:"+locale+"}의 이상접속시도");
			response.sendRedirect("/reset/login/");
			return false;
		}else if(request.getRequestURI().contains("/mypage/")){
			String type = (String) session.getAttribute("login_user_type");//
			if(type!=null && type.equals("일반")) {
			}else {
				logger.info(LogEnum.EEROR_CON+"일반회원이 아닌 {ip:"+ip+", locale:"+locale+"}의 마이페이지 이상접속시도");
				response.sendRedirect("/reset/error");
				return false;
			}
		}else if(request.getRequestURI().contains("/admin/")){
			String type = (String) session.getAttribute("login_user_type");//
			if(type!=null && (type.equals("CEO")|| type.equals("직원")|| type.equals("광고주"))) {
			}else {
				logger.info(LogEnum.EEROR_CON+"일반회원인 {ip:"+ip+", locale:"+locale+"}의 관리자 페이지 이상접속시도");
				response.sendRedirect("/reset/error");
				return false;
			}
		}
		return super.preHandle(request, response, handler);
	}
}
