package com.bit.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.BookingVO;
import com.bit.domain.SeatsCategoryVO;
import com.bit.mapper.BookMapper;
import com.bit.service.BookService;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookMapper bookmapper;
	
	//전체 좌석 수 확인
	@Override
	public int seatCnt(int br_idx, int sct_idx) {
		System.out.println("seatCnt() : Impl 까지 옴!");
		System.out.println("br_idx : " + br_idx + ", sct_idx : " + sct_idx);
		Map<String, Integer> map = new HashMap<>();
		map.put("br_idx", br_idx);
		map.put("sct_idx", sct_idx);
		
		return bookmapper.seatCnt(map);
	}
	
	//예약된 좌석 수(개인실)
	@Override
	public int bookoneCnt(BookingVO bvo) {
		System.out.println("***** bookoneCnt() : Impl 까지 옴!");
		return bookmapper.bookoneCnt(bvo);
	}

	@Override
	public List<BookingVO> bookone(BookingVO bvo) {
		System.out.println("***** bookone() : Impl 까지 옴!");
		return bookmapper.bookone(bvo);
	}
	
	//예약된 좌석 수(랩실)
	@Override
	public int bookroomCnt(BookingVO bvo) {
		System.out.println("***** bookroomCnt() : Impl 까지 옴!");
		return bookmapper.bookroomCnt(bvo);
	}

	@Override
	public List<BookingVO> bookroom(BookingVO bvo) {
		System.out.println("***** bookroom() : Impl 까지 옴!");
		return bookmapper.bookroom(bvo);
	}


}