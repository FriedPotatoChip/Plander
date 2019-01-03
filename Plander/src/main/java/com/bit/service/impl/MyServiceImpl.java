package com.bit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.ApplyVO;
import com.bit.domain.BoardVO;
import com.bit.domain.BookingCbVO;
import com.bit.domain.BookingVO;
import com.bit.domain.CommentsVO;
import com.bit.domain.RecruitVO;
import com.bit.domain.UsersVO;
import com.bit.mapper.MyMapper;
import com.bit.service.MyService;
import com.bit.utils.PagingVO;

@Service
public class MyServiceImpl implements MyService {

	@Autowired
	private MyMapper mapper;

	@Override
	public UsersVO user(UsersVO vo) {
		return mapper.user(vo);
	}

	@Override
	public int userUpdate(UsersVO vo) {
		return mapper.userUpdate(vo);
	}

	@Override
	public boolean insertRecruit(RecruitVO vo) {
		return mapper.insertRecruit(vo);
	}

/*	@Override
	public List<RecruitVO> my_recruit(UsersVO vo) {
		return mapper.my_recruit(vo);
	}*/

	@Override
	public RecruitVO getOne(int rc_idx) {
		return mapper.getOne(rc_idx);
	}

	@Override
	public boolean updateRec(RecruitVO vo) {
		return mapper.updateRec(vo);
	}

	@Override
	public boolean deleteRec(int rc_idx) {
		return mapper.deleteRec(rc_idx);
	}

	@Override
	public List<CommentsVO> my_recruit_comment(UsersVO vo) {
		return mapper.my_recruit_comment(vo);
	}

	@Override
	public boolean insertComm(CommentsVO vo) {
		return mapper.insertComm(vo);
	}

	@Override
	public List<ApplyVO> getApplyList(UsersVO vo) {
		return mapper.getApplyList(vo);
	}

	@Override
	public List<BookingVO> my_seat(UsersVO vo) {
		return mapper.my_seat(vo);
	}

	@Override
	public List<BookingCbVO> my_cabinet(UsersVO vo) {
		return mapper.my_cabinet(vo);
	}

	@Override
	public int getTotal(UsersVO vo) {
		return mapper.getTotal(vo);
	}

	@Override
	public int getTotalSeat(UsersVO vo) {
		return mapper.getTotalSeat(vo);
	}

	@Override
	public int getTotalCabinet(UsersVO vo) {
		return mapper.getTotalCabinet(vo);
	}

/*	@Override
	public List<BoardVO> board(UsersVO vo) {
		return mapper.board(vo);
	}

	@Override
	public List<CommentsVO> board_comment(UsersVO vo) {
		return mapper.board_comment(vo);
	}*/

	@Override
	public BoardVO getBoardOne(int b_idx) {
		return mapper.getBoardOne(b_idx);
	}

	@Override
	public List<RecruitVO> my_recruit(Map map) {
		return mapper.my_recruit(map);
	}

	@Override
	public List<BoardVO> board(Map map) {
		return mapper.board(map);
	}

	@Override
	public List<CommentsVO> board_comment(Map map) {
		return mapper.board_comment(map);
	}

	@Override
	public int board_cnt(UsersVO vo) {
		return mapper.board_cnt(vo);
	}

	@Override
	public int board_comment_cnt(UsersVO vo) {
		return mapper.board_comment_cnt(vo);
	}

	@Override
	public boolean updateProfileImg(UsersVO vo) {
		return mapper.updateProfileImg(vo);
	}

	@Override
	public int delSeat(int bk_idx) {
		return mapper.delSeat(bk_idx);
	}

	@Override
	public int delCabinet(int ckb_idx) {
		return mapper.delCabinet(ckb_idx);
	}
	
}
