package com.bit.mapper;

import java.util.List;
import java.util.Map;

import com.bit.domain.BookingCbVO;
import com.bit.domain.BookingVO;
import com.bit.domain.CabinetVO;
import com.bit.domain.SeatsVO;

public interface BookMapper {
	
	//전체 좌석 수 확인
	public int seatCnt(Map<String, Integer> map);
	
	//예약된 좌석 수(개인실)
	public int bookoneCnt(BookingVO bvo);
	//예약된 좌석 조회(개인실)
	public List<BookingVO> bookone(BookingVO bvo);
	
	//예약된 좌석 조회(랩실)
	public int bookroomCnt(BookingVO bvo);
	public List<BookingVO> bookroom(BookingVO bvo);
	
	//선택 정보 조회
	public List<BookingVO> myseat(BookingVO bvo);
	//예약완료
	public int bookOk(BookingVO bvo);
	//사물함 예약
	public int bookCabinet(BookingCbVO cb_bvo);
	
	//예약 안된 사물함 조회 
	public List<CabinetVO> not_bookCb(CabinetVO cvo);
	
	//s_idx
	public SeatsVO seatnum(Map<String, Integer> map);
	
	
	
	
}
