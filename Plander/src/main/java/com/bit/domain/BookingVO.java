package com.bit.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BookingVO {
	private int bk_idx;
	private String id, booknum;
	
	//좌석 조회
	private int br_idx, sct_idx, time_idx, roomnum, price, cabinet, review;
	//SEATS_VIEW
	private String br_name, sct_name, name;
	//날짜 선택
	private String start_time, end_time, bk_regdate;
	
	private int s_col, s_col_2, s_idx, s_idx_2;
	
	//payment 추가 항목
	private int p_idx;
	private String payment, receipt;
}
