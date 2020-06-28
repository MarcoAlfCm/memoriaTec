package mx.uaq.uavig.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import mx.uaq.uavig.dao.security.NipAuthenticationDAO;

@Component
@Transactional
public class NipAuthentication {
	
@Autowired private NipAuthenticationDAO nipAuthenticationDAO;
	
	public Boolean validaCredenciales(final Object principal, final Object credentials) {
		return nipAuthenticationDAO.validaNipUsuario(principal.toString(), credentials.toString());
	}
}
