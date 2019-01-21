package com.bit.mapper;

import java.util.List;
import java.util.Map;

import com.bit.domain.BoardVO;
import com.bit.domain.BookingVO;
import com.bit.domain.CommentsVO;

public interface BoardMapper {
	
	// 모집글 전체 조회
	public List<BoardVO> getList();
	
	// 페이징 처리 후 조회
	public List<BoardVO> getListPage(Map<String, Integer> map);
	
	// 검색 조회
	public List<BoardVO> getSearchList(Map<String, Object> map);
	
	// 검색 게시물수 조회
	public int getSearchTotal(Map<String, Object> map);
	
	// 자유게시판 글 작성
	public int insertBoard(BoardVO vo);	//
	
	// 전체 글 갯수 조회
	public int getTotal(int ct_idx);
	
	// 모집글 상세조회
	public BoardVO getOne(int b_idx);
	
	// 조회수 +1
	public boolean updateHit(int rc_idx);
	
	// 모집게시판 신청
	public boolean insertApply(Map<String, Object> map);
	
	// 모집글 삭제
	public boolean deleteRec(int b_idx);
	
	// 모집글 수정
	public boolean updateRec(BoardVO vo);
	
	// 해당 모집글 댓글 전체 출력
	public List<CommentsVO> getCommList(Map<String, Object> map);
	
	// 모집글 댓글 등록
	public boolean insertComm(CommentsVO vo);
	// 모집글 댓글 등록
	public boolean insertReplyComm(CommentsVO vo);
	
	// 모집글 댓글 총 갯수
	public int cntCommAll(int b_idx);
	
	// 모집글 댓글 삭제
	public boolean deleteComm(int c_idx);
	
	// 해당 댓글에 대댓글이 있는지 조회
	public int cntReplyComm(Map<String, Object> map);
	
	// 대댓글이 있는 댓글 삭제 업데이트
	public boolean updateDeleteComm(int c_idx);
	
	// 댓글 수정
	public boolean updateComm(CommentsVO vo);
	
	// 후기 남길 수 있는 예약 조회
	public List<BookingVO> searchBooking(String id);
	
	// 리뷰 -1
	public boolean minusReview(int bk_idx);
	
	// 공지 목록
	public List<BoardVO> getNoticeList();
	
	// 공지 올리기/내리기
	public boolean updateNotice(Map<String, Integer> map);
}
