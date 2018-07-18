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

@Component(value="session_Lsn")
public class Session_Listener implements HttpSessionListener{

	// 현재 접속자수 / 로그인수 만 보여주는 놈
	
	private static final Logger logger = Logger.getLogger(Session_Listener.class);
    private static final Map<String, HttpSession> SESSIONS = new HashMap<>();
    
    public void sessionCreated(HttpSessionEvent event) {
        HttpSession session = event.getSession();
        synchronized(this){
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
}// Session_Linstener
