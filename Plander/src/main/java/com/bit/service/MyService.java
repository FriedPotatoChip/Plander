package com.bit.service;

import java.util.List;
import java.util.Map;

import com.bit.domain.ApplyVO;
import com.bit.domain.BoardVO;
import com.bit.domain.BookingCbVO;
import com.bit.domain.BookingVO;
import com.bit.domain.CommentsVO;
import com.bit.domain.CouponVO;
import com.bit.domain.RecruitVO;
import com.bit.domain.UsersVO;

public interface MyService {

	// 내쿠폰보유현황갯수
	public int coupon_cnt(UsersVO vo);
	
	// 내쿠폰보유현황
	public List<CouponVO> coupon(Map map);
	
	// 내정보
	public UsersVO user(UsersVO vo);

	// 내정보수정
	public int userUpdate(UsersVO vo);

	// 프로필 사진 업데이트
	public boolean updateProfileImg(UsersVO vo);

	// 모집글 작성
	public boolean insertRecruit(RecruitVO vo);

	// 내가 쓴 모집글 상세 조회
	public RecruitVO getOne(int rc_idx);

	// 내가 쓴 모집글 수정
	public boolean updateRec(RecruitVO vo);

	// 내가 쓴 모집글 삭제
	public boolean deleteRec(int rc_idx);

	// 자유게시판 상세보기
	public BoardVO getBoardOne(int b_idx);

	// 예약좌석삭제
	public int delSeat(int bk_idx);

	// 예약사물함삭제
	public int delCabinet(int ckb_idx);

//	여기서부터는 페이징 처리 관련 ---------------------------

	// 전체 좌석 예약 갯수 조회
	public int getTotalSeat(UsersVO vo);

	// 내 좌석 예약내역
	public List<BookingVO> my_seat(Map map);

	// 전체 사물함 예약 갯수 조회
	public int getTotalCabinet(UsersVO vo);

	// 내 사물함 예약내역
	public List<BookingCbVO> my_cabinet(Map map);

	// 전체 모집글 갯수 조회
	public int getTotal(UsersVO vo);

	// 내가 쓴 모집글
	public List<RecruitVO> my_recruit(Map map);

	// 내 모집글의 신청자 목록 갯수
	public int getTotalApply(UsersVO vo);

	// 내 모집글의 신청자 목록 조회
	public List<ApplyVO> getApplyList(Map map);

	// 내 모집글에 달린 댓글 갯수
	public int getTotalComment(UsersVO vo);

	// 내 모집글에 달린 댓글
	public List<CommentsVO> my_recruit_comment(Map map);

	// 자유게시판에 올린 글목록 갯수
	public int board_cnt(UsersVO vo);

	// 자유게시판에 올린 글목록
	public List<BoardVO> board(Map map);

	// 자유게시판에 달린 댓글목록 갯수
	public int board_comment_cnt(UsersVO vo);

	// 자유게시판에 달린 댓글목록
	public List<CommentsVO> board_comment(Map map);

//	여기서부터는 로그인 헤더 관련 ---------------------------

	// 내 좌석 예약내역
	public List<BookingVO> my_seat_header(UsersVO vo);

	// 내 사물함 예약내역
	public List<BookingCbVO> my_cabinet_header(UsersVO vo);

}
