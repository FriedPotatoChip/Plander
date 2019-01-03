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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bit.domain.BookingVO;
import com.bit.domain.CommentsVO;
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
	public String my_seat(PagingVO page, HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");
		System.out.println("list: " + myService.my_seat(vo));
		List<BookingVO> list = myService.my_seat(vo);
		model.addAttribute("list", list);
		
		//페이징 처리
		Map<String, Object> map = paging(page, vo, myService.getTotalSeat(vo));
		page = (PagingVO) map.get("page");
		model.addAttribute("page", page);
		return "my/mySeat";
	}
	
	
	// 사물함 예약내역
	@RequestMapping("my_cabinet")
	public String my_cabinet(PagingVO page, HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");
		model.addAttribute("list", myService.my_cabinet(vo));
		
		//페이징 처리
		Map<String, Object> map = paging(page, vo, myService.getTotalCabinet(vo));
		page = (PagingVO) map.get("page");
		model.addAttribute("page", page);
		return "my/myCabinet";
	}
	
	
	//페이징
	public Map<String, Object> paging(PagingVO page, UsersVO vo, int total) {
		
		page = new PagingVO(page.getNowPage(), total);
		page.CalcPage(page.getNowPage());
		
		Map<String, Object> map = new HashMap();
		map.put("id", vo.getId());
		map.put("page", page);
		
		System.out.println("페이징 테스트 map: " + map);
		return map;
	}
	
	
	// 내모집글
	@RequestMapping("my_recruit")
	public String my_recruit(PagingVO page, HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");
		page = new PagingVO(page.getNowPage(), myService.getTotal(vo));
		page.CalcPage(page.getNowPage());

		Map<String, Object> map = new HashMap();
		map.put("id", vo.getId());
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		System.out.println("map: " + map);
		System.out.println("page : " + page);
		
		model.addAttribute("page", page);
		model.addAttribute("list", myService.my_recruit(map));
		

		/*model.addAttribute("my_recruit", myService.my_recruit(vo));*/
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
	public String applyList(HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");
		System.out.println("vo: " + vo);
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
	public String board(PagingVO page, HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");
		page = new PagingVO(page.getNowPage(), page.getCntPerPage(), myService.board_cnt(vo));
		page.CalcPage(page.getNowPage(), page.getCntPerPage());
		
		Map<String, Object> map = new HashMap();
		map.put("id", vo.getId());
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		System.out.println("map: " + map);
		
		model.addAttribute("page", page);
		model.addAttribute("list", myService.board(map));
		
		/*List<BoardVO> list = myService.board(vo);*/
		/*model.addAttribute("board", list);*/
		return "my/freeboard";
	}

	// 자유게시판에 달린 댓글 목록
	@RequestMapping("board_comment")
	public String board_comment(PagingVO page, HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");
		page = new PagingVO(page.getNowPage(), page.getCntPerPage(), myService.board_comment_cnt(vo));
		page.CalcPage(page.getNowPage(), page.getCntPerPage());
		
		Map<String, Object> map = new HashMap();
		map.put("id", vo.getId());
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		System.out.println("map: " + map);
		
		model.addAttribute("page", page);
		model.addAttribute("list", myService.board_comment(map));
		
		/*List<CommentsVO> list = myService.board_comment(vo);
		model.addAttribute("board_comment", list);*/
		return "my/freeboardComment";
	}

	@RequestMapping("boardDetail")
	public String boardDetail(PagingVO page, @RequestParam int b_idx, Model model) {
		System.out.println("b_idx: " + b_idx);
		
		model.addAttribute("vo", myService.getBoardOne(b_idx));
		model.addAttribute("nowPage", page.getNowPage());
		model.addAttribute("cntPerPage", page.getCntPerPage());
		
		/*model.addAttribute("vo", vo);*/
		return "my/freeboardDetail";
	}
	
	@RequestMapping("delSeat")
	public String delSeat(@RequestParam int bk_idx) {
		System.out.println("bk_idx: " + bk_idx);
		int result = myService.delSeat(bk_idx);
		System.out.println("삭제 결과: " + result);
		return "redirect: /TMS/my";
	}
	
	@RequestMapping("delCabinet")
	public String delCabinet(@RequestParam int ckb_idx) {
		System.out.println("ckb_idx: " + ckb_idx);
		int result = myService.delCabinet(ckb_idx);
		System.out.println("삭제 결과: " + result);
		return "redirect: /TMS/my";
	}
	

}
