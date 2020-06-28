package mx.uaq.uavig.model.vo;

import lombok.Data;
import mx.uaq.uavig.model.Rol;
import mx.uaq.uavig.model.Usuario;

@Data
public class RolUsuarioVO {

	private Long idRol;
	private Long idUsuario;
	private Rol rol;
	private Usuario usuario;
	
}
