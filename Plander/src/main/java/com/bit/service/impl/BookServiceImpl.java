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
	
	//예약된 좌석 수
	@Override
	public int bookSeatCnt(BookingVO bvo) {
		System.out.println("***** bookSeatCnt() : Impl 까지 옴!");
		return bookmapper.bookSeatCnt(bvo);
	}

	@Override
	public List<BookingVO> bookSeat(BookingVO bvo) {
		System.out.println("***** bookSeat() : Impl 까지 옴!");
		return bookmapper.bookSeat(bvo);
	}

	//방 조회
	@Override
	public SeatsCategoryVO room() {
		return bookmapper.room();
	}


}
