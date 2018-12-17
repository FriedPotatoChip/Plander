package com.bit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.domain.UsersVO;
import com.bit.service.MyService;

@Controller
@RequestMapping("/TMS/mypage")
public class MypageController {
	
	@Autowired
	MyService myService;

	@RequestMapping("")
	public String mypage(String id, Model model) {
		System.out.println("id: " + id);
		model.addAttribute("vo", myService.user(id));
		return "my/mypage";
	}
	
	@RequestMapping("board")
	public String board(String id, Model model) {
		return "my/board";
	}
	
	@RequestMapping("board_comment")
	public String board_comment() {
		return "my/board_comment";
	}
	
	@RequestMapping("comment")
	public String comment() {
		return "my/comment";
	}
	
	@RequestMapping("comment_comment")
	public String comment_comment() {
		return "my/comment_comment";
	}
	
	@RequestMapping("seat")
	public String seat() {
		return "my/seat";
	}
	
	@RequestMapping("cabinet")
	public String cabinet() {
		return "my/cabinet";
	}
	
	@RequestMapping("board2")
	public String board2() {
		return "my/board2";
	}
	
	@RequestMapping("board_comment2")
	public String board_comment2() {
		return "my/board_comment2";
	}
	
	@RequestMapping("comment2")
	public String comment2() {
		return "my/comment2";
	}
	
	@RequestMapping("comment_comment2")
	public String comment_comment2() {
		return "my/comment_comment2";
	}

}
