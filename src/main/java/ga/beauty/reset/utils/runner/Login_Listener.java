package ga.beauty.reset.utils.runner;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

@Component(value="login_Lsn")
public class Login_Listener implements HttpSessionListener, Common_Listener{

	private static final Logger logger = Logger.getLogger(Login_Listener.class);
    private static final Map<String, HttpSession> SESSIONS = new HashMap<>();

    public void sessionCreated(HttpSessionEvent event) {
        HttpSession session = event.getSession();
        synchronized(this){
        	logger.info("@login@"+"");
        	SESSIONS.put(session.getId(),session);
        }
    }

    public void sessionDestroyed(HttpSessionEvent event) {
        HttpSession session = event.getSession();
        synchronized(this){
        	SESSIONS.remove(session.getId());
        }
    }

    public int getActiveSessionNumber() {
        return SESSIONS.size();
    }
    
    public int getLoginSessionNumber() {
    	Set<String> keySet = SESSIONS.keySet();
    	Iterator<String> iteS = keySet.iterator();
    	int count = 0;
    	while(iteS.hasNext()) {
    		HttpSession session = SESSIONS.get(iteS.next());
    		if(session.getAttribute("login_on")!=null)count++;
    	}
    	return count;
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
