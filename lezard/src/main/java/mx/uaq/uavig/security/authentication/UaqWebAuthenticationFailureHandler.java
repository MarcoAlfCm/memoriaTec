package mx.uaq.uavig.security.authentication;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;

@Configuration
public class UaqWebAuthenticationFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {

		request.setAttribute("userMessage", getUserMessage(exception));
		request.getRequestDispatcher("/login").forward(request, response);

	}

	private String getUserMessage(final AuthenticationException exception) {
//		System.out.println("hfgfh" + exception.getMessage());
		String userMessage = "Usuario o contraseña inválidos";

		if (exception instanceof BadCredentialsException)
			userMessage = "Usuario o contraseña inválidos.";
		else if (exception instanceof LockedException)
			userMessage = "Usuario bloqueado.";
		else if (exception instanceof DisabledException)
			userMessage = "Usuario eliminado temporalmente.";
		else if (exception instanceof AccountExpiredException)
			userMessage = "La cuenta ha expirado.";
		else if (exception instanceof CredentialsExpiredException)
			userMessage = "Contraseña expirada.";
		else if(exception instanceof SessionAuthenticationException)
			userMessage = "Ya cuenta con una sesión activa.";
		return userMessage;

	}

}
