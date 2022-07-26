package site.member.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class UserLoginFailHandler implements AuthenticationFailureHandler {

	static Logger log = LoggerFactory.getLogger(UserLoginFailHandler.class);

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
		log.debug("UserLoginFailHandler exception : " + exception);
		response.sendRedirect(request.getContextPath() + "/member/login?error=true");
	}
}
