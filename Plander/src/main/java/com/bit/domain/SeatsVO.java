package com.bit.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class SeatsVO {
	private int s_idx, br_idx, s_col;
	private String sct_idx;
	
	//날짜 선택
	private String date;
}
