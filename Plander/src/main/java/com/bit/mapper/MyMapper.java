package com.bit.mapper;

import java.util.List;
import java.util.Map;

import com.bit.domain.ApplyVO;
import com.bit.domain.BoardVO;
import com.bit.domain.BookingCbVO;
import com.bit.domain.BookingVO;
import com.bit.domain.CommentsVO;
import com.bit.domain.RecruitVO;
import com.bit.domain.UsersVO;

public interface MyMapper {

	// 내정보
	public UsersVO user(UsersVO vo);

	// 내정보수정
	public int userUpdate(UsersVO vo);

	// 모집글 작성
	public boolean insertRecruit(RecruitVO vo);

	// 내가 쓴 모집글
	/* public List<RecruitVO> my_recruit(UsersVO vo); */

	public List<RecruitVO> my_recruit(Map<String, Object> map);

	// 내가 쓴 모집글 상세 조회
	public RecruitVO getOne(int rc_idx);

	// 내가 쓴 모집글 수정
	public boolean updateRec(RecruitVO vo);

	// 내가 쓴 모집글 삭제
	public boolean deleteRec(int rc_idx);

	// 내 모집글에 달린 댓글
	public List<CommentsVO> my_recruit_comment(UsersVO vo);

	// 모집글 댓글 등록
	public boolean insertComm(CommentsVO vo);

	// 내 모집글의 신청자 목록 조회
	public List<ApplyVO> getApplyList(UsersVO vo);

	// 내 좌석 예약내역
	public List<BookingVO> my_seat(UsersVO vo);

	// 내 사물함 예약내역
	public List<BookingCbVO> my_cabinet(UsersVO vo);

	// 전체 모집글 갯수 조회
	public int getTotal(UsersVO vo);

	// 전체 좌석 예약 갯수 조회
	public int getTotalSeat(UsersVO vo);

	// 전체 사물함 예약 갯수 조회
	public int getTotalCabinet(UsersVO vo);

	// 자유게시판에 올린 글목록
	/* public List<BoardVO> board(UsersVO vo); */
	public List<BoardVO> board(Map<String, Object> map);

	// 자유게시판에 올린 글목록 갯수
	public int board_cnt(UsersVO vo);

	// 자유게시판에 달린 댓글목록 갯수
	public int board_comment_cnt(UsersVO vo);

	// 자유게시판에 달린 댓글목록
	/* public List<CommentsVO> board_comment(UsersVO vo); */
	public List<CommentsVO> board_comment(Map<String, Object> map);

	// 자유게시판 상세보기
	public BoardVO getBoardOne(int b_idx);
	
	// 프로필 사진 업데이트
	public boolean updateProfileImg(UsersVO vo);
	
	// 예약좌석삭제
	public int delSeat(int bk_idx);
	
	// 예약사물함삭제
	public int delCabinet(int ckb_idx);
}
