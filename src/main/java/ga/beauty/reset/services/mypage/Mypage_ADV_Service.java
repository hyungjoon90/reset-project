package ga.beauty.reset.services.mypage;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.w3c.dom.events.EventTarget;

import ga.beauty.reset.dao.Common_Dao;
import ga.beauty.reset.dao.entity.Eve_addr_Vo;
import ga.beauty.reset.dao.entity.Event_Vo;
import ga.beauty.reset.dao.entity.Magazine_Vo;

@Service
public class Mypage_ADV_Service {
	@Autowired
	Common_Dao<Event_Vo> eveDao;
	
	@Autowired
	Common_Dao<Magazine_Vo> magDao;
	
	@Autowired
	Common_Dao<Eve_addr_Vo> eveaddrDao;
	
	
	// 이벤트의 관한 정보만 보여준다.
	public Map<String, Object> getInfo(String command, HttpSession session, HttpServletRequest req) throws SQLException {
		//session에 있는 이메일을 잡아서 대입해줘야함.
		HashMap<String, Object> map =new HashMap<String, Object>();
		String com_email=(String) session.getAttribute("login_email");
		
		Event_Vo evebean = new Event_Vo();
		evebean.setCom_email(com_email);
		//이벤트 리스트
		map.put("EventList", eveDao.selectAll(evebean));
		
		Magazine_Vo magbean = new Magazine_Vo();
		magbean.setCom_email(com_email);
		
		//매거진 리스트
		map.put("MagList", magDao.selectAll(magbean));
		
		Eve_addr_Vo eveaddrbean = new Eve_addr_Vo();
		eveaddrbean.setEve_no(evebean.getEve_no());
		//이벤트 참가자 리스트
		map.put("Eveaddr", eveaddrDao.selectAll(eveaddrbean));
		
		//이벤트 참가자 숫자
		map.put("EveaddrCount", eveaddrDao.getCount(evebean.getEve_no()));
		
		return map;
	}
	
	public List<Magazine_Vo> Maglist(Model model, Magazine_Vo bean) throws SQLException{
		return magDao.selectAll(bean);
	}
	public List<Event_Vo> Eventlist(Model model, Event_Vo bean) throws SQLException{
		return eveDao.selectAll(bean);
	}

}
