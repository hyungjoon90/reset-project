package ga.beauty.reset.services;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface Login_Service {

	public Model logout(Model model, HttpServletRequest req, HttpServletResponse resp);
	// public void getProfile();
	// public void getEmail();
	public Model login(Model model, HttpServletRequest req, HttpServletResponse resp) throws Exception;
	
}
