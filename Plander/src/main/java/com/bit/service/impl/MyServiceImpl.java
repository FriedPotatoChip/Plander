package com.bit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.ApplyVO;
import com.bit.domain.BookingCbVO;
import com.bit.domain.BookingVO;
import com.bit.domain.CommentsVO;
import com.bit.domain.RecruitVO;
import com.bit.domain.UsersVO;
import com.bit.mapper.MyMapper;
import com.bit.service.MyService;

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

	@Override
	public List<RecruitVO> my_recruit(UsersVO vo) {
		return mapper.my_recruit(vo);
	}

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
	
}
