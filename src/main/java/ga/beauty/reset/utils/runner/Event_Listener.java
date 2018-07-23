package ga.beauty.reset.utils.runner;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import ga.beauty.reset.dao.entity.Event_Vo;

@Component(value="event_Lsn")
public class Event_Listener implements Common_Listener{

	// yy/MM/dd/event/eveno.json
	//{dates:[{no:eveno,like:,view:,num:}]}
	
	// 좋아요 총량 / 일별 증가량
	// 조회수 총량 / 일별 증가량
	// 신청자수 총량 / 일별 증가량

	List<Event_Vo> list;
	
	@Override
	public void addLog() throws Exception {
		list = new ArrayList<Event_Vo>();
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
	public synchronized void saveLogOneday() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
	}
	
}
