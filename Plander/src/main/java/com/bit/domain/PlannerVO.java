package com.bit.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class PlannerVO {

	private int p_idx;
	private String p_title;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date p_start_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")	
	private Date p_end_date;
	private Date regdate;
	private int u_idx;
	private int ct_idx;
	
	
	
}
