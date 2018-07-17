package ga.beauty.reset.utils;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import com.mysql.cj.util.StringUtils;

import ga.beauty.reset.dao.Common_Dao;
import ga.beauty.reset.dao.Event_DaoImpl;
import ga.beauty.reset.dao.Magazine_DaoImpl;
import ga.beauty.reset.dao.entity.Event_Vo;
import ga.beauty.reset.dao.entity.Magazine_Vo;

@Service
public class UpdateViewUtils {
	
	@Autowired
	Common_Dao<Event_Vo> event_Dao;
	
	@Autowired
	Common_Dao<Magazine_Vo> magazine_Dao;
	
	public UpdateViewUtils() {
	}
	
	public void UpdateView(HttpServletResponse resp,HttpServletRequest req
			,String type, int no,Model model ) throws SQLException{
		Cookie cookies[] = req.getCookies();
		Map mapCookie = new HashMap();
		if(req.getCookies()!=null) {
			for(int i=0; i<cookies.length;i++) {
				Cookie obj= cookies[i];
				mapCookie.put(obj.getName(), obj.getValue());
			}
		}
		//저장된 쿠키중에 read_count 만 불러오기
		String cookie_view =(String) mapCookie.get("read_count");
		//저장될 새로운 쿠키값 생성
		String new_cookie_view ="|"+type+no;
		// 저장된 쿠키에 새로운 쿠키값이 존재하는 검사
		if(StringUtils.indexOfIgnoreCase(cookie_view, new_cookie_view)==-1) {
			
			//없을 경우 쿠키 생성
			Cookie cookie =new Cookie("read_count", cookie_view + new_cookie_view);
			
			//쿠키 유효 시간 (초단위임.)
			cookie.setMaxAge(60*60*24);
			
			resp.addCookie(cookie);
			
			//조회수 업데이트
			if(type.equals("event")) {
				updateEventView(no);
			}else if(type.equals("magazine")) {
				updateMagazineView(no);
			}
		}
	}
	
	public void updateEventView(int no) throws SQLException {
		//조회수 업데이트
		Event_Vo bean =new Event_Vo();
		bean.setEve_no(no);
		event_Dao.updateView(bean);
	}
	
	public void updateMagazineView(int no) throws SQLException {
		//조회수 업데이트
		Magazine_Vo bean =new Magazine_Vo();
		bean.setMag_no(no);
		magazine_Dao.updateView(bean);
	}
	
	
}
