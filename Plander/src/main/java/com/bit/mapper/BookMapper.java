package com.bit.mapper;

import java.util.List;
import java.util.Map;

import com.bit.domain.BookingVO;

public interface BookMapper {
	
	//전체 좌석 수 확인
	public int seatCnt(Map<String, Integer> map);
	//예약된 좌석 수(개인실)
	public int bookoneCnt(BookingVO bvo);
	//예약된 좌석 조회(개인실)
	public List<BookingVO> bookone(BookingVO bvo);
	
	public int bookroomCnt(BookingVO bvo);
	public List<BookingVO> bookroom(BookingVO bvo);
	
	//선택 정보 조회
	public List<BookingVO> myseat(BookingVO bvo);
	
	
}
