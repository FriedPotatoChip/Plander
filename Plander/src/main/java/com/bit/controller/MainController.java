package com.bit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(UserVO vo, HttpSession session) {
		System.out.println("controller 로그인 테스트");
		UserVO user = service.getUser(vo);
		
		if (user == null) {
			System.out.println("로그인 실패" + user);
			return "main";
		} else if (user.getId().equals(vo.getId()) || user.getPassword().equals(vo.getPassword())) {
			session.setAttribute("user", user);
			System.out.println("user 확인 : " + user);
			return "main";
		} else {
			System.out.println("로그인 실패");
			return "main";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("로그아웃 되었습니다.");
		session.invalidate();
		return "main";
	}
	
	
}
