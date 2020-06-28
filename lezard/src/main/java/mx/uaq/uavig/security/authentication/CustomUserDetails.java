package mx.uaq.uavig.security.authentication;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomUserDetails extends User {
	
	private static final long serialVersionUID = 1L;
	private Long idUsuario;

	public CustomUserDetails(final String username, final String password, final boolean enabled,
			final boolean accountNonLocked, final Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, true, true, accountNonLocked, authorities);
	}	
}
