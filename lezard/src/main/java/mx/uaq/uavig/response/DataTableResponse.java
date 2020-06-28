package mx.uaq.uavig.response;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DataTableResponse {

	private long recordsTotal = 100000l;
	private long recordsFiltered = 0;
	private int draw;
	private List<? extends Object> data = new ArrayList<>();
	
	public DataTableResponse(final String draw) {
		this.draw = Integer.parseInt(draw);
	}
	
	public DataTableResponse(final DataTableParams tableParams, final List<? extends Object> list,
			final long recordsFiltered) {
		this(tableParams.getDraw());
		this.data = list;
		this.recordsFiltered = recordsFiltered;
		if(this.data.size() < tableParams.getLimit()) {
			this.recordsTotal = (long) tableParams.getOffset() + this.data.size();
		}
	}
}