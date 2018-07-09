package ga.beauty.reset.services.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ga.beauty.reset.dao.User_Dao;
import ga.beauty.reset.services.Login_Service;

@Service("login_Normal")
public class Login_Normal implements Login_Service{

	
	private HttpSession userSession;
	private HttpServletRequest request;
	
	@Autowired
	User_Dao user_Dao;
	
	@Override
	public Model logout(Model model, HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Model login(Model model, HttpServletRequest req) throws Exception {
		request = req;
		userSession = req.getSession();
		
		String method = req.getMethod();
		if("GET".equals(method)) {
			req.setAttribute("login_result", "login_view");
		}else if("POST".equals(method)){
			req.setAttribute("login_result", "redirect:"+userSession.getAttribute("old_url"));//이전로그
		}
		return model;
	}
	
	

}
