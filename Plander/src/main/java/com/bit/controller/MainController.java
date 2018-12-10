package com.bit.controller;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.domain.UserVO;
import com.bit.service.MyService;
import com.bit.service.UserService;

@Controller
@RequestMapping("/Plander")
public class MainController {
	
	@Autowired
	private UserService service;
	
	@Autowired
	private MyService myservice;
	
	@RequestMapping("")
	public String main() {
		System.out.println("메인화면");
		return "main";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(UserVO vo, HttpSession session, Model model) {
		System.out.println("controller 로그인 테스트");
		UserVO user = service.getUser(vo);
		
		if (user == null) {
			System.out.println("로그인 실패" + user);
			return "main";
		} else if (user.getId().equals(vo.getId()) || user.getPassword().equals(vo.getPassword())) {
			session.setAttribute("user", user);
			System.out.println("user 확인 : " + user);
			model.addAttribute("getPlannerCnt", myservice.getPlannerCnt(user.getU_idx()));
			model.addAttribute("getBookmarkCnt", myservice.getBookmarkCnt(user.getU_idx()));
			model.addAttribute("getCommentCnt", myservice.getCommentCnt(user.getU_idx()));
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
	
	//회원가입
	@RequestMapping(value="/join", method = { RequestMethod.GET, RequestMethod.POST })
	public String join(UserVO vo, Model model) {
		System.out.println("controller 회원가입");
		service.join(vo);
		System.out.println("컨트롤러에서 : " + vo);
		model.addAttribute("username", vo.getName());
		return "redirect:main/joinOk";
	}
	
	//회원가입 아이디 중복확인
	@RequestMapping(value="/idchk", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String idChk(UserVO vo, Model model) {
		int result = service.idchk(vo);
		return String.valueOf(result);
	}
	

	
}
