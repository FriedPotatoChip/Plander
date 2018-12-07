package com.bit.service;

import java.util.List;

import com.bit.domain.CategoryVO;
import com.bit.domain.Category_dVO;

public interface ViewService {
	
	public List<CategoryVO> getListCategory(CategoryVO cvo);
	
	public List<Category_dVO> getListCategory_d(Category_dVO cdvo);
}
