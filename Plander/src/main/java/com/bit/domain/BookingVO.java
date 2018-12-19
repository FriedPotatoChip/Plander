package com.bit.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BookingVO {
	private int bk_idx;
	private String id, s_row;
	
	//좌석 조회
	private int br_idx, s_col, sct_idx;
	//SEATS_VIEW
	private String br_name, sct_name;
	//날짜 선택
	private String date, start_time, end_time, bk_regdate;
}
