package mx.uaq.uavig.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;
import mx.uaq.uavig.model.Usuario;

@Data
@NoArgsConstructor
public class SessionVO {

	private Usuario usuario;
	private String anio = new SimpleDateFormat("yyyy").format(new Date());
	
	public SessionVO(Usuario usuario) {
		super();
		this.usuario = usuario;
	}
}