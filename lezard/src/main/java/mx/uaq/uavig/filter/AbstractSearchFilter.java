package mx.uaq.uavig.filter;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AbstractSearchFilter {

	private Integer offset;
	private Integer limit;
	
	public String getPattern(String original) {
		return new StringBuilder("%").append(original).append("%").toString();
	}
}