package com.bit.service;

import java.util.List;

import com.bit.domain.BookingVO;
import com.bit.domain.SeatsCategoryVO;

public interface BookService {
	
	//전체 좌석 수 확인
	public int seatCnt(int br_idx, int sct_idx);
	//예약된 좌석 수
	public int bookoneCnt(BookingVO bvo);
	//예약된 좌석 조회
	//public List<BookingVO> bookSeat(int sct_idx);
	public List<BookingVO> bookone(BookingVO bvo);
	
	public int bookroomCnt(BookingVO bvo);
	public List<BookingVO> bookroom(BookingVO bvo);
	
}
