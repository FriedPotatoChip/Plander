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
import com.bit.domain.CouponVO;
import com.bit.domain.RecruitVO;
import com.bit.domain.RecvMsgVO;
import com.bit.domain.SendMsgVO;
import com.bit.domain.UsersVO;
import com.bit.mapper.MyMapper;
import com.bit.service.MyService;

@Service
public class MyServiceImpl implements MyService {

	@Autowired
	private MyMapper mapper;
	
	// 내쿠폰보유현황갯수
	@Override
	public int coupon_cnt(UsersVO vo) {
		return mapper.coupon_cnt(vo);
	}

	// 내쿠폰보유현황
	@Override
	public List<CouponVO> coupon(Map map) {
		return mapper.coupon(map);
	}
	
	// 보낸쪽지 갯수
	@Override
	public int sendMsgCnt(UsersVO vo) {
		return mapper.sendMsgCnt(vo);
	}

	// 보낸쪽지
	@Override
	public List<SendMsgVO> sendMsg(Map map) {
		return mapper.sendMsg(map);
	}

	// 받은쪽지 갯수
	@Override
	public int recvMsgCnt(UsersVO vo) {
		return mapper.recvMsgCnt(vo);
	}

	// 받은쪽지
	@Override
	public List<RecvMsgVO> recvMsg(Map map) {
		return mapper.recvMsg(map);
	}

	// 내정보
	@Override
	public UsersVO user(UsersVO vo) {
		return mapper.user(vo);
	}

	// 내정보수정
	@Override
	public int userUpdate(UsersVO vo) {
		return mapper.userUpdate(vo);
	}
	
	// 프로필 사진 업데이트
	@Override
	public boolean updateProfileImg(UsersVO vo) {
		return mapper.updateProfileImg(vo);
	}

	// 모집글 작성
	@Override
	public boolean insertRecruit(RecruitVO vo) {
		return mapper.insertRecruit(vo);
	}

	// 내가 쓴 모집글 상세 조회
	@Override
	public RecruitVO getOne(int rc_idx) {
		return mapper.getOne(rc_idx);
	}

	// 내가 쓴 모집글 수정
	@Override
	public boolean updateRec(RecruitVO vo) {
		return mapper.updateRec(vo);
	}

	// 내가 쓴 모집글 삭제
	@Override
	public boolean deleteRec(int rc_idx) {
		return mapper.deleteRec(rc_idx);
	}
	
	// 자유게시판 상세보기
	@Override
	public BoardVO getBoardOne(int b_idx) {
		return mapper.getBoardOne(b_idx);
	}
	
	// 예약좌석삭제
	@Override
	public int delSeat(int bk_idx) {
		return mapper.delSeat(bk_idx);
	}

	// 예약사물함삭제
	@Override
	public int delCabinet(int ckb_idx) {
		return mapper.delCabinet(ckb_idx);
	}
	
//	여기서부터는 페이징 처리 관련 ---------------------------

	// 전체 좌석 예약 갯수 조회
	@Override
	public int getTotalSeat(UsersVO vo) {
		return mapper.getTotalSeat(vo);
	}
	
	// 내 좌석 예약내역
	@Override
	public List<BookingVO> my_seat(Map map) {
		return mapper.my_seat(map);
	}

	// 전체 사물함 예약 갯수 조회
	@Override
	public int getTotalCabinet(UsersVO vo) {
		return mapper.getTotalCabinet(vo);
	}
	
	// 내 사물함 예약내역
	@Override
	public List<BookingCbVO> my_cabinet(Map map) {
		return mapper.my_cabinet(map);
	}

	// 전체 모집글 갯수 조회
	@Override
	public int getTotal(UsersVO vo) {
		return mapper.getTotal(vo);
	}
	
	// 내가 쓴 모집글
	@Override
	public List<RecruitVO> my_recruit(Map map) {
		return mapper.my_recruit(map);
	}
	
	// 내 모집글의 신청자 목록 갯수
	@Override
	public int getTotalApply(UsersVO vo) {
		return mapper.getTotalApply(vo);
	}

	// 내 모집글의 신청자 목록 조회
	@Override
	public List<ApplyVO> getApplyList(Map map) {
		return mapper.getApplyList(map);
	}

	// 내 모집글에 달린 댓글 갯수
	@Override
	public int getTotalComment(UsersVO vo) {
		return mapper.getTotalComment(vo);
	}

	// 내 모집글에 달린 댓글
	@Override
	public List<CommentsVO> my_recruit_comment(Map map) {
		return mapper.my_recruit_comment(map);
	}
	
	// 자유게시판에 올린 글목록 갯수
	@Override
	public int board_cnt(UsersVO vo) {
		return mapper.board_cnt(vo);
	}
	
	// 자유게시판에 올린 글목록
	@Override
	public List<BoardVO> board(Map map) {
		return mapper.board(map);
	}
	
	// 자유게시판에 달린 댓글목록 갯수
	@Override
	public int board_comment_cnt(UsersVO vo) {
		return mapper.board_comment_cnt(vo);
	}

	// 자유게시판에 달린 댓글목록
	@Override
	public List<CommentsVO> board_comment(Map map) {
		return mapper.board_comment(map);
	}

//	여기서부터는 로그인 헤더 관련 ---------------------------
	
	// 내 좌석 예약내역 갯수
	@Override
	public int my_seat_header_cnt(UsersVO vo) {
		return mapper.my_seat_header_cnt(vo);
	}
	
	// 내 좌석 예약내역
	@Override
	public List<BookingVO> my_seat_header(UsersVO vo) {
		return mapper.my_seat_header(vo);
	}
	
	// 내 사물함 예약내역 갯수
	@Override
	public int my_cabinet_header_cnt(UsersVO vo) {
		return mapper.my_cabinet_header_cnt(vo);
	}

	// 내 사물함 예약내역
	@Override
	public List<BookingCbVO> my_cabinet_header(UsersVO vo) {
		return mapper.my_cabinet_header(vo);
	}

}
