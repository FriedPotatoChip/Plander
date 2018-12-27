package com.bit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bit.domain.BoardVO;
import com.bit.domain.BookingVO;
import com.bit.domain.CommentsVO;
import com.bit.domain.RecruitVO;
import com.bit.domain.UsersVO;
import com.bit.service.BoardPager;
import com.bit.service.MyService;

@Controller
@SessionAttributes("usersVO")
@RequestMapping("/TMS/my")
public class MyController {

	@Autowired
	MyService myService;

	@RequestMapping("")
	public String mypage(UsersVO vo, HttpSession session) {
		session.setAttribute("user", vo);
		return "my/mypage";
	}

	@RequestMapping("update")
	public String update(HttpServletRequest request, HttpSession session) {
		UsersVO vo = (UsersVO) session.getAttribute("user");
		System.out.println("request.getParameter(\"password\"): " + request.getParameter("password"));
		vo.setPassword(request.getParameter("password"));
		vo.setName(request.getParameter("name"));
		vo.setPhone(request.getParameter("phone"));
		vo.setEmail(request.getParameter("email"));
		vo.setZipNo(request.getParameter("zipNo"));
		vo.setRoadAddrPart1(request.getParameter("roadAddrPart1"));
		vo.setAddrDetail(request.getParameter("addrDetail"));
		vo.setId(request.getParameter("id"));
		myService.userUpdate(vo);
		return "my/mypage";
	}

	// 좌석 예약내역
	@RequestMapping("my_seat")
	public String my_seat(HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");
		System.out.println("list: " + myService.my_seat(vo));
		List<BookingVO> list = myService.my_seat(vo);
		model.addAttribute("list", list);
		return "my/mySeat";
	}

	// 사물함 예약내역
	@RequestMapping("my_cabinet")
	public String my_cabinet(HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");
		model.addAttribute("list", myService.my_cabinet(vo));
		return "my/myCabinet";
	}

	// 내모집글
	@RequestMapping("my_recruit")
	public String my_recruit(@RequestParam(defaultValue="1", required=false) int curPage, HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");

		
		// 페이징처리 시작부분
		System.out.println("default curPage: " + curPage);
		// 레코드 갯수 계산
		int count = myService.getTotal(vo);
		System.out.println("count: " + count);
		
		// 페이지 나누기 관련 처리
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		System.out.println("start: " + start);
		int end = boardPager.getPageEnd();
		System.out.println("end: " + end);
		String id = vo.getId();
		System.out.println("id: " + id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("start", start);
		map.put("end", end);
		
		List<RecruitVO> list = myService.my_recruit(map);
		System.out.println("list: " + list);
		
		// 데이터를 맵에 저장
		Map<String, Object> map_mv = new HashMap<String, Object>();
		map_mv.put("list", list);
		map_mv.put("count", count);
		map_mv.put("boardPager", boardPager);
		
		model.addAttribute("map", map_mv);
		// 페이징처리 끝부분

		/*model.addAttribute("my_recruit", myService.my_recruit(vo));*/
		return "my/myRecruit";
	}

	// 내모집글 상세
	@RequestMapping("detail")
	public String detail(@RequestParam(defaultValue="1") int curPage, @RequestParam int rc_idx, Model model) {
		System.out.println("rc_idx: " + rc_idx);
		RecruitVO vo = myService.getOne(rc_idx);
		System.out.println("vo: " + vo);
		model.addAttribute("vo", vo);
		model.addAttribute("curPage", curPage);
		return "my/myRecruitDetail";
	}

	// 내모집글 신청현황
	@RequestMapping("applyList")
	public String applyList(HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");
		model.addAttribute("applyList", myService.getApplyList(vo));
		return "my/applyList";
	}

	// 내모집글에 달린 댓글
	@RequestMapping("my_recruit_comment")
	public String my_recruit_comment(HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");
		List<CommentsVO> list = myService.my_recruit_comment(vo);
		System.out.println("list: " + list);
		model.addAttribute("my_recruit_comment", list);
		return "my/myRecruitComment";
	}

	// 자유게시판에 올린 글 목록
	@RequestMapping("board")
	public String board(@RequestParam(defaultValue="1", required=false) int curPage, HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");
		
		// 페이징처리 시작부분
		System.out.println("default curPage: " + curPage);
		// 레코드 갯수 계산
		int count = myService.board_cnt(vo);
		System.out.println("count: " + count);
		
		// 페이지 나누기 관련 처리
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		System.out.println("start: " + start);
		int end = boardPager.getPageEnd();
		System.out.println("end: " + end);
		String id = vo.getId();
		System.out.println("id: " + id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("start", start);
		map.put("end", end);
		
		List<BoardVO> list = myService.board(map);
		System.out.println("list: " + list);
		
		// 데이터를 맵에 저장
		Map<String, Object> map_mv = new HashMap<String, Object>();
		map_mv.put("list", list);
		map_mv.put("count", count);
		map_mv.put("boardPager", boardPager);
		
		model.addAttribute("map", map_mv);
		// 페이징처리 끝부분
		
		/*List<BoardVO> list = myService.board(vo);*/
		/*model.addAttribute("board", list);*/
		return "my/freeboard";
	}

	// 자유게시판에 달린 댓글 목록
	@RequestMapping("board_comment")
	public String board_comment(@RequestParam(defaultValue="1", required=false) int curPage, HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");
		
		// 페이징처리 시작부분
		System.out.println("default curPage: " + curPage);
		// 레코드 갯수 계산
		int count = myService.board_comment_cnt(vo);
		System.out.println("count: " + count);
		
		// 페이지 나누기 관련 처리
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		System.out.println("start: " + start);
		int end = boardPager.getPageEnd();
		System.out.println("end: " + end);
		String id = vo.getId();
		System.out.println("id: " + id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("start", start);
		map.put("end", end);
		
		List<CommentsVO> list = myService.board_comment(map);
		System.out.println("list: " + list);
		
		// 데이터를 맵에 저장
		Map<String, Object> map_mv = new HashMap<String, Object>();
		map_mv.put("list", list);
		map_mv.put("count", count);
		map_mv.put("boardPager", boardPager);
		
		model.addAttribute("map", map_mv);
		// 페이징처리 끝부분
		
		/*List<CommentsVO> list = myService.board_comment(vo);
		model.addAttribute("board_comment", list);*/
		return "my/freeboardComment";
	}

	@RequestMapping("boardDetail")
	public String boardDetail(@RequestParam(defaultValue="1") int curPage, @RequestParam int b_idx, Model model) {
		System.out.println("b_idx: " + b_idx);
		BoardVO vo = myService.getBoardOne(b_idx);
		System.out.println("vo: " + vo);
		model.addAttribute("curPage", curPage);
		/*model.addAttribute("vo", vo);*/
		return "my/freeboardDetail";
	}

}
