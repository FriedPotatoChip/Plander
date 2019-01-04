package com.bit.mapper;

import java.util.List;

import com.bit.domain.CouponVO;
import com.bit.domain.PriceVO;

public interface CommonMapper {
	
	public List<PriceVO> getPriceList();
	
	// 보유 쿠폰 출력
	public List<CouponVO> getUserCoupon(String id);
	
}
