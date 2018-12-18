package com.bit.service;

import java.util.List;

import com.bit.domain.BoardVO;
import com.bit.domain.BookingCbVO;
import com.bit.domain.BookingVO;
import com.bit.domain.CabinetVO;
import com.bit.domain.CommentsVO;
import com.bit.domain.RecruitVO;
import com.bit.domain.ReplyVO;
import com.bit.domain.SeatsVO;
import com.bit.domain.UsersVO;

public interface MyService {
	
	public UsersVO user(String id);
	
	public List<BoardVO> board(String id);
	
	public List<CommentsVO> comment(String id);
	
	public List<CommentsVO> board_comment(String id);
	
	public List<ReplyVO> comment_comment(String id);
	
	public List<RecruitVO> board2(String id);
	
	public List<CommentsVO> comment2(String id);
	
	public List<CommentsVO> board_comment2(String id);
	
	public List<ReplyVO> comment_comment2(String id);
	
	public List<BookingVO> seat(String id);
	
	public List<BookingCbVO> cabinet(String id);
	
	public int update(UsersVO vo);
	
	

}
