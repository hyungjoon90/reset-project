package ga.beauty.reset.dao.entity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Login_Vo {

	private String access_token;
	private String refresh_token;

	private HttpSession userSession;
	private HttpServletRequest request;
	
	private String resultMsg;
	private int resultCode;

	public Login_Vo() {
	}

	public Login_Vo(String access_token, String refresh_token, HttpSession userSession, HttpServletRequest request,
			String resultMsg, int resultCode) {
		super();
		this.access_token = access_token;
		this.refresh_token = refresh_token;
		this.userSession = userSession;
		this.request = request;
		this.resultMsg = resultMsg;
		this.resultCode = resultCode;
	}

	public String getAccess_token() {
		return access_token;
	}

	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}

	public String getRefresh_token() {
		return refresh_token;
	}

	public void setRefresh_token(String refresh_token) {
		this.refresh_token = refresh_token;
	}

	public HttpSession getUserSession() {
		return userSession;
	}

	public void setUserSession(HttpSession userSession) {
		this.userSession = userSession;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String getResultMsg() {
		return resultMsg;
	}

	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}

	public int getResultCode() {
		return resultCode;
	}

	public void setResultCode(int resultCode) {
		this.resultCode = resultCode;
	}

	@Override
	public String toString() {
		return "Login_Vo [access_token=" + access_token + ", refresh_token=" + refresh_token + ", userSession="
				+ userSession + ", request=" + request + ", resultMsg=" + resultMsg + ", resultCode=" + resultCode
				+ "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((access_token == null) ? 0 : access_token.hashCode());
		result = prime * result + ((refresh_token == null) ? 0 : refresh_token.hashCode());
		result = prime * result + ((request == null) ? 0 : request.hashCode());
		result = prime * result + resultCode;
		result = prime * result + ((resultMsg == null) ? 0 : resultMsg.hashCode());
		result = prime * result + ((userSession == null) ? 0 : userSession.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Login_Vo other = (Login_Vo) obj;
		if (access_token == null) {
			if (other.access_token != null)
				return false;
		} else if (!access_token.equals(other.access_token))
			return false;
		if (refresh_token == null) {
			if (other.refresh_token != null)
				return false;
		} else if (!refresh_token.equals(other.refresh_token))
			return false;
		if (request == null) {
			if (other.request != null)
				return false;
		} else if (!request.equals(other.request))
			return false;
		if (resultCode != other.resultCode)
			return false;
		if (resultMsg == null) {
			if (other.resultMsg != null)
				return false;
		} else if (!resultMsg.equals(other.resultMsg))
			return false;
		if (userSession == null) {
			if (other.userSession != null)
				return false;
		} else if (!userSession.equals(other.userSession))
			return false;
		return true;
	}

	
	
	
	
}
