package mx.uaq.uavig.security.authentication;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import mx.uaq.uavig.business.UsuarioBusiness;
import mx.uaq.uavig.config.SecurityConfig;
import uaq.mx.uaqvig.enums.EnumRolUsuario;



@Component
public class UaqWebUrlAuthenticationSuccessHandler implements AuthenticationSuccessHandler{

	@Autowired private UsuarioBusiness usuarioBusiness;
	private RedirectStrategy redirectStartegy = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		handle(request, response, authentication);
		clearAuthenticationAttributes(request);
		
	}
	
	protected void handle(HttpServletRequest request, HttpServletResponse response, 
			Authentication authentication) throws IOException {
		String targetUrl = determineTargetUrl(authentication);
		resetIntentosFallidos(request);
		if(response.isCommitted())
			return;
		
		redirectStartegy.sendRedirect(request, response, targetUrl);
	}
//		private void reiniciarIntentosFallidos(HttpServletRequest request) {
//		//usuarioBusiness.reiniciarIntentosFallidos(request.getParameter("username"));
//	}
	
	protected String determineTargetUrl(Authentication authentication) {
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		
		for(GrantedAuthority grantedAuthority : authorities) {
//			System.out.println("Este es el usuario que no deja entrar:"+grantedAuthority.getAuthority());
//			System.out.println("Este es el rol que ya esta :"+EnumRolUsuario.ROLE_ADMINISTRADOR.getTipoRol());
			if(EnumRolUsuario.ROLE_ADMINISTRADOR.getTipoRol().equals(grantedAuthority.getAuthority()))
				return "/admin/dashboard?inicioSesion";
			if(EnumRolUsuario.ROLE_MAESTRO.getTipoRol().equals(grantedAuthority.getAuthority()))
				return "/maestro/dashboard?inicioSesion";
			if(EnumRolUsuario.ROLE_ALUMNO.getTipoRol().equals(grantedAuthority.getAuthority()))
				return "/alumno/dashboard?inicioSesion";
		}
		return SecurityConfig.LOGOUT_PERMISO_DENEGADO;
	}

	private void resetIntentosFallidos(HttpServletRequest request) {
		usuarioBusiness.resetFallos(request.getParameter("username"));
	}
	
	protected void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session == null)
			return;
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}

}
