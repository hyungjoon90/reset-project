package ga.beauty.reset.services.mypage;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public class Mypage_Admin_Service {
// 권한으로 CEO, 직원 구별한다

	// 접속자수 / 로그인 수 / 숫자 등등
	public int getInfoAsInt(String command, HttpSession session, HttpServletRequest req) {

		return 0;
	}
	
	
	// 통계 객체로 필요한것들 18-01 18-02 등등
	// 이때 맵은 data : List인데 이놈을 컨트롤러에서 objectMapper로 처리한다.
	public Map<String, Object> getInfoAsMap(String command, HttpSession session, HttpServletRequest req) {
		return null;
	}	
	
	
}// Mypage_Admin_service
