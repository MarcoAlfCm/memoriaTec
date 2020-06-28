package mx.uaq.uavig.filter;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UsuarioFilter extends AbstractSearchFilter{
	private String clave;
	private String nombre;
//	private String correo;
	private String idRol;
	private String idAdscripcion;
	private String estatus;
	private String tipo;
	

}
