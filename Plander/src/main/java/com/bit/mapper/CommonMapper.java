package com.bit.mapper;

import java.util.List;

import com.bit.domain.CouponVO;
import com.bit.domain.PriceVO;
import com.bit.domain.RecruitVO;
import com.bit.domain.RecvMsgVO;
import com.bit.domain.SendMsgVO;

public interface CommonMapper {
	
	public List<PriceVO> getPriceList();
	
	// 보유 쿠폰 출력
	public List<CouponVO> getUserCoupon(String id);
	
	// 쿠폰 갯수 -1
	public boolean minusCoupon(int cp_idx);
	
	// 쪽지 보내기
	public boolean sendMsg(SendMsgVO vo);
	
	// 안읽은 쪽지 확인
	public List<RecvMsgVO> newRecvMsg(String id);
	
	// 쪽지 상세
	public RecvMsgVO msgDetail(int rm_idx);
	
	// 쪽지 읽음 처리
	public boolean readMsgOne(int rm_idx);
	
	// 받은 쪽지 삭제
	public boolean delRecvMsg(int rm_idx);
	
	// 프로필 이미지 삭제
	public boolean imgDel(String id);
	
	//모집글 랜덤 추출(메인 카드형식)
	public List<RecruitVO> RandomRecruit();
	
}
