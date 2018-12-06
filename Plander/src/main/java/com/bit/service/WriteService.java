package com.bit.service;

import com.bit.domain.PlannerVO;
import com.bit.domain.Planner_dVO;

public interface WriteService {
	
	public boolean register(PlannerVO vo);
	
	public boolean registerDetail(Planner_dVO vo);
	
	
}
