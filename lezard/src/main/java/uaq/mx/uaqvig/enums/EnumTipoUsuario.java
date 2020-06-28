package uaq.mx.uaqvig.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum EnumTipoUsuario {

	INTERNO(1L, "INTERNO"),
	EXTERNO(2L,"EXTERNO");
	
	private final Long idTipo;
	private final String descripcionTipo;
	
	
}
