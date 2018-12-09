package com.bit.mapper;

import java.util.List;

import com.bit.domain.CommentsVO;
import com.bit.domain.PlannerVO;
import com.bit.domain.Planner_dVO;
import com.bit.domain.UserVO;

public interface MyMapper {
	/*<!-- 내플래너 목록 보기 -->*/
	public List<PlannerVO> getPlannerList(int u_idx);
	/*<!-- 내플래너 상세 보기 -->*/
	public Planner_dVO getPlannerOne(int p_idx);
	/*<!-- 북마크 목록 보기 -->*/
	public List<PlannerVO> getBookmarkList(int u_idx);
	/*<!-- 북마크 상세 보기 -->*/
	public Planner_dVO getBookmarkOne(int p_idx);
//	내가 쓴 댓글
	public CommentsVO getMyCommentList(int u_idx);
//	내 글에 달린 댓글
	public CommentsVO getCommentList(int u_idx);
//	전체일정(내플래너) 갯수
	public int getPlannerCnt(int u_idx);
//	북마크 갯수
	public int getBookmarkCnt(int u_idx);
//	내 글에 달린 댓글 갯수
	public int getCommentCnt(int u_idx);
//	회원 정보 수정 
	public int updateUser(UserVO user);
}
