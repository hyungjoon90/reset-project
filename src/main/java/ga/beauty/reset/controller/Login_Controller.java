package ga.beauty.reset.controller;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.eclipse.jdt.internal.compiler.ast.ThisReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.Session;

import ga.beauty.reset.dao.Companys_Dao;
import ga.beauty.reset.dao.Members_Dao;
import ga.beauty.reset.dao.entity.Companys_Vo;
import ga.beauty.reset.dao.entity.Members_Vo;
import ga.beauty.reset.dao.entity.User_Vo;
import ga.beauty.reset.services.Login_Service;
import ga.beauty.reset.services.Sign_Service;

@Controller
public class Login_Controller {
	
	private static final Logger logger = Logger.getLogger(Login_Controller.class);

	// 서비스 분기용
	
	@Autowired
	private Login_Service login_kakao;
	@Autowired
	private Login_Service login_Naver;
	@Autowired
	private Login_Service login_Google;
	@Autowired
	private Login_Service login_Normal;
	@Autowired
	private Sign_Service sign_Service;
	
	@Autowired
	private Members_Dao members_Dao;
	
	@Autowired
	private Companys_Dao companys_Dao;
	
	public Login_Controller() {
	}
	
	@RequestMapping(value="/logout/", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		if((boolean) session.getAttribute("login_on"))session.invalidate();
		return "index";
	}
	
	@RequestMapping(value ="/login/", method=RequestMethod.GET)
	public String showLoginMain(HttpServletRequest req, Model model, HttpSession session) {
		model.addAttribute("goRoot", "../");
		if(session.getAttribute("old_url")==null) session.setAttribute("old_url", req.getHeader("referer"));
		return "login/login_main";
	}
	
	// 로그인 방식-결과 에따라 sign으로 이동할지 기존페이지로 rediect 할지 정해야됨.
	@RequestMapping(value ="/login/{loginPath}/", method = {RequestMethod.GET, RequestMethod.POST})
	public String selectLoginService(@PathVariable String loginPath, Model model
			, HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
		// 서비스 분기용
		Login_Service login_Service = null;
		if("naver".equals(loginPath)) {
			login_Service = login_Naver;
		}else if("kakao".equals(loginPath)){
			login_Service = login_kakao;
		}else if("google".equals(loginPath)) {
			login_Service = login_Google;
		}else {
			// 일반로그인
			login_Service = login_Normal;
		}
		try {
			logger.debug("["+req.getContextPath()+"] {"+loginPath+"} : login-click ");
			// 로그인 서비스 시작
			model = login_Service.login(model,req);
		} catch (Exception e) {
			logger.debug("["+req.getContextPath()+"] {"+loginPath+"} : login_Service.login().. err..");
			e.printStackTrace();
			// 에러페이지
		}// try-catch end
		
		// 닉네임정보는 컨트롤러에서 넣어줍니다.
		HttpSession session = req.getSession();
		if(session.getAttribute("login_on")!=null && (boolean)session.getAttribute("login_on")) {
			String login_email = (String) session.getAttribute("login_email");
			String login_user_type = (String) session.getAttribute("login_user_type");
			try {
				if(login_user_type.equals("일반")) {
					Members_Vo bean = new Members_Vo();
					bean.setEmail((String)session.getAttribute("login_email"));
					session.setAttribute("login_nick" ,members_Dao.selectOne(bean).getNick());
				}else {
					Companys_Vo bean = new Companys_Vo();
					bean.setEmail((String)session.getAttribute("login_email"));
					session.setAttribute("login_nick" ,companys_Dao.selectOne(bean).getManager());
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(req.getAttribute("login_err")==null) return (String) req.getAttribute("login_result");
		else return "errPage";
	}//selectLoginService()
	
	
	@RequestMapping(value="/login/adds/", method=RequestMethod.GET)
	public String showAdds(Model model) {
		return "login/login_adds";
	}

	@RequestMapping(value="/login/adds/", method=RequestMethod.POST) // ajax
	@ResponseBody
	public Map<String, Object> showAdds(Model model, String command, HttpSession session) {
		Map<String, Object> resultMap = new HashMap<String,Object>();
		int result = 0;
		if(command.equals("yes")) {
			User_Vo target = new User_Vo();
			target.setEmail((String)session.getAttribute("login_email"));
			// TODO sql 찾아야됨.
			target.setJoin_route("join_route +"+"{\""+(String)session.getAttribute("login_route")+"\"}");
			if(session.getAttribute("tmp")!=null) target.setPassword((String)session.getAttribute("tmp"));
			try {
				result= sign_Service.updateProfile(target);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(result);
			//resultMap.put("result", 300);
		}else if(command.equals("no")){
			String swap = (String)session.getAttribute("old_url");
			session.invalidate();
			session.setAttribute("old_url",swap);
			resultMap.put("result", 300);
			resultMap.put("redirect", "/reset/login/"); // TODO reset 지워야됨.
		}else {
			session.invalidate();
			
		}
		
		
		
		return resultMap;
	}
	
	@RequestMapping(value ="/login/find/", method=RequestMethod.POST) // ajax
	@ResponseBody
	public Map<String, Object> showFind(HttpServletRequest req, Model model) {
		Map<String, Object> resultMap = new HashMap<String,Object>();
		String resultString = "";
		resultString = sign_Service.findPw(req);
		resultMap.put("result",resultString);
		return resultMap;
	}
	
	
	
}
