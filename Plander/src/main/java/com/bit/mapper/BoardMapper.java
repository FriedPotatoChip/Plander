package com.bit.mapper;

import java.util.List;

import com.bit.domain.RecruitVO;

public interface BoardMapper {
	
	// 모집글 전체 조회
	public List<RecruitVO> getList();
	
	// 모집글 작성
	public boolean insertRecruit(RecruitVO vo);
	
	// 모집글 상세조회
	public RecruitVO getOne(int rc_idx);
	
}
