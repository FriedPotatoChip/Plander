package com.bit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bit.domain.BoardVO;
import com.bit.domain.Paging;
import com.bit.domain.UsersVO;
import com.bit.service.MyService;

@Controller
@SessionAttributes("id")
@RequestMapping("/TMS/mypage")
public class MypageController {

	@Autowired
	MyService myService;

	// 페이징 처리를 위한 객체 생성
	Paging p = new Paging();

	@RequestMapping("")
	public String mypage(String id, Model model, HttpSession session) {
		System.out.println("id: " + id);
		model.addAttribute("id", id);
		session.setAttribute("user", myService.user(id));
		return "my/mypage";
	}

	@RequestMapping("update")
	public String update(Model model, HttpSession session) {
		UsersVO user = (UsersVO) session.getAttribute("user");
		System.out.println("user: " + user.toString());
		model.addAttribute("user", user);
		return "my/update";
	}

	@RequestMapping("updateOk")
	public String updateOk(String password, String name, String phone, String email, String zipNo, String roadAddrPart1,
			String addrDetail, HttpSession session, Model model) {
		UsersVO user = (UsersVO) session.getAttribute("user");
		System.out.println("user before: " + user.toString());
		user.setPassword(password);
		user.setName(name);
		user.setPhone(phone);
		user.setEmail(email);
		user.setZipNo(zipNo);
		user.setRoadAddrPart1(roadAddrPart1);
		user.setAddrDetail(addrDetail);
		System.out.println("user after: " + user.toString());
		myService.update(user);
		model.addAttribute("id", user.getId());
		return "my/mypage";
	}

	@RequestMapping("board")
	public String board(Model model, HttpSession session, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);

		// 1. 전체 게시물의 수를 구한다.
		p.setTotalRecord(myService.board_cnt(id));
		p.setTotalPage(); // 전체 페이지 갯수 구하기

		System.out.println("전체 건수: " + p.getTotalRecord());
		System.out.println("전체 페이지 갯수: " + p.getTotalPage());

		// 2. 현재 페이지 구하기(default : 1)
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		// 3. 현재페이지의 시작번호(begin)와 끝번호(end) 구하기
		// 시작번호 먼저 구하기(복잡) -------------
		// p.setBegin((p.getNowPage() - 1) * p.getNumPerPage() + 1);
		// p.setEnd(p.getBegin() + p.getNumPerPage() - 1);

		// 끝번호 먼저 구하기 ---------------
		// 끝번호(end) = 현재페이지번호 * 페이지당표시글수
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작번호(begin) : " + p.getBegin());
		System.out.println("끝번호(end) : " + p.getEnd());

		// 4. 블록의 시작페이지, 끝페이지 번호 구하기(현재페이지 번호 이용)
		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

		// endPage 먼저 구하기
		// 현재 페이지 / pagePerBlock 올림처리 * pagePerBlock

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작페이지(beginPage) : " + p.getBeginPage());
		System.out.println("끝페이지(endPage) : " + p.getEndPage());

		// 4-1 끝페이지(endPage)가 총페이지(totalPage)보다 크면
		// endPage = totalPage 설정
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		System.out.println("변경후 끝페이지(endPage) : " + p.getEndPage());

		model.addAttribute("pvo", p);
		model.addAttribute("cPage", cPage);
		List<BoardVO> list = myService.board(id);
		model.addAttribute("board", list);
		return "my/board";
	}

	@RequestMapping("board_comment")
	public String board_comment(Model model, HttpSession session, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);
		
		// 1. 전체 게시물의 수를 구한다.
		p.setTotalRecord(myService.board_comment_cnt(id));
		p.setTotalPage(); // 전체 페이지 갯수 구하기

		System.out.println("전체 건수: " + p.getTotalRecord());
		System.out.println("전체 페이지 갯수: " + p.getTotalPage());

		// 2. 현재 페이지 구하기(default : 1)
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		// 3. 현재페이지의 시작번호(begin)와 끝번호(end) 구하기
		// 시작번호 먼저 구하기(복잡) -------------
		// p.setBegin((p.getNowPage() - 1) * p.getNumPerPage() + 1);
		// p.setEnd(p.getBegin() + p.getNumPerPage() - 1);

		// 끝번호 먼저 구하기 ---------------
		// 끝번호(end) = 현재페이지번호 * 페이지당표시글수
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작번호(begin) : " + p.getBegin());
		System.out.println("끝번호(end) : " + p.getEnd());

		// 4. 블록의 시작페이지, 끝페이지 번호 구하기(현재페이지 번호 이용)
		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

		// endPage 먼저 구하기
		// 현재 페이지 / pagePerBlock 올림처리 * pagePerBlock

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작페이지(beginPage) : " + p.getBeginPage());
		System.out.println("끝페이지(endPage) : " + p.getEndPage());

		// 4-1 끝페이지(endPage)가 총페이지(totalPage)보다 크면
		// endPage = totalPage 설정
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		System.out.println("변경후 끝페이지(endPage) : " + p.getEndPage());

		model.addAttribute("pvo", p);
		model.addAttribute("cPage", cPage);
		model.addAttribute("board_comment", myService.board_comment(id));
		return "my/board_comment";
	}

	@RequestMapping("comment")
	public String comment(Model model, HttpSession session, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);
		
		// 1. 전체 게시물의 수를 구한다.
		p.setTotalRecord(myService.comment_cnt(id));
		p.setTotalPage(); // 전체 페이지 갯수 구하기

		System.out.println("전체 건수: " + p.getTotalRecord());
		System.out.println("전체 페이지 갯수: " + p.getTotalPage());

		// 2. 현재 페이지 구하기(default : 1)
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		// 3. 현재페이지의 시작번호(begin)와 끝번호(end) 구하기
		// 시작번호 먼저 구하기(복잡) -------------
		// p.setBegin((p.getNowPage() - 1) * p.getNumPerPage() + 1);
		// p.setEnd(p.getBegin() + p.getNumPerPage() - 1);

		// 끝번호 먼저 구하기 ---------------
		// 끝번호(end) = 현재페이지번호 * 페이지당표시글수
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작번호(begin) : " + p.getBegin());
		System.out.println("끝번호(end) : " + p.getEnd());

		// 4. 블록의 시작페이지, 끝페이지 번호 구하기(현재페이지 번호 이용)
		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

		// endPage 먼저 구하기
		// 현재 페이지 / pagePerBlock 올림처리 * pagePerBlock

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작페이지(beginPage) : " + p.getBeginPage());
		System.out.println("끝페이지(endPage) : " + p.getEndPage());

		// 4-1 끝페이지(endPage)가 총페이지(totalPage)보다 크면
		// endPage = totalPage 설정
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		System.out.println("변경후 끝페이지(endPage) : " + p.getEndPage());

		model.addAttribute("pvo", p);
		model.addAttribute("cPage", cPage);
		model.addAttribute("comment", myService.comment(id));
		return "my/comment";
	}

	@RequestMapping("comment_comment")
	public String comment_comment(Model model, HttpSession session, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);
		
		// 1. 전체 게시물의 수를 구한다.
		p.setTotalRecord(myService.comment_comment_cnt(id));
		p.setTotalPage(); // 전체 페이지 갯수 구하기

		System.out.println("전체 건수: " + p.getTotalRecord());
		System.out.println("전체 페이지 갯수: " + p.getTotalPage());

		// 2. 현재 페이지 구하기(default : 1)
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		// 3. 현재페이지의 시작번호(begin)와 끝번호(end) 구하기
		// 시작번호 먼저 구하기(복잡) -------------
		// p.setBegin((p.getNowPage() - 1) * p.getNumPerPage() + 1);
		// p.setEnd(p.getBegin() + p.getNumPerPage() - 1);

		// 끝번호 먼저 구하기 ---------------
		// 끝번호(end) = 현재페이지번호 * 페이지당표시글수
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작번호(begin) : " + p.getBegin());
		System.out.println("끝번호(end) : " + p.getEnd());

		// 4. 블록의 시작페이지, 끝페이지 번호 구하기(현재페이지 번호 이용)
		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

		// endPage 먼저 구하기
		// 현재 페이지 / pagePerBlock 올림처리 * pagePerBlock

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작페이지(beginPage) : " + p.getBeginPage());
		System.out.println("끝페이지(endPage) : " + p.getEndPage());

		// 4-1 끝페이지(endPage)가 총페이지(totalPage)보다 크면
		// endPage = totalPage 설정
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		System.out.println("변경후 끝페이지(endPage) : " + p.getEndPage());

		model.addAttribute("pvo", p);
		model.addAttribute("cPage", cPage);
		model.addAttribute("comment_comment", myService.comment_comment(id));
		return "my/comment_comment";
	}

	@RequestMapping("seat")
	public String seat(Model model, HttpSession session, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);
		
		// 1. 전체 게시물의 수를 구한다.
		p.setTotalRecord(myService.seat_cnt(id));
		p.setTotalPage(); // 전체 페이지 갯수 구하기

		System.out.println("전체 건수: " + p.getTotalRecord());
		System.out.println("전체 페이지 갯수: " + p.getTotalPage());

		// 2. 현재 페이지 구하기(default : 1)
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		// 3. 현재페이지의 시작번호(begin)와 끝번호(end) 구하기
		// 시작번호 먼저 구하기(복잡) -------------
		// p.setBegin((p.getNowPage() - 1) * p.getNumPerPage() + 1);
		// p.setEnd(p.getBegin() + p.getNumPerPage() - 1);

		// 끝번호 먼저 구하기 ---------------
		// 끝번호(end) = 현재페이지번호 * 페이지당표시글수
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작번호(begin) : " + p.getBegin());
		System.out.println("끝번호(end) : " + p.getEnd());

		// 4. 블록의 시작페이지, 끝페이지 번호 구하기(현재페이지 번호 이용)
		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

		// endPage 먼저 구하기
		// 현재 페이지 / pagePerBlock 올림처리 * pagePerBlock

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작페이지(beginPage) : " + p.getBeginPage());
		System.out.println("끝페이지(endPage) : " + p.getEndPage());

		// 4-1 끝페이지(endPage)가 총페이지(totalPage)보다 크면
		// endPage = totalPage 설정
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		System.out.println("변경후 끝페이지(endPage) : " + p.getEndPage());

		model.addAttribute("pvo", p);
		model.addAttribute("cPage", cPage);
		model.addAttribute("seat", myService.seat(id));
		return "my/seat";
	}

	@RequestMapping("cabinet")
	public String cabinet(Model model, HttpSession session, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);
		
		// 1. 전체 게시물의 수를 구한다.
		p.setTotalRecord(myService.cabinet_cnt(id));
		p.setTotalPage(); // 전체 페이지 갯수 구하기

		System.out.println("전체 건수: " + p.getTotalRecord());
		System.out.println("전체 페이지 갯수: " + p.getTotalPage());

		// 2. 현재 페이지 구하기(default : 1)
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		// 3. 현재페이지의 시작번호(begin)와 끝번호(end) 구하기
		// 시작번호 먼저 구하기(복잡) -------------
		// p.setBegin((p.getNowPage() - 1) * p.getNumPerPage() + 1);
		// p.setEnd(p.getBegin() + p.getNumPerPage() - 1);

		// 끝번호 먼저 구하기 ---------------
		// 끝번호(end) = 현재페이지번호 * 페이지당표시글수
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작번호(begin) : " + p.getBegin());
		System.out.println("끝번호(end) : " + p.getEnd());

		// 4. 블록의 시작페이지, 끝페이지 번호 구하기(현재페이지 번호 이용)
		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

		// endPage 먼저 구하기
		// 현재 페이지 / pagePerBlock 올림처리 * pagePerBlock

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작페이지(beginPage) : " + p.getBeginPage());
		System.out.println("끝페이지(endPage) : " + p.getEndPage());

		// 4-1 끝페이지(endPage)가 총페이지(totalPage)보다 크면
		// endPage = totalPage 설정
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		System.out.println("변경후 끝페이지(endPage) : " + p.getEndPage());

		model.addAttribute("pvo", p);
		model.addAttribute("cPage", cPage);
		model.addAttribute("cabinet", myService.cabinet(id));
		return "my/cabinet";
	}

	@RequestMapping("board2")
	public String board2(Model model, HttpSession session, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);
		
		// 1. 전체 게시물의 수를 구한다.
		p.setTotalRecord(myService.board2_cnt(id));
		p.setTotalPage(); // 전체 페이지 갯수 구하기

		System.out.println("전체 건수: " + p.getTotalRecord());
		System.out.println("전체 페이지 갯수: " + p.getTotalPage());

		// 2. 현재 페이지 구하기(default : 1)
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		// 3. 현재페이지의 시작번호(begin)와 끝번호(end) 구하기
		// 시작번호 먼저 구하기(복잡) -------------
		// p.setBegin((p.getNowPage() - 1) * p.getNumPerPage() + 1);
		// p.setEnd(p.getBegin() + p.getNumPerPage() - 1);

		// 끝번호 먼저 구하기 ---------------
		// 끝번호(end) = 현재페이지번호 * 페이지당표시글수
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작번호(begin) : " + p.getBegin());
		System.out.println("끝번호(end) : " + p.getEnd());

		// 4. 블록의 시작페이지, 끝페이지 번호 구하기(현재페이지 번호 이용)
		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

		// endPage 먼저 구하기
		// 현재 페이지 / pagePerBlock 올림처리 * pagePerBlock

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작페이지(beginPage) : " + p.getBeginPage());
		System.out.println("끝페이지(endPage) : " + p.getEndPage());

		// 4-1 끝페이지(endPage)가 총페이지(totalPage)보다 크면
		// endPage = totalPage 설정
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		System.out.println("변경후 끝페이지(endPage) : " + p.getEndPage());

		model.addAttribute("pvo", p);
		model.addAttribute("cPage", cPage);
		model.addAttribute("board2", myService.board2(id));
		return "my/board2";
	}

	@RequestMapping("board_comment2")
	public String board_comment2(Model model, HttpSession session, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);
		
		// 1. 전체 게시물의 수를 구한다.
		p.setTotalRecord(myService.board_comment2_cnt(id));
		p.setTotalPage(); // 전체 페이지 갯수 구하기

		System.out.println("전체 건수: " + p.getTotalRecord());
		System.out.println("전체 페이지 갯수: " + p.getTotalPage());

		// 2. 현재 페이지 구하기(default : 1)
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		// 3. 현재페이지의 시작번호(begin)와 끝번호(end) 구하기
		// 시작번호 먼저 구하기(복잡) -------------
		// p.setBegin((p.getNowPage() - 1) * p.getNumPerPage() + 1);
		// p.setEnd(p.getBegin() + p.getNumPerPage() - 1);

		// 끝번호 먼저 구하기 ---------------
		// 끝번호(end) = 현재페이지번호 * 페이지당표시글수
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작번호(begin) : " + p.getBegin());
		System.out.println("끝번호(end) : " + p.getEnd());

		// 4. 블록의 시작페이지, 끝페이지 번호 구하기(현재페이지 번호 이용)
		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

		// endPage 먼저 구하기
		// 현재 페이지 / pagePerBlock 올림처리 * pagePerBlock

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작페이지(beginPage) : " + p.getBeginPage());
		System.out.println("끝페이지(endPage) : " + p.getEndPage());

		// 4-1 끝페이지(endPage)가 총페이지(totalPage)보다 크면
		// endPage = totalPage 설정
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		System.out.println("변경후 끝페이지(endPage) : " + p.getEndPage());

		model.addAttribute("pvo", p);
		model.addAttribute("cPage", cPage);
		model.addAttribute("board_comment2", myService.board_comment2(id));
		return "my/board_comment2";
	}

	@RequestMapping("comment2")
	public String comment2(Model model, HttpSession session, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);
		
		// 1. 전체 게시물의 수를 구한다.
		p.setTotalRecord(myService.comment2_cnt(id));
		p.setTotalPage(); // 전체 페이지 갯수 구하기

		System.out.println("전체 건수: " + p.getTotalRecord());
		System.out.println("전체 페이지 갯수: " + p.getTotalPage());

		// 2. 현재 페이지 구하기(default : 1)
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		// 3. 현재페이지의 시작번호(begin)와 끝번호(end) 구하기
		// 시작번호 먼저 구하기(복잡) -------------
		// p.setBegin((p.getNowPage() - 1) * p.getNumPerPage() + 1);
		// p.setEnd(p.getBegin() + p.getNumPerPage() - 1);

		// 끝번호 먼저 구하기 ---------------
		// 끝번호(end) = 현재페이지번호 * 페이지당표시글수
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작번호(begin) : " + p.getBegin());
		System.out.println("끝번호(end) : " + p.getEnd());

		// 4. 블록의 시작페이지, 끝페이지 번호 구하기(현재페이지 번호 이용)
		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

		// endPage 먼저 구하기
		// 현재 페이지 / pagePerBlock 올림처리 * pagePerBlock

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작페이지(beginPage) : " + p.getBeginPage());
		System.out.println("끝페이지(endPage) : " + p.getEndPage());

		// 4-1 끝페이지(endPage)가 총페이지(totalPage)보다 크면
		// endPage = totalPage 설정
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		System.out.println("변경후 끝페이지(endPage) : " + p.getEndPage());

		model.addAttribute("pvo", p);
		model.addAttribute("cPage", cPage);
		model.addAttribute("comment2", myService.comment2(id));
		return "my/comment2";
	}

	@RequestMapping("comment_comment2")
	public String comment_comment2(Model model, HttpSession session, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);
		
		// 1. 전체 게시물의 수를 구한다.
		p.setTotalRecord(myService.comment_comment2_cnt(id));
		p.setTotalPage(); // 전체 페이지 갯수 구하기

		System.out.println("전체 건수: " + p.getTotalRecord());
		System.out.println("전체 페이지 갯수: " + p.getTotalPage());

		// 2. 현재 페이지 구하기(default : 1)
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		// 3. 현재페이지의 시작번호(begin)와 끝번호(end) 구하기
		// 시작번호 먼저 구하기(복잡) -------------
		// p.setBegin((p.getNowPage() - 1) * p.getNumPerPage() + 1);
		// p.setEnd(p.getBegin() + p.getNumPerPage() - 1);

		// 끝번호 먼저 구하기 ---------------
		// 끝번호(end) = 현재페이지번호 * 페이지당표시글수
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작번호(begin) : " + p.getBegin());
		System.out.println("끝번호(end) : " + p.getEnd());

		// 4. 블록의 시작페이지, 끝페이지 번호 구하기(현재페이지 번호 이용)
		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

		// endPage 먼저 구하기
		// 현재 페이지 / pagePerBlock 올림처리 * pagePerBlock

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작페이지(beginPage) : " + p.getBeginPage());
		System.out.println("끝페이지(endPage) : " + p.getEndPage());

		// 4-1 끝페이지(endPage)가 총페이지(totalPage)보다 크면
		// endPage = totalPage 설정
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		System.out.println("변경후 끝페이지(endPage) : " + p.getEndPage());

		model.addAttribute("pvo", p);
		model.addAttribute("cPage", cPage);
		model.addAttribute("comment_comment2", myService.comment_comment2(id));
		return "my/comment_comment2";
	}

}
