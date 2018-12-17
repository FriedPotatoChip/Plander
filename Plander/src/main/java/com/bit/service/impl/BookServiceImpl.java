package com.bit.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.SeatsVO;
import com.bit.mapper.BookMapper;
import com.bit.service.BookService;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookMapper bookmapper;
	
	//좌석 조회
	@Override
	public SeatsVO seat() {
		System.out.println("seat() : Impl 까지 옴!");
		return bookmapper.seat();
	}
	
	//남은 좌석 수 확인
	@Override
	public int seatCnt(int br_idx, String sct_idx) {
		System.out.println("seatCnt() : Impl 까지 옴!");
		System.out.println("br_idx : " + br_idx + ", sct_idx : " + sct_idx);
		return bookmapper.seatCnt();
	}

}
