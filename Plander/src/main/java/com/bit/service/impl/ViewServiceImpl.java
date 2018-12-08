package com.bit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.CategoryVO;
import com.bit.domain.Category_dVO;
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
}
