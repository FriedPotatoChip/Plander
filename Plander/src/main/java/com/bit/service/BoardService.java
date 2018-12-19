package com.bit.service;

import java.util.List;

import com.bit.domain.RecruitVO;

public interface BoardService {
	
	// 모집글 전체 조회
	public List<RecruitVO> getList();
	
	// 모집글 작성
	public boolean register(RecruitVO vo);
	
	// 모집글 상세조회
	public RecruitVO detailOne(int rc_idx);
	
	
	
	
	
}
