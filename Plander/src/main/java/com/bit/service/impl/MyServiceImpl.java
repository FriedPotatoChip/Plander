package com.bit.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.CommentsVO;
import com.bit.domain.PlannerVO;
import com.bit.domain.Planner_dVO;
import com.bit.domain.UserVO;
import com.bit.mapper.MyMapper;
import com.bit.service.MyService;

@Service
public class MyServiceImpl implements MyService {

	@Autowired
	private MyMapper myMapper;

	/* <!-- 내플래너 목록 보기 --> */
	@Override
	public List<PlannerVO> getPlannerList(int u_idx) {
		List<PlannerVO> vo = myMapper.getPlannerList(u_idx);
		return vo;
	}

	/* <!-- 내플래너 상세 보기 --> */
	@Override
	public Planner_dVO getPlannerOne(int u_idx) {
		Planner_dVO dvo = myMapper.getPlannerOne(u_idx);
		return dvo;
	}

	/* <!-- 북마크 목록 보기 --> */
	@Override
	public List<PlannerVO> getBookmarkList(int u_idx) {
		List<PlannerVO> vo = myMapper.getBookmarkList(u_idx);
		return vo;
	}

	/* <!-- 북마크 상세 보기 --> */
	@Override
	public Planner_dVO getBookmarkOne(int u_idx) {
		Planner_dVO dvo = myMapper.getBookmarkOne(u_idx);
		return dvo;
	}

	// 내가 쓴 댓글
	@Override
	public CommentsVO getMyCommentList(int u_idx) {
		CommentsVO cvo = myMapper.getMyCommentList(u_idx);
		return cvo;
	}

	// 내 글에 달린 댓글
	@Override
	public List<CommentsVO> getCommentList(int u_idx) {
		List<CommentsVO> cvo = myMapper.getCommentList(u_idx);
		return cvo;
	}

	// 전체일정(내플래너) 갯수
	@Override
	public int getPlannerCnt(int u_idx) {
		int cnt = myMapper.getPlannerCnt(u_idx);
		return cnt;
	}

	// 북마크 갯수
	@Override
	public int getBookmarkCnt(int u_idx) {
		int cnt = myMapper.getBookmarkCnt(u_idx);
		return cnt;
	}

	// 내 글에 달린 댓글 갯수
	@Override
	public int getCommentCnt(int u_idx) {
		int cnt = myMapper.getCommentCnt(u_idx);
		return cnt;
	}

	// 회원 정보 수정
	@Override
	public int updateUser(UserVO user) {
		int result = myMapper.updateUser(user);
		return result;
	}

	//페이징 처리용 totalCount
	@Override
	public int totalCount(int u_idx) {
		int totalCount = myMapper.totalCount(u_idx);
		return totalCount;
	}


	// 페이징 처리
/*	@Override
	public void paging(int u_idx, int curPage) {
		int totalCount = myMapper.totalCount(u_idx);
		int listCount = 5;
		int pageCount = 3;
		
		int page = 1;

		
		int totalPage = totalCount / listCount;
		if(totalCount % listCount > 0) {
			totalPage++;
		}
		if(totalPage < page) {
			page = totalPage;
		}
		
		int startPage =((page -1) / pageCount) * pageCount + 1;
		int endPage = startPage + pageCount -1;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
	}*/

}
