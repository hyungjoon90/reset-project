package ga.beauty.reset.utils.runner;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

@Component(value="login_Lsn")
public class Login_Listener implements Common_Listener{

	// 일마다 로그인 한 사람들 총수
	// 월마다 다 더해서 하나 만들기
	
	private static final Logger logger = Logger.getLogger(Login_Listener.class);
	private int loginmaxDayCount = 0;
	
	private String defaultFP = "c:/reset/report/login/";
	
	private SimpleDateFormat sdfY = new SimpleDateFormat("yyyy");
	private SimpleDateFormat sdfM = new SimpleDateFormat("MM");
	private SimpleDateFormat sdfD = new SimpleDateFormat("dd");
	private SimpleDateFormat sdfAll = new SimpleDateFormat("yyyy-MM-dd");
	
	public Login_Listener() {
		Date date = new Date();
		String filenameForMax = sdfY.format(date)+"/"+sdfM.format(date)+"/max.json";
		File fileForLoginMax = new File(filenameForMax);
		if(fileForLoginMax.exists()) {}
	}

	@Override
	public void addLog() throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public <T> List<T> getLogsAll() throws Exception {
		return null;
	}

	@Override
	public <T> List<T> getLogsWithCount(int recentIdx, int counts) throws Exception {
		return null;
	}

	@Override
	public void saveLogOneday() throws Exception {
		// TODO Auto-generated method stub
	}
	
	@Override
	public void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
	}

	
}
