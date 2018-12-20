package com.bit.mapper;

import java.util.List;
import java.util.Map;

import com.bit.domain.BoardVO;
import com.bit.domain.BookingCbVO;
import com.bit.domain.BookingVO;
import com.bit.domain.CommentsVO;
import com.bit.domain.RecruitVO;
import com.bit.domain.ReplyVO;
import com.bit.domain.UsersVO;

public interface MyMapper {
	
	/* 내정보 */
	public UsersVO user(String id);
	
	/* 내프사수정 */
	public int updateProfile(Map<String, String> map);
	
	/* 내정보수정 */
	public int update(UsersVO vo);
	
	/* 내가쓴글 */
	public List<BoardVO> board(String id);
	
	public int board_cnt(String id);
	
	/* 내가쓴댓글 */
	public List<CommentsVO> comment(String id);
	
	public int comment_cnt(String id);
	
	/* 내게시물에쓴댓글 */
	public List<CommentsVO> board_comment(String id);
	
	public int board_comment_cnt(String id);
	
	/* 내댓글에달린댓글 */
	public List<ReplyVO> comment_comment(String id);
	
	public int comment_comment_cnt(String id);
	
	/* 내가쓴모집글 */
	public List<RecruitVO> board2(String id);
	
	public int board2_cnt(String id);
	
	/* 내가쓴모집댓글 */
	public List<CommentsVO> comment2(String id);
	
	public int comment2_cnt(String id);
	
	/* 내모집글에달린댓글 */
	public List<CommentsVO> board_comment2(String id);
	
	public int board_comment2_cnt(String id);
	
	/* 내가쓴모집글 */
	public List<ReplyVO> comment_comment2(String id);
	
	public int comment_comment2_cnt(String id);
	
	/* 내좌석예약내역 */
	public List<BookingVO> seat(String id);
	
	public int seat_cnt(String id);
	
	/* 내사물함예약내역 */
	public List<BookingCbVO> cabinet(String id);
	
	public int cabinet_cnt(String id);

	/* 프사업로드 */
	public void insertBoard(UsersVO vo);
	
	
	
}
