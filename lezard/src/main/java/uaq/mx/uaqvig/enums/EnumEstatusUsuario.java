package uaq.mx.uaqvig.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum EnumEstatusUsuario {

	ACTIVO(1L, "ACTIVO"),
	BLOQUEADO(2L,"BLOQUEADO");
	
	private Long idEstatus;
	private String estatus;
}