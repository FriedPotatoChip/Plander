package com.bit.service;

import java.util.List;

import com.bit.domain.CouponVO;
import com.bit.domain.PriceVO;

public interface CommonService {
	
	public List<PriceVO> getPriceList();
	
	// 보유 쿠폰 출력
	public List<CouponVO> getUserCoupon(String id);
	
	// 쿠폰 갯수 -1
	public boolean minusCoupon(int cp_idx);
}