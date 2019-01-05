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
	private int br_idx, s_col, s_idx, sct_idx, time_idx, roomnum, price, cabinet, review;
	//SEATS_VIEW
	private String br_name, sct_name;
	//날짜 선택
	private String start_time, end_time, bk_regdate;
	
}
