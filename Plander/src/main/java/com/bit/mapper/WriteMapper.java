package com.bit.mapper;

import java.util.List;

import com.bit.domain.PlannerVO;
import com.bit.domain.Planner_dVO;

public interface WriteMapper {
	
	// Planner 인서트
	public boolean insertPlanner(PlannerVO vo);
	
	// Planner_detail 인서트
	public boolean insertDetail(Planner_dVO vo);
	
	// Planner 전체 조회
	public List<PlannerVO> getListAll();
	// Planner 전체 조회(작성자포함)
	public List<PlannerVO> getListPlan();
	// Planner 검색(제목/내용)
	public List<PlannerVO> searchPlan(String keyword);
	
}
