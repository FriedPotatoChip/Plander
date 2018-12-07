package com.bit.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Planner_dVO {
	
	private int pd_idx;
	@DateTimeFormat(pattern = "HH:mm")
	private Date pd_start_time;
	@DateTimeFormat(pattern = "HH:mm")
	private Date pd_end_time;
	private String pd_content;
	private int p_idx;
	private int ctd_idx;
	
}
