package mx.uaq.uavig.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;

import mx.uaq.uavig.dao.UsuarioDAO;
import mx.uaq.uavig.model.Usuario;
import mx.uaq.uavig.security.authentication.CustomUserDetails;

public class LezardController {
	
	@Autowired private UsuarioDAO usuarioDAO;

	public CustomUserDetails getLogin() {
		try {
			return (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		}catch(Exception e) {
			return null;
		}
	}
	
	protected String getAnio() {
		 String anio = new SimpleDateFormat("yyyy").format(new Date());
		 return anio;
	}
	
	protected Usuario getUsuarioLogin() {
		if(getLogin() != null) {
			return this.usuarioDAO.findOne(getLogin().getIdUsuario());
		}
		return null;
	}
	

}
