package mx.uaq.uavig.security.authentication;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvider;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import mx.uaq.uavig.business.UsuarioBusiness;
import mx.uaq.uavig.service.NipAuthentication;



public class AuthenticationProvider  extends AbstractUserDetailsAuthenticationProvider{

	@Autowired private UsuarioBusiness usuarioBusiness;
	@Autowired private UserDetailsService userDetailsService;
	@Autowired private NipAuthentication nipAuthenticationService;
	
	@Override
	protected void  additionalAuthenticationChecks(UserDetails userDetails,
			UsernamePasswordAuthenticationToken authentication) throws AuthenticationException {
		ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = attributes.getRequest();
		
		Boolean responseNipAuthentication = nipAuthenticationService.validaCredenciales(
				authentication.getPrincipal().toString(),
				authentication.getCredentials().toString());
//Aqui si entra
		if(!responseNipAuthentication) {

			usuarioBusiness.processUserAutenticationFailure(authentication.getPrincipal().toString());
			throw new BadCredentialsException("Authentication service reply: "+responseNipAuthentication);
		}
	}
		
	@Override
	protected UserDetails retrieveUser(String username, 
			UsernamePasswordAuthenticationToken authentication) throws AuthenticationException {
		return userDetailsService.loadUserByUsername(username);
	}
	

}
