package com.bit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.domain.UserVO;
import com.bit.service.UserService;

@Controller
@RequestMapping("/Plander")
public class MainController {
	
	@Autowired
	private UserService service;
	
	@RequestMapping("")
	public String main() {
		System.out.println("메인화면");
		return "main";
	}
	
	@RequestMapping("/login")
	public String login(UserVO vo, HttpSession session) {
		System.out.println("controller 로그인 테스트");
		service.getUser(vo);
		
		System.out.println("vo : " + vo);
		return "main";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("로그아웃 되었습니다.");
		session.invalidate();
		return "main";
	}
	
	
}
