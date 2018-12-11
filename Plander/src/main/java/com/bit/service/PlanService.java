package com.bit.service;

import java.util.List;

import com.bit.domain.PlannerVO;

public interface PlanService {

	//플래너 전체 조회(작성자포함)
	public List<PlannerVO> getListPlan();
	//플래너 제목/내용 검색
	public List<PlannerVO> searchPlan(PlannerVO pvo);
	
}
