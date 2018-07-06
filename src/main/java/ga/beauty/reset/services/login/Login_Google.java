package ga.beauty.reset.services.login;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;

import ga.beauty.reset.services.Login_Service;


@Service
public class Login_Google implements Login_Service{

	String id_token;
	private HttpSession session;
	private HttpServletRequest request;
	private Object response;
	@Override
	public Model logout(Model model, HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Model login(Model model, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		request = req;
		response = resp;
		session= req.getSession();
		id_token = req.getParameter("idtoken");
		
		String result = getEmail(id_token);
		return null;
	}

	private String getEmail(String id_token) throws GeneralSecurityException, IOException {

		JsonFactory jsonFactory = new JacksonFactory();
		HttpTransport transport = new NetHttpTransport();

		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
				.setAudience(Collections.singletonList("1051220480905-p8890ral8a45q8c1q6201a57oqg75k7f.apps.googleusercontent.com"))
				.build();

		GoogleIdToken idToken = verifier.verify(id_token);
		String email = "";
		if (idToken != null) {
			Payload payload = idToken.getPayload();
			// Print user identifier
			String userId = payload.getSubject();
			System.out.println("User ID: " + userId);
			// Get profile information from payload
			email = payload.getEmail();
			boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
			String name = (String) payload.get("name");
			String pictureUrl = (String) payload.get("picture");
			String locale = (String) payload.get("locale");
			String familyName = (String) payload.get("family_name");
			String givenName = (String) payload.get("given_name");
			System.out.println(email);
		} else {
			System.out.println("Invalid ID token.");
		}
		
		return email;

	}
	
	private void checkLoginOrSignUp() {
		
	}

}


