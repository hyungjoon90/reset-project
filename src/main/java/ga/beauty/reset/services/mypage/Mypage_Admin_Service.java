package ga.beauty.reset.services.mypage;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public class Mypage_Admin_Service {
// 권한으로 CEO, 직원 구별한다

	public Map<String, Object> getInfo(String command, HttpSession session, HttpServletRequest req) {
		return null;
	}	
	
	
}
