package com.bit.service;

import java.util.List;

import com.bit.domain.CategoryVO;
import com.bit.domain.Category_dVO;
import com.bit.domain.PlannerVO;

public interface ViewService {
	
	/* planderList.jsp - 인기 카테고리 추출 */
	public List<CategoryVO> getListCategory(CategoryVO cvo);
	
	/* planderList - 플래너 랜덤 추천 */
	public List<PlannerVO> getListPlannerRandom(PlannerVO pvo);
	
	/* CategoryDetailPlanner.jsp - 카테고리별 플래너 */
	public List<PlannerVO> getDetailPlannerList(PlannerVO pvo);
	
	/* planderList.jsp - 해시태그용 */ 
	public List<Category_dVO> getListCategory_d(Category_dVO cdvo);
	
	/* plannerList.jsp - 추천 및 카테고리별 플래너 */ 
	public List<PlannerVO> getDetailPlannerList_2(PlannerVO pvo);
}
