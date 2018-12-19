package com.bit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.BoardVO;
import com.bit.domain.BookingCbVO;
import com.bit.domain.BookingVO;
import com.bit.domain.CabinetVO;
import com.bit.domain.CommentsVO;
import com.bit.domain.RecruitVO;
import com.bit.domain.ReplyVO;
import com.bit.domain.SeatsVO;
import com.bit.domain.UsersVO;
import com.bit.mapper.BookMapper;
import com.bit.mapper.MyMapper;
import com.bit.service.BookService;
import com.bit.service.MyService;

@Service
public class MyServiceImpl implements MyService {

	@Autowired
	private MyMapper myMapper;

	@Override
	public UsersVO user(String id) {
		UsersVO vo = myMapper.user(id);
		return vo;
	}

	@Override
	public List<BoardVO> board(String id) {
		List<BoardVO> list = myMapper.board(id);
		return list;
	}

	@Override
	public List<CommentsVO> comment(String id) {
		List<CommentsVO> list = myMapper.comment(id);
		return list;
	}

	@Override
	public List<CommentsVO> board_comment(String id) {
		List<CommentsVO> list = myMapper.board_comment(id);
		return list;
	}

	@Override
	public List<ReplyVO> comment_comment(String id) {
		List<ReplyVO> list = myMapper.comment_comment(id);
		return list;
	}

	@Override
	public List<RecruitVO> board2(String id) {
		List<RecruitVO> list = myMapper.board2(id);
		return list;
	}

	@Override
	public List<CommentsVO> comment2(String id) {
		List<CommentsVO> list = myMapper.comment2(id);
		return list;
	}

	@Override
	public List<CommentsVO> board_comment2(String id) {
		List<CommentsVO> list = myMapper.board_comment2(id);
		return list;
	}

	@Override
	public List<ReplyVO> comment_comment2(String id) {
		List<ReplyVO> list = myMapper.comment_comment2(id);
		return list;
	}

	@Override
	public List<BookingVO> seat(String id) {
		List<BookingVO> list = myMapper.seat(id);
		return list;
	}

	@Override
	public List<BookingCbVO> cabinet(String id) {
		List<BookingCbVO> list = myMapper.cabinet(id);
		return list;
	}

	@Override
	public int update(UsersVO vo) {
		int result = myMapper.update(vo);
		System.out.println("처리건수: " + result);
		return result;
	}


}
