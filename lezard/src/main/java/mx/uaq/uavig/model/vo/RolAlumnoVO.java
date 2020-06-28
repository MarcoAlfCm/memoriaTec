package mx.uaq.uavig.model.vo;

import lombok.Data;
import mx.uaq.uavig.model.Alumno;
import mx.uaq.uavig.model.Rol;

@Data
public class RolAlumnoVO {

	private Long idRol;
	private Long idAlumno;
	private Rol rol;
	private Alumno alumno;
	
}
