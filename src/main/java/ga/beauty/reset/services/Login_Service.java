package ga.beauty.reset.services;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface Login_Service {

	// public void logout();
	// public void getProfile();
	// public void getEmail();
	public String login(Model model, HttpServletRequest req) throws Exception;
	
}
