package com.bit.mapper;

import java.util.List;

import com.bit.domain.CouponVO;
import com.bit.domain.PriceVO;
import com.bit.domain.SendMsgVO;

public interface CommonMapper {
	
	public List<PriceVO> getPriceList();
	
	// 보유 쿠폰 출력
	public List<CouponVO> getUserCoupon(String id);
	
	// 쿠폰 갯수 -1
	public boolean minusCoupon(int cp_idx);
	
	// 쪽지 보내기
	public boolean sendMsg(SendMsgVO vo);
}
