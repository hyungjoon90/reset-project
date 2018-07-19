package ga.beauty.reset;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import ga.beauty.reset.utils.LogEnum;
import ga.beauty.reset.utils.runner.Login_Listener;

public class Session_Listener implements HttpSessionListener{

	Logger logger = Logger.getLogger(Session_Listener.class);
	private static final Map<String, HttpSession> SESSIONS = new HashMap<>();
	// 현재 접속자수 / 로그인수 만 보여주는 놈
	// 
	// TODO 임시용
	Login_Listener login_Lsn;
	
	public Session_Listener() {
	}
    
    public void sessionCreated(HttpSessionEvent event) {
        if(login_Lsn==null) Login_Listener.getThis();
    	HttpSession session = event.getSession();
        synchronized(this){
        	try {
				login_Lsn.addLog(null, "num", 1);
			} catch (Exception e) {
				logger.error(LogEnum.ERROR+" "+e.getCause());
			}
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
        synchronized(this){
	    	while(iteS.hasNext()) {
	    		HttpSession session = SESSIONS.get(iteS.next());
	    		if(session.getAttribute("login_on")!=null)count++;
	    	}
        }
    	return count;
    }
}// Session_Linstener
