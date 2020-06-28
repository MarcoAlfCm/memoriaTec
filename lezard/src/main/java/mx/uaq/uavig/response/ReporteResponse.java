package mx.uaq.uavig.response;

import java.io.InputStream;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ReporteResponse {
	
	private String nombreForUser;
	private InputStream inputStreamFile;
}
