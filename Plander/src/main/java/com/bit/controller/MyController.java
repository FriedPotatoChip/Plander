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

import com.bit.domain.ApplyVO;
import com.bit.domain.BoardVO;
import com.bit.domain.BookingCbVO;
import com.bit.domain.BookingVO;
import com.bit.domain.CommentsVO;
import com.bit.domain.RecruitVO;
import com.bit.domain.UsersVO;
import com.bit.service.MyService;
import com.bit.utils.PagingVO;

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

	// 내정보수정
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

	// 페이징
	public Map<String, Object> paging(PagingVO page, UsersVO vo, int total) {

		page = new PagingVO(page.getNowPage(), total);
		page.CalcPage(page.getNowPage());

		Map<String, Object> map = new HashMap();
		map.put("id", vo.getId());
		map.put("page", page);

		System.out.println("페이징 테스트 map: " + map);
		return map;
	}

	// 좌석 예약내역
	@RequestMapping("my_seat")
	public String my_seat(PagingVO page, HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");

		// 페이징 처리
		int total = myService.getTotalSeat(vo);
		System.out.println("total: " + total);
		Map<String, Object> m = paging(page, vo, total);
		page = (PagingVO) m.get("page");
		model.addAttribute("page", page);

		Map<String, Object> map = new HashMap<>();
		map.put("id", vo.getId());
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		System.out.println("id: " + vo.getId() + ", start: " + page.getStart() + ", end: " + page.getEnd());
		List<BookingVO> list = myService.my_seat(map);
		System.out.println("list: " + list);
		model.addAttribute("list", list);

		return "my/mySeat";
	}
	
	// 예약좌석삭제
	@RequestMapping("delSeat")
	public String delSeat(@RequestParam int bk_idx) {
		
		int result = myService.delSeat(bk_idx);
		System.out.println("처리결과: " + result);
		
		return "redirect: /TMS/my";
	}

	// 사물함 예약내역
	@RequestMapping("my_cabinet")
	public String my_cabinet(PagingVO page, HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");

		// 페이징 처리
		int total = myService.getTotalCabinet(vo);
		System.out.println("total: " + total);
		Map<String, Object> m = paging(page, vo, total);
		page = (PagingVO) m.get("page");
		model.addAttribute("page", page);

		Map<String, Object> map = new HashMap<>();
		map.put("id", vo.getId());
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		System.out.println("id: " + vo.getId() + ", start: " + page.getStart() + ", end: " + page.getEnd());
		List<BookingCbVO> list = myService.my_cabinet(map);
		System.out.println("list: " + list);
		model.addAttribute("list", list);

		return "my/myCabinet";
	}
	
	// 예약사물함삭제
	@RequestMapping("delCabinet")
	public String delCabinet(@RequestParam int ckb_idx) {
		
		int result = myService.delCabinet(ckb_idx);
		System.out.println("처리결과: " + result);
		
		return "redirect: /TMS/my";
	}

	// 내모집글
	@RequestMapping("my_recruit")
	public String my_recruit(PagingVO page, HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");

		// 페이징 처리
		int total = myService.getTotal(vo);
		System.out.println("total: " + total);
		Map<String, Object> m = paging(page, vo, total);
		page = (PagingVO) m.get("page");
		model.addAttribute("page", page);

		Map<String, Object> map = new HashMap<>();
		map.put("id", vo.getId());
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		System.out.println("id: " + vo.getId() + ", start: " + page.getStart() + ", end: " + page.getEnd());
		List<RecruitVO> list = myService.my_recruit(map);
		System.out.println("list: " + list);
		model.addAttribute("list", list);

		return "my/myRecruit";
	}

	// 내모집글 상세
	@RequestMapping("detail")
	public String detail(PagingVO page, @RequestParam int rc_idx, Model model) {

		model.addAttribute("vo", myService.getOne(rc_idx));
		model.addAttribute("nowPage", page.getNowPage());

		return "my/myRecruitDetail";
	}

	// 내모집글 신청현황
	@RequestMapping("applyList")
	public String applyList(PagingVO page, HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");

		// 페이징 처리
		int total = myService.getTotalApply(vo);
		System.out.println("total: " + total);
		Map<String, Object> m = paging(page, vo, total);
		page = (PagingVO) m.get("page");
		model.addAttribute("page", page);

		Map<String, Object> map = new HashMap<>();
		map.put("id", vo.getId());
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		System.out.println("id: " + vo.getId() + ", start: " + page.getStart() + ", end: " + page.getEnd());
		List<ApplyVO> list = myService.getApplyList(map);
		System.out.println("list: " + list);
		model.addAttribute("list", list);

		return "my/applyList";
	}

	// 내모집글에 달린 댓글
	@RequestMapping("my_recruit_comment")
	public String my_recruit_comment(PagingVO page, HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");

		// 페이징 처리
		int total = myService.getTotalComment(vo);
		System.out.println("total: " + total);
		Map<String, Object> m = paging(page, vo, total);
		page = (PagingVO) m.get("page");
		model.addAttribute("page", page);

		Map<String, Object> map = new HashMap<>();
		map.put("id", vo.getId());
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		System.out.println("id: " + vo.getId() + ", start: " + page.getStart() + ", end: " + page.getEnd());
		List<CommentsVO> list = myService.my_recruit_comment(map);
		System.out.println("list: " + list);
		model.addAttribute("list", list);

		return "my/myRecruitComment";
	}

	// 자유게시판에 올린 글 목록
	@RequestMapping("board")
	public String board(PagingVO page, HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");
		
		// 페이징 처리
		int total = myService.board_cnt(vo);
		System.out.println("total: " + total);
		Map<String, Object> m = paging(page, vo, total);
		page = (PagingVO) m.get("page");
		model.addAttribute("page", page);

		Map<String, Object> map = new HashMap<>();
		map.put("id", vo.getId());
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		System.out.println("id: " + vo.getId() + ", start: " + page.getStart() + ", end: " + page.getEnd());
		List<BoardVO> list = myService.board(map);
		System.out.println("list: " + list);
		model.addAttribute("list", list);
		
		return "my/freeboard";
	}

	// 자유게시판에 달린 댓글 목록
	@RequestMapping("board_comment")
	public String board_comment(PagingVO page, HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");
	
		// 페이징 처리
		int total = myService.board_comment_cnt(vo);
		System.out.println("total: " + total);
		Map<String, Object> m = paging(page, vo, total);
		page = (PagingVO) m.get("page");
		model.addAttribute("page", page);

		Map<String, Object> map = new HashMap<>();
		map.put("id", vo.getId());
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		System.out.println("id: " + vo.getId() + ", start: " + page.getStart() + ", end: " + page.getEnd());
		List<CommentsVO> list = myService.board_comment(map);
		System.out.println("list: " + list);
		model.addAttribute("list", list);
		
		return "my/freeboardComment";
	}

	// 자유게시판 상세보기
	@RequestMapping("boardDetail")
	public String boardDetail(PagingVO page, @RequestParam int b_idx, Model model) {

		model.addAttribute("vo", myService.getBoardOne(b_idx));
		model.addAttribute("nowPage", page.getNowPage());

		return "my/freeboardDetail";
	}

}
