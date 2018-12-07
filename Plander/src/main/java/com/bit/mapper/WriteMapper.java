package com.bit.mapper;

import com.bit.domain.PlannerVO;
import com.bit.domain.Planner_dVO;

public interface WriteMapper {
	
	// Planner 인서트
	public boolean insertPlanner(PlannerVO vo);
	
	// Planner_detail 인서트
	public boolean insertDetail(Planner_dVO vo);
	
}
