package mx.uaq.uavig.security.authentication;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import mx.uaq.uavig.dao.AlumnoDAO;
import mx.uaq.uavig.dao.UsuarioDAO;
import mx.uaq.uavig.model.Alumno;
import mx.uaq.uavig.model.Rol;
import mx.uaq.uavig.model.Usuario;
import uaq.mx.uaqvig.enums.EnumEstatusUsuario;



@Transactional
public class CustomUserDetailsService implements UserDetailsService {
	
@Autowired private UsuarioDAO usuarioDAO;
@Autowired private AlumnoDAO alumnoDAO;

	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
	 Usuario usuario = null;
	 Alumno alumno =null;
	 UserDetails userDetails=null;
	 usuario=usuarioDAO.findOneByClave(username);
		if(usuario == null) {
			alumno=alumnoDAO.findOneByClave(username);
			if(alumno==null) {
			throw new UsernameNotFoundException("Usuario no encontrado " + username);
			}else {
				userDetails	 = createUserDetailsA(username, alumno, createGrantedAuthoritiesA(alumno));	
			}
		}else {
			 userDetails = createUserDetails(username, usuario, createGrantedAuthorities(usuario));
		}

		
		return userDetails;
	}
	
	private List<GrantedAuthority> createGrantedAuthorities(final Usuario userFromDB) {
		List<GrantedAuthority> authorities = new ArrayList<>();
		for(Rol rol : userFromDB.getRoles())
			authorities.add(new SimpleGrantedAuthority(rol.getNombre()));
		return authorities;
	}
	
	private List<GrantedAuthority> createGrantedAuthoritiesA(final Alumno userFromDB) {
		List<GrantedAuthority> authorities = new ArrayList<>();
		for(Rol rol : userFromDB.getRoles())
			authorities.add(new SimpleGrantedAuthority(rol.getNombre()));
		return authorities;
	}
	
	private UserDetails createUserDetails(final String login, final Usuario userFromDB,
			List<GrantedAuthority> authorities) {
		CustomUserDetails uaqUserDetails;
		boolean accountEnabled = true;
		EnumEstatusUsuario estatus = EnumEstatusUsuario.valueOf(userFromDB.getEstatus());
		if(!(estatus.equals(EnumEstatusUsuario.BLOQUEADO)))
			uaqUserDetails = new CustomUserDetails(login + " " + userFromDB.getClave(), "noPassword", accountEnabled, true, authorities);
		else
			uaqUserDetails = new CustomUserDetails(login,  "", true, false, authorities);
			
		uaqUserDetails.setIdUsuario(Long.valueOf(userFromDB.getIdUsuario()));
		return uaqUserDetails;
	}
	private UserDetails createUserDetailsA(final String login, final Alumno userFromDB,
			List<GrantedAuthority> authorities) {
		CustomUserDetails uaqUserDetails;
		boolean accountEnabled = true;
		EnumEstatusUsuario estatus = EnumEstatusUsuario.valueOf(userFromDB.getEstatus());
		if(!(estatus.equals(EnumEstatusUsuario.BLOQUEADO)))
			uaqUserDetails = new CustomUserDetails(login + " " + userFromDB.getClave(), "noPassword", accountEnabled, true, authorities);
		else
			uaqUserDetails = new CustomUserDetails(login,  "", true, false, authorities);
		
		uaqUserDetails.setIdUsuario(Long.valueOf(userFromDB.getIdAlumno()));
		return uaqUserDetails;
	}

}
