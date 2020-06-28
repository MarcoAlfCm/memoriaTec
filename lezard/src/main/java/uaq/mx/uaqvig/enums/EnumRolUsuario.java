package uaq.mx.uaqvig.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum EnumRolUsuario {
	
	ROLE_ADMINISTRADOR(1L, "Administrador","ROLE_ADMINISTRADOR"),
	ROLE_MAESTRO(2L,"Maestro","ROLE_MAESTRO"),
	ROLE_ALUMNO(3L,"Alumno","ROLE_ALUMNO");
	
	private final Long idRol;
	private final String descripcion;
	private final String tipoRol;

}
