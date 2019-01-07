package com.bit.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.BookingCbVO;
import com.bit.domain.BookingVO;
import com.bit.domain.CabinetVO;
import com.bit.domain.SeatsVO;
import com.bit.mapper.BookMapper;
import com.bit.service.BookService;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookMapper bookmapper;
	
	//전체 좌석 수 확인
	@Override
	public int seatCnt(int br_idx, int roomnum) {
		System.out.println("br_idx : " + br_idx + ", roomnum : " + roomnum);
		Map<String, Integer> map = new HashMap<>();
		map.put("br_idx", br_idx);
		map.put("roomnum", roomnum);
		
		return bookmapper.seatCnt(map);
	}
	
	//예약된 좌석 수(개인실)
	@Override
	public int bookoneCnt(BookingVO bvo) {
		return bookmapper.bookoneCnt(bvo);
	}

	@Override
	public List<BookingVO> bookone(BookingVO bvo) {
		return bookmapper.bookone(bvo);
	}
	
	//예약된 좌석 수(랩실)
	@Override
	public int bookroomCnt(BookingVO bvo) {
		return bookmapper.bookroomCnt(bvo);
	}

	@Override
	public List<BookingVO> bookroom(BookingVO bvo) {
		return bookmapper.bookroom(bvo);
	}
	
	//선택 정보 조회
	@Override
	public List<BookingVO> myseat(BookingVO bvo) {
		return bookmapper.myseat(bvo);
	}
	
	//예약완료
	@Override
	public int bookOk(BookingVO bvo) {
		return bookmapper.bookOk(bvo);
	}
	
	//사물함 예약
	@Override
	public int bookCabinet(BookingCbVO cb_bvo) {
		return bookmapper.bookCabinet(cb_bvo);
	}
	
	//예약 안된 사물함 조회 
	@Override
	public List<CabinetVO> not_bookCb(CabinetVO cvo) {
		return bookmapper.not_bookCb(cvo);
	}
	
	//s_idx
	@Override
	public SeatsVO seatnum(int s_col, int br_idx) {
		System.out.println("s_col : " + s_col + ", br_idx : " + br_idx);
		Map<String, Integer> map = new HashMap<>();
		map.put("s_col", s_col);
		map.put("br_idx", br_idx);
		
		return bookmapper.seatnum(map);
	}
	
	//s_idx (두명)
	@Override
	public SeatsVO some_seatnum(int s_col_2, int br_idx) {
		System.out.println("s_col_2 : " + s_col_2 + ", br_idx : " + br_idx);
		Map<String, Integer> map = new HashMap<>();
		map.put("s_col_2", s_col_2);
		map.put("br_idx", br_idx);
		
		return bookmapper.some_seatnum(map);
	}
	


}
