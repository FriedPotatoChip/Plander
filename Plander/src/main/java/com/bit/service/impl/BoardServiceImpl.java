package com.bit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.BoardVO;
import com.bit.domain.BookingVO;
import com.bit.domain.CommentsVO;
import com.bit.mapper.BoardMapper;
import com.bit.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> getList() {
		return mapper.getList();
	}

	@Override
	public int register(BoardVO vo) {	//
		return mapper.insertBoard(vo);
	}

	@Override
	public BoardVO detailOne(int rc_idx) {
		return mapper.getOne(rc_idx);
	}

	@Override
	public int getTotal(int ct_idx) {
		return mapper.getTotal(ct_idx);
	}

	@Override
	public List<BoardVO> getListPage(Map<String, Integer> map) {
		return mapper.getListPage(map);
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
	public boolean deleteRec(int rc_idx) {
		return mapper.deleteRec(rc_idx);
	}

	@Override
	public boolean modifyRec(BoardVO vo) {
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
	public List<BoardVO> getSearchList(Map<String, Object> map) {
		return mapper.getSearchList(map);
	}

	@Override
	public int getSearchTotal(Map<String, Object> map) {
		return mapper.getSearchTotal(map);
	}

	@Override
	public List<BookingVO> searchBooking(String id) {
		return mapper.searchBooking(id);
	}

	@Override
	public boolean minusReview(int bk_idx) {
		return mapper.minusReview(bk_idx);
	}

	@Override
	public List<BoardVO> getNoticeList() {
		return mapper.getNoticeList();
	}

	@Override
	public boolean updateNotice(Map<String, Integer> map) {
		return mapper.updateNotice(map);
	}



}
