package ga.beauty.reset.utils.runner;

import java.util.List;

import org.springframework.stereotype.Component;

@Component(value="comment_Lsn")
public class Comment_Listener implements Common_Listener{

	public Comment_Listener() {
	}
	
	@Override
	public void addLog() throws Exception {
		
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
		
	}

	@Override
	public void finalize() throws Throwable {
		super.finalize();
	}
	
	
}
