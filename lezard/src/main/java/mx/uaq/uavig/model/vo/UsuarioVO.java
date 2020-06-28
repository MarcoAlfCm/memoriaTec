package mx.uaq.uavig.model.vo;

import java.util.List;

import lombok.Data;

@Data
public class UsuarioVO {

	private Long idUsuario;
	private String clave;
	private String correo;
	private String nombre;
	private String apellidoPaterno;
	private String apellidoMaterno;
	private String adscripcion;
	private String tipo;
	private String nombreCompleto;
	private String edificio;
	private Long rol;
	private String telefono;
	private String descripAdscrip;
	private List<Long> rolList;


	
	
	
	
	
}
