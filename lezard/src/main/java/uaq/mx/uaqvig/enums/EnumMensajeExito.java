package uaq.mx.uaqvig.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum EnumMensajeExito {
	
	USUARIO_REGISTRADO(1L, "El usuario ha sido registrado correctamente."),
	USUARIO_ACTUALIZACION(2L, "El usuario ha sido actualizado correctamente."),
	USUARIO_ACTIVADO(3L, "El usuario ha sido activado correctamente."),
	USUARIO_INACTIVADO(4L, "El usuario ha sido inactivado correctamente."),
	CASO_REGISTRADO(5L,"EL caso ha sido registrado correctamente."),
	NOTICIA_REGISTRADA(6L,"La noticia ha sido registrada correctamente."),
	CASO_ESTATUS_ACTUALIZAR(7L,"Se actualizo el estatus correctamente.");
	
	private final Long idMsg;
	private final String value;
	
	public String toString() {
		return this.value;
	}
	
	public static EnumMensajeExito getByIdMsg(Long idMsg) {
		for(EnumMensajeExito me : EnumMensajeExito.values()) {
			if(me.idMsg.equals(idMsg))
				return me;
		}
		
		return null;
	}
	
	public static EnumMensajeExito getByValue(String value) {
		for(EnumMensajeExito me : EnumMensajeExito.values()) {
			if(me.value.equalsIgnoreCase(value))
				return me;
		}
		
		return null;
	}
}