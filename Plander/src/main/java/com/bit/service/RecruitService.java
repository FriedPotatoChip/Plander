package com.bit.service;

import java.util.List;
import java.util.Map;

import com.bit.domain.ApplyVO;
import com.bit.domain.BoardVO;
import com.bit.domain.CommentsVO;
import com.bit.domain.CouponVO;
import com.bit.domain.RecruitVO;
import com.bit.utils.PagingVO;

public interface RecruitService {
	
	// 모집글 전체 조회
	public List<RecruitVO> getList();
	
	// 페이징 처리 후 조회
	public List<RecruitVO> getListPage(PagingVO vo);
	
	// 모집글 작성
	public boolean register(RecruitVO vo);
	
	// 전체 글 갯수 조회
	public int getTotal();
	
	// 모집글 상세조회
	public RecruitVO detailOne(int rc_idx);
	
	// 조회수 +1
	public boolean updateHit(int rc_idx);
	
	// 모집게시판 신청
	public boolean apply(Map<String, Object> map);
	
	// 모집게시판 cur_mem 업데이트
	public boolean updateCur(int rc_idx);
	
	// 신청자 목록 조회
	public List<ApplyVO> getApplyList(int rc_idx);
	
	// 신청 취소시 delete
	public boolean deleteApply(Map<String, Object> map);
	
	// 신청 취소시 cur_mem -1
	public boolean minusCur(int rc_idx);
	
	// 모집글 삭제
	public boolean deleteRec(int rc_idx);
	
	// 모집글 수정
	public boolean modifyRec(RecruitVO vo);
	
	// 해당 모집글 댓글 전체 출력
	public List<CommentsVO> getCommList(Map<String, Object> map);
	
	// 모집글 댓글 등록
	public boolean insertComm(CommentsVO vo);
	// 모집글 댓글 등록
	public boolean insertReplyComm(CommentsVO vo);
	
	// 모집글 댓글 총 갯수
	public int cntCommAll(int rc_idx);
	
	// 모집글 댓글 삭제
	public boolean deleteComm(int c_idx);
	
	// 해당 댓글에 대댓글이 있는지 조회
	public int cntReplyComm(Map<String, Object> map);
	
	// 대댓글이 있는 댓글 삭제 업데이트
	public boolean updateDeleteComm(int c_idx);
	
	// 댓글 수정
	public boolean updateComm(CommentsVO vo);
	
	// 검색 조회
	public List<RecruitVO> getSearchList(Map<String, Object> map);
	
	// 검색 게시물수 조회
	public int getSearchTotal(Map<String, Object> map);
	
	// 쿠폰 인서트
	public boolean insertCoupon(Map<String, Object> map);
	
	// 모집마감 후 onOff update
	public boolean updateOnOff(int rc_idx);
	
}
