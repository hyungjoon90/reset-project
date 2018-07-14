package ga.beauty.reset.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

public class CookieMaker {
	public void createLoginCookie(HttpSession session ) {
		Cookie cookie = new Cookie("loginCookie", session.getId());
	}
}
