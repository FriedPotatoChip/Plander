package com.bit.service;

import com.bit.domain.SeatsVO;

public interface BookService {
	
	//좌석 조회
	public SeatsVO seat();
	//남은 좌석 수 확인
	public int seatCnt(int br_idx, String sct_idx);

}
