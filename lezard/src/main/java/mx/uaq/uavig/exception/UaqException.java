package mx.uaq.uavig.exception;

import lombok.Getter;
import lombok.Setter;
import uaq.mx.uaqvig.enums.EnumMensajeError;

@Getter
@Setter
public class UaqException extends RuntimeException {

	private static final long serialVersionUID = 1L;
	private EnumMensajeError mensajeError;
	
	public UaqException(final Throwable e) {
		super(e);
	}
	
	public UaqException(final String message) {
		super(message);
	}
	
	public UaqException(final EnumMensajeError mensajeError) {
		this.mensajeError = mensajeError;
	}
	
	public UaqException(final EnumMensajeError mensajeError, final Throwable e) {
		super(e);
		this.mensajeError = mensajeError;
	}
}