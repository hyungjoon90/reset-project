package ga.beauty.reset.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import ga.beauty.reset.dao.entity.Members_Vo;
import ga.beauty.reset.services.mypage.Mypage_ADV_Service;
import ga.beauty.reset.services.mypage.Mypage_NOR_Service;

@Controller
public class Mypage_Controller {

	private static final Logger logger = Logger.getLogger(Mypage_Controller.class);
	
	@Autowired
	Mypage_NOR_Service mypage_NOR_Service;
	@Autowired
	Mypage_ADV_Service mypage_ADV_Service; 
	ObjectMapper mapper=new ObjectMapper();
	
	public Mypage_Controller() {
	}
	
/*	@RequestMapping(value = "/mypage/", method = RequestMethod.GET)
	public String showMain(@SessionAttribute(name="user_type") String user_type, Model model) {
		model.addAttribute("goRoot","../");
		if("CEO".equals(user_type) || "직원".equals(user_type)) {
			return "redirect:/admin/";
		}else if("광고주".equals(user_type)) {
			return "mypage/mypage_Adv_main";
		}else if("일반".equals(user_type)) {
			return "mypage/mypage_nor_main";
		}else {
			// TODO 에러
			model.addAttribute("goRoot","./");
			return "errPage";
		}
	}// showMain()
*/	
	@RequestMapping(value = "/mypage/", method = RequestMethod.GET)
	public String showMain(Model model, HttpSession session, HttpServletRequest req) throws SQLException, JsonProcessingException {
		model.addAttribute("goRoot","../");
		/*if("CEO".equals(user_type) || "직원".equals(user_type)) {
			return "redirect:/admin/";
		}else if("광고주".equals(user_type)) {
			return "mypage/mypage_Adv_main";
		}else if("일반".equals(user_type)) {
			return "mypage/mypage_nor_main";
		}else {
			// TODO 에러
			model.addAttribute("goRoot","./");
			return "errPage";
		}*/
		model.addAttribute("goRoot","../");
		model.addAttribute("alist", mapper.writeValueAsString(mypage_NOR_Service.getInfo("", session, req)));
		return "mypage/mypage_test";
	}// showMain()
	
	@RequestMapping(value= "/mypage/{command}/", method=RequestMethod.POST) // ajax
	@ResponseBody
	public Map<String, Object> showInfoForCommand(@PathVariable String command, HttpSession session, HttpServletRequest req) throws SQLException {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String userType = (String)session.getAttribute("login_user_type");
		
		if(userType.equals("광고주")) resultMap= mypage_ADV_Service.getInfo(command,session,req);
		else if(userType.equals("일반")) resultMap= mypage_NOR_Service.getInfo(command,session,req);
		
		if(resultMap!=null && resultMap.size()>0)	resultMap.put("result", 200);
		else resultMap.put("result", 404);
		return resultMap;
	}// 
	
	
	
}// 순수 마이페이지 --> 정보조회용
