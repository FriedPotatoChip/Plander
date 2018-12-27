package com.bit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bit.domain.BookingVO;
import com.bit.domain.CommentsVO;
import com.bit.domain.RecruitVO;
import com.bit.domain.UsersVO;
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
	public String my_recruit(HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");
		model.addAttribute("my_recruit", myService.my_recruit(vo));
		return "my/myRecruit";
	}
	
	// 내모집글 상세
	@RequestMapping("detail")
	public String detail(@RequestParam int rc_idx, Model model) {
		System.out.println("rc_idx: " + rc_idx);
		RecruitVO vo = myService.getOne(rc_idx);
		System.out.println("vo: " + vo);
		model.addAttribute("vo", vo);
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
	public String board(HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");
		
		return "my/freeboard";
	}
	
	// 자유게시판에 달린 댓글 목록
	@RequestMapping("board_comment")
	public String board_comment(HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");
		
		return "my/freeboardComment";
	}
	
	

}
