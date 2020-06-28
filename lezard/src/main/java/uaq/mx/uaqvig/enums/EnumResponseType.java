package uaq.mx.uaqvig.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum EnumResponseType {

	SUCCESS(1L, "success"),
	ERROR(2L, "error"),
	NOTIFICATION(3L, "notification"),
	WARNING(4L, "warning");
	
	private final Long key;
	private final String value;
}