package com.bit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.ApplyVO;
import com.bit.domain.CommentsVO;
import com.bit.domain.CouponVO;
import com.bit.domain.RecruitVO;
import com.bit.mapper.RecruitMapper;
import com.bit.service.RecruitService;
import com.bit.utils.PagingVO;

@Service
public class RecruitServiceImpl implements RecruitService {

	@Autowired
	private RecruitMapper mapper;
	
	@Override
	public List<RecruitVO> getList() {
		return mapper.getList();
	}

	@Override
	public boolean register(RecruitVO vo) {
		return mapper.insertRecruit(vo);
	}

	@Override
	public RecruitVO detailOne(int rc_idx) {
		return mapper.getOne(rc_idx);
	}

	@Override
	public int getTotal() {
		return mapper.getTotal();
	}

	@Override
	public List<RecruitVO> getListPage(PagingVO vo) {
		return mapper.getListPage(vo);
	}

	@Override
	public boolean updateHit(int rc_idx) {
		return mapper.updateHit(rc_idx);
	}

	@Override
	public boolean apply(Map<String, Object> map) {
		return mapper.insertApply(map);
	}

	@Override
	public boolean updateCur(int rc_idx) {
		return mapper.updateCur(rc_idx);
	}

	@Override
	public List<ApplyVO> getApplyList(int rc_idx) {
		return mapper.getApplyList(rc_idx);
	}

	@Override
	public boolean deleteApply(Map<String, Object> map) {
		return mapper.deleteApply(map);
	}

	@Override
	public boolean minusCur(int rc_idx) {
		return mapper.minusCur(rc_idx);
	}

	@Override
	public boolean deleteRec(int rc_idx) {
		return mapper.deleteRec(rc_idx);
	}

	@Override
	public boolean modifyRec(RecruitVO vo) {
		return mapper.updateRec(vo);
	}

	@Override
	public List<CommentsVO> getCommList(Map<String, Object> map) {
		return mapper.getCommList(map);
	}

	@Override
	public boolean insertComm(CommentsVO vo) {
		return mapper.insertComm(vo);
	}

	@Override
	public int cntCommAll(int rc_idx) {
		return mapper.cntCommAll(rc_idx);
	}

	@Override
	public boolean insertReplyComm(CommentsVO vo) {
		return mapper.insertReplyComm(vo);
	}

	@Override
	public boolean deleteComm(int c_idx) {
		return mapper.deleteComm(c_idx);
	}

	@Override
	public int cntReplyComm(Map<String, Object> map) {
		return mapper.cntReplyComm(map);
	}

	@Override
	public boolean updateDeleteComm(int c_idx) {
		return mapper.updateDeleteComm(c_idx);
	}

	@Override
	public boolean updateComm(CommentsVO vo) {
		return mapper.updateComm(vo);
	}

	@Override
	public List<RecruitVO> getSearchList(Map<String, Object> map) {
		return mapper.getSearchList(map);
	}

	@Override
	public int getSearchTotal(Map<String, Object> map) {
		return mapper.getSearchTotal(map);
	}

	@Override
	public boolean insertCoupon(Map<String, Object> map) {
		return mapper.insertCoupon(map);
	}

	@Override
	public boolean updateOnOff(int rc_idx) {
		return mapper.updateOnOff(rc_idx);
	}

}
