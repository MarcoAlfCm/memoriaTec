package mx.uaq.uavig.controller;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DataResultFilter<T> {

	private long recordsTotal;
	private List<T> data = new ArrayList<>();
}