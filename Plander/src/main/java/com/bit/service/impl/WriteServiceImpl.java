package com.bit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.PlannerVO;
import com.bit.domain.Planner_dVO;
import com.bit.mapper.WriteMapper;
import com.bit.service.WriteService;

@Service
public class WriteServiceImpl implements WriteService {
	
	@Autowired
	private WriteMapper mapper;
	
	@Override
	public boolean register(PlannerVO vo) {
		return mapper.insertPlanner(vo);
	}

	@Override
	public boolean registerDetail(Planner_dVO vo) {
		return mapper.insertDetail(vo);
	}

}
