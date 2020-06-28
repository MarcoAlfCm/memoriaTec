package mx.uaq.uavig.response;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DataTableParams {

	private int start;
	private int length;
	private String draw;
	
	public int getOffset() {
		return this.start;
	}
	
	public int getLimit() {
		return this.length;
	}
}