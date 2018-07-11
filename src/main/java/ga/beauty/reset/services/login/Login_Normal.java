package ga.beauty.reset.services.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import ga.beauty.reset.dao.Companys_Dao;
import ga.beauty.reset.dao.Members_Dao;
import ga.beauty.reset.dao.User_Dao;
import ga.beauty.reset.dao.entity.User_Vo;
import ga.beauty.reset.services.Login_Service;

@Service("login_Normal")
public class Login_Normal implements Login_Service{

	private static Logger logger = Logger.getLogger(Login_Normal.class);
	
	private HttpSession userSession;
	private HttpServletRequest request;
	
	@Autowired
	User_Dao user_Dao;

	@Autowired
	Members_Dao members_Dao;
	
	@Autowired
	Companys_Dao companys_Dao;
	
	@Override
	public Model logout(Model model, HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public Model login(Model model, HttpServletRequest req) throws Exception {
		request = req;
		userSession = req.getSession();
		String method = req.getMethod();
		if(method.equals("GET")) {
			req.setAttribute("login_result", "login/login_view");
		}else if(method.equals("POST")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			if(email==null || password == null) {
		
			}
				int result =user_Dao.checkInfo(email);
				logger.debug("email 있는지 체크"+result);
				if(result==1) {
					User_Vo userBean = new User_Vo();
					userBean.setEmail(email);;
					User_Vo checkBean = user_Dao.selectOne(userBean);
					checkBean.getPassword();
					// TODO if()
					req.setAttribute("login_result", "redirect:"+userSession.getAttribute("old_url"));//이전로그
				}
		}// post 상황끝
		
		return model;
	}

}
