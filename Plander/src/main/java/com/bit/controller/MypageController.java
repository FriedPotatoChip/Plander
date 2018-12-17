package com.bit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/TMS/mypage")
public class MypageController {

	@RequestMapping("")
	public String mypage() {
		return "my/mypage";
	}
	
	@RequestMapping("board")
	public String board() {
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
