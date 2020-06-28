package uaq.mx.uaqvig.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum EnumEstatusCaso {
	
	EN_CAPTURA(1L,"EN CAPTURA"),
	EN_PROCESO(2L,"EN PROCESO"),
	EN_INVESTIGACION(3L,"EN INVESTIGACIÓN"),
	FINALIZADO(4L,"FINALIZADO");
	
	private Long idEstatus;
	private String estatus;
	
	public static String getEstatusPorId(Long idEstatus) {
		if(idEstatus == 1L) {
			return EN_CAPTURA.estatus;
		}else if(idEstatus == 2L) {
			return EN_PROCESO.estatus;
		}else 	if(idEstatus == 3L) {
			return EN_INVESTIGACION.estatus;
		}else 	if(idEstatus == 4L) {
			return FINALIZADO.estatus;
		}else {
			return null;
		}
	}

}
