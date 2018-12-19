package com.bit.service;

import com.bit.domain.SeatsCategoryVO;

public interface BookService {
	
	//전체 좌석 수 확인
	public int seatCnt(int br_idx, int sct_idx);
	//예약된 좌석 수
	public int bookSeatCnt(int sct_idx);
	//예약된 좌석 조회
	public int bookSeat();
	
	//방 조회 
	public SeatsCategoryVO room();

}
