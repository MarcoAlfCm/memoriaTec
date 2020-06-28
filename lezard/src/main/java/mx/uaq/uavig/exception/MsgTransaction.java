package mx.uaq.uavig.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MsgTransaction {

	private Long idMsg;
	private String status;
	private String result;
	private Integer responseCode;
	
	public MsgTransaction(Long idMsg, String status, String result) {
		super();
		this.idMsg = idMsg;
		this.status = status;
		this.result = result;
	}
}