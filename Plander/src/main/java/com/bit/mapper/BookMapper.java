package com.bit.mapper;

import java.util.List;
import java.util.Map;

import com.bit.domain.BookingVO;
import com.bit.domain.SeatsCategoryVO;

public interface BookMapper {
	
	//전체 좌석 수 확인
	public int seatCnt(Map<String, Integer> map);
	//예약된 좌석 수
	public int bookSeatCnt(BookingVO bvo);
	//예약된 좌석 조회
	//public List<BookingVO> bookSeat(int sct_idx);
	public List<BookingVO> bookSeat(BookingVO bvo);
	
	//방 조회 
	public SeatsCategoryVO room();

}
