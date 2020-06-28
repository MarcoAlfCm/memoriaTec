package uaq.mx.uaqvig.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum EnumMensajeError {
			
	USUARIO_INTENTOS_FALLIDOS(1L, "Error al reiniciar el número de intentos fallidos."),
	USUARIO_BLOQUEADO(2L, "Error al bloquear el usuario."),
	USUARIO_REGISTRADO(3L, "Ocurrió un error al registrar el usuario"),
	USUARIO_ROLES_MINIMOS(4L, "No puedes dejar sin roles al usuario."),
	USUARIO_CORREO_DUPLICADO(5L, "Ya existe un usuario con ese correo electrónico."),
	USUARIO_ACTIVAR(6L, "Ocurrió un error al activar el usuario."),
	USUARIO_YA_ACTIVO(7L, "El usuario ya se encuentra como \"ACTIVO\"."),
	USUARIO_INACTIVAR(8L, "Ocurrió un error al inactivar el usuario."),
	USUARIO_YA_INACTIVO(9L, "El usuario ya se encuentra como \"INACTIVO\""),
	SIN_PERMISOS(10L, "No tienes los permisos necesarios para realizar esta acción"),
	CASO_REGISTRADO(11L,"Error al crear el caso"),
	NOTICIA_REGISTRADA(12L,"Ocurrió un error al registrar la noticia.");
		
	
	private final Long idMsg;
	private final String value;
	
	public String toString() {
		return this.value;
	}
	
	public static EnumMensajeError getByIdMsg(Long idMsg) {
		for(EnumMensajeError me : EnumMensajeError.values()) {
			if(me.idMsg.equals(idMsg))
				return me;
		}
		
		return null;
	}
	
	public static EnumMensajeError getByValue(String value) {
		for(EnumMensajeError me : EnumMensajeError.values()) {
			if(me.value.equalsIgnoreCase(value))
				return me;
		}
		
		return null;
	}
}