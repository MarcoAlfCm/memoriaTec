package mx.uaq.uavig.dao.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.security.authentication.DisabledException;
import org.springframework.stereotype.Repository;

import mx.uaq.uavig.dao.AlumnoDAO;
import mx.uaq.uavig.dao.UsuarioDAO;
import mx.uaq.uavig.model.Alumno;
import mx.uaq.uavig.model.Usuario;
import uaq.mx.uaqvig.enums.EnumEstatusUsuario;

@Repository
@Profile({"local","dev","qa"})
public class NipAuthenticationDAOfake extends NipAuthenticationDAO {


	@Autowired private UsuarioDAO usuarioDAO;
	@Autowired private AlumnoDAO alumnoDAO;;

	public Boolean validaNipUsuario(final String clave, final String nip) {
		
		if(validaMaestro(clave, nip)) {
			return validaMaestro(clave, nip);
		}else {
			return validaAlumno(clave, nip);
		}
		
	}
	
	public Boolean validaMaestro(final String clave, final String nip){
		Usuario usuario = usuarioDAO.findOneByClave(clave);

		if(usuario != null) {
			if(usuario.getEstatus().equals(EnumEstatusUsuario.BLOQUEADO.getEstatus())) {
				
				throw new DisabledException("Authentication service reply.");
			} else {
						return nip.contentEquals("mate") ? true : false;
				
			}
		}
		return false;
	}
	
	public Boolean validaAlumno(final String clave, final String nip){
		Alumno alumno = alumnoDAO.findOneByClave(clave);
		
		if(alumno != null) {
			if(alumno.getEstatus().equals(EnumEstatusUsuario.BLOQUEADO.getEstatus())) {
				
				throw new DisabledException("Authentication service reply.");
			} else {
				return nip.contentEquals("mate") ? true : false;
				
			}
		}
		return false;
	}
	
		
	public Boolean consultaUsuarioInterno(final String nip, final String passUsu ) {
		if(nip.equals(passUsu)) {
			return true;
		}		
	return	false;
	}
	


}
