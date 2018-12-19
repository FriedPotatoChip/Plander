package com.bit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bit.domain.Pagination;
import com.bit.domain.UsersVO;
import com.bit.service.MyService;

@Controller
@SessionAttributes("id")
@RequestMapping("/TMS/mypage")
public class MypageController {

	@Autowired
	MyService myService;

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
	public String board(Model model, HttpSession session, @RequestParam(defaultValue = "1") int curPage) {
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);
		
		model.addAttribute("board", myService.board(id));
		return "my/board";
	}

	@RequestMapping("board_comment")
	public String board_comment(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);
		model.addAttribute("board_comment", myService.board_comment(id));
		return "my/board_comment";
	}

	@RequestMapping("comment")
	public String comment(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);
		model.addAttribute("comment", myService.comment(id));
		return "my/comment";
	}

	@RequestMapping("comment_comment")
	public String comment_comment(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);
		model.addAttribute("comment_comment", myService.comment_comment(id));
		return "my/comment_comment";
	}

	@RequestMapping("seat")
	public String seat(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);
		model.addAttribute("seat", myService.seat(id));
		return "my/seat";
	}

	@RequestMapping("cabinet")
	public String cabinet(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);
		model.addAttribute("cabinet", myService.cabinet(id));
		return "my/cabinet";
	}

	@RequestMapping("board2")
	public String board2(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);
		model.addAttribute("board2", myService.board2(id));
		return "my/board2";
	}

	@RequestMapping("board_comment2")
	public String board_comment2(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);
		model.addAttribute("board_comment2", myService.board_comment2(id));
		return "my/board_comment2";
	}

	@RequestMapping("comment2")
	public String comment2(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);
		model.addAttribute("comment2", myService.comment2(id));
		return "my/comment2";
	}

	@RequestMapping("comment_comment2")
	public String comment_comment2(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);
		model.addAttribute("comment_comment2", myService.comment_comment2(id));
		return "my/comment_comment2";
	}

}
