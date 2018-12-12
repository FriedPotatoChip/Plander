package com.bit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.PlannerVO;
import com.bit.mapper.WriteMapper;
import com.bit.service.PlanService;

@Service
public class PlanServiceImpl implements PlanService {
	
	@Autowired
	private WriteMapper mapper;
	
	//플래너 전체 조회(작성자포함)
	@Override
	public List<PlannerVO> getListPlan() {
		return mapper.getListPlan();
	}
	
	//플래너 제목/내용 검색
	@Override
	public List<PlannerVO> searchPlan(PlannerVO pvo) {
		System.out.println("planImpl 까지옴!");
		String keyword = pvo.getKeyword();
		System.out.println(keyword + " : 임플에서 찍힘 ");
		return mapper.searchPlan(keyword);
	}
	
	//검색 결과 수 
	@Override
	public int searchCnt(PlannerVO pvo) {
		System.out.println("planImpl cnt 까지옴!");
		String keyword = pvo.getKeyword();
		return mapper.searchCnt(keyword);
	}

}
