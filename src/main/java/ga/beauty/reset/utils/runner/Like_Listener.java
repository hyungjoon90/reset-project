package ga.beauty.reset.utils.runner;

import java.util.List;

import org.springframework.stereotype.Component;

@Component(value="like_Lsn")
public class Like_Listener implements Common_Listener{

	// 좋아요 총량 / 일별 증가량
	
	@Override
	public void addLog() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public <T> List<T> getLogsAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> List<T> getLogsWithCount(int recentIdx, int counts) throws Exception {
		// TODO Auto-generated method stub
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
