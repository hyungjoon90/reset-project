package ga.beauty.reset.utils.runner;

import java.util.List;

public interface Common_Listener {

	void addLog() throws Exception;
	<T> List<T> getLogsAll() throws Exception;
	<T> List<T> getLogsWithCount (int recentIdx, int counts) throws Exception;
	void saveLogOneday() throws Exception;
	void finalize() throws Throwable;
}
