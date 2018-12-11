package com.bit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.CategoryVO;
import com.bit.domain.Category_dVO;
import com.bit.domain.PlannerVO;
import com.bit.mapper.ViewMapper;
import com.bit.service.ViewService;

@Service
public class ViewServiceImpl implements ViewService {
	
	@Autowired
	private ViewMapper viewMapper;
	
	@Override
	public List<CategoryVO> getListCategory(CategoryVO cvo) {
		return viewMapper.getListCategory();
	}
	
	public List<Category_dVO> getListCategory_d(Category_dVO cdvo) {
		return viewMapper.getListCategory_d(cdvo);
	}

	@Override
	public List<PlannerVO> getListPlannerRandom(PlannerVO pvo) {
		return viewMapper.getListPlannerRandom();
	}

	@Override
	public List<PlannerVO> getDetailPlannerList(PlannerVO pvo) {
		return viewMapper.getDetailPlannerList(pvo);
	}

	@Override
	public List<PlannerVO> getDetailPlannerList_2(PlannerVO pvo) {
		return viewMapper.getDetailPlannerList_2(pvo);
	}
}
