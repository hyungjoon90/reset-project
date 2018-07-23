package ga.beauty.reset.services.mypage;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;

import ga.beauty.reset.Session_Listener;
import ga.beauty.reset.dao.entity.stat.Log_C_Vo;
import ga.beauty.reset.dao.entity.stat.Log_Chart;
import ga.beauty.reset.dao.entity.stat.Log_EM_Vo;
import ga.beauty.reset.dao.entity.stat.Log_File;
import ga.beauty.reset.utils.ChartFile;
import ga.beauty.reset.utils.RegexLogFile;

@Service
public class Mypage_Admin_Service {
	
	String logFile = "C:/reset/applogs/weblog.log";
	String errFile = "C:/reset/applogs/errlog.log";
	
// 권한으로 CEO, 직원 구별한다
	
	
	@Autowired
	RegexLogFile regexLogFile;
	@Autowired
	ChartFile chartFile;

	public Mypage_Admin_Service() {
	}
	
	// 접속자수 / 로그인 수 / 숫자 등등
	public int getInfoAsInt(String command, HttpSession session, HttpServletRequest req) {
		if(command.equals("login-cnt")) {
			int data = Session_Listener.getLoginSessionNumber();
			if(data!=0)	return data;
		}else if(command.equals("session-cnt")) {
			int data = Session_Listener.getActiveSessionNumber();
			if(data!=0) return data;
		}
		return 0;
	}
	
	
	// 통계 객체로 필요한것들 18-01 18-02 등등
	// 이때 맵은 data : List인데 이놈을 컨트롤러에서 objectMapper로 처리한다.
	public Map<String, Object> getInfoAsMap(String command, HttpSession session, HttpServletRequest req) {
		return null;
	}


	public List<Log_File> getLog(String command, HttpSession session, HttpServletRequest req) throws NumberFormatException, IOException, InterruptedException {
		String startNum = req.getParameter("log_start_num");
		List<Log_File> list = null;
		if(command.equals("normal")) {
			if(startNum!=null && !startNum.equals("")) {
				list = regexLogFile.getListFromLog(logFile,Integer.parseInt(startNum));
			}else {
				list = regexLogFile.getListFromLog(logFile);
			}
		}else if(command.equals("error")) {
			if(startNum!=null && !startNum.equals("")) {
				list = regexLogFile.getListFromLog(errFile,Integer.parseInt(startNum));
			}else {
				list = regexLogFile.getListFromLog(errFile);
			}		
		}
		return list;
	}

	public <T> Map<String, List<Log_Chart>> getChart(String command, HttpSession session, HttpServletRequest req) throws JsonProcessingException, IOException {
		Map<String, List<Log_Chart>> listS = null;

		String days = req.getParameter("log_day");
		int daysInt = 1;
		if(days!=null && !days.equals("")) daysInt = Integer.parseInt(days);		
		String beanType = req.getParameter("no");
		int no = -1;
		if(beanType!=null && !beanType.equals(""))no = Integer.parseInt(beanType);		
		if(no==-1){
			listS = chartFile.getDataForC(command,daysInt);
		}else{
			listS = chartFile.getDataForEM(command,daysInt);
		}
		return listS;
	}	
}// Mypage_Admin_service
