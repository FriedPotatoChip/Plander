package com.bit.mapper;

import java.util.List;

import com.bit.domain.CategoryVO;
import com.bit.domain.Category_dVO;

public interface ViewMapper {
	
	public List<CategoryVO> getListCategory();
	
	public List<Category_dVO> getListCategory_d(Category_dVO cdvo);
}
