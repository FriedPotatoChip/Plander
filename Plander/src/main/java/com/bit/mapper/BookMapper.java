package com.bit.mapper;

import java.util.Map;

import com.bit.domain.SeatsCategoryVO;

public interface BookMapper {
	
	//전체 좌석 수 확인
	public int seatCnt(Map<String, Integer> map);
	//예약된 좌석 수
	public int bookSeatCnt(int sct_idx);
	//예약된 좌석 조회
	public int bookSeat();
	
	//방 조회 
	public SeatsCategoryVO room();

}
