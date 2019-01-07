package com.bit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.CouponVO;
import com.bit.domain.PriceVO;
import com.bit.domain.RecvMsgVO;
import com.bit.domain.SendMsgVO;
import com.bit.mapper.CommonMapper;
import com.bit.service.CommonService;

@Service
public class CommonServiceImpl implements CommonService {
	
	@Autowired
	private CommonMapper mapper;

	@Override
	public List<PriceVO> getPriceList() {
		return mapper.getPriceList();
	}

	@Override
	public List<CouponVO> getUserCoupon(String id) {
		return mapper.getUserCoupon(id);
	}

	@Override
	public boolean minusCoupon(int cp_idx) {
		return mapper.minusCoupon(cp_idx);
	}

	@Override
	public boolean sendMsg(SendMsgVO vo) {
		return mapper.sendMsg(vo);
	}

	@Override
	public List<RecvMsgVO> newRecvMsg(String id) {
		return mapper.newRecvMsg(id);
	}

	@Override
	public RecvMsgVO msgDetail(int rm_idx) {
		return mapper.msgDetail(rm_idx);
	}

	@Override
	public boolean readMsgOne(int rm_idx) {
		return mapper.readMsgOne(rm_idx);
	}
	
	
}