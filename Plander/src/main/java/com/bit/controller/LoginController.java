package com.bit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.domain.UsersVO;
import com.bit.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService service;
	
	@RequestMapping("/TMS/naverCallback")
	public String naverCallback() {
		return "login/naverCallback";
	}
	
	@RequestMapping("/TMS/api_signUp")
	public String api_signUP(UsersVO vo, HttpSession session) {
		return "/login/api_signUp";
	}
	
	@PostMapping("/TMS/signUp_api")
	public String signUp_api(UsersVO vo, HttpSession session) {
		UsersVO sessionUser = (UsersVO) session.getAttribute("usersVO");
		sessionUser.setId(vo.getId());
		sessionUser.setPhone(vo.getPhone());
		sessionUser.setAddrDetail(vo.getAddrDetail());
		sessionUser.setZipNo(vo.getZipNo());
		sessionUser.setRoadAddrPart1(vo.getRoadAddrPart1());
		sessionUser.setType(vo.getType());
		System.out.println("usersVO: "+ sessionUser);
		service.insertApi(sessionUser);
		session.removeAttribute("usersVO");
		session.setAttribute("usersVO", sessionUser);
		
		return "redirect: /joinOk";
	}
	
	@GetMapping("joinOk")
	public String joinOk() {
		return "main/joinOk";
	}
	
	@PostMapping("/TMS/naverAjax")
	public @ResponseBody String naverAjax(UsersVO vo,HttpSession session) {
		
		
		System.out.println("vo: "+ vo);
		UsersVO result = service.chkApi(vo.getApi_id());
		
		if (result == null) {
			System.out.println("널로 들어옴");
			session.setAttribute("usersVO", vo);
			return "/TMS/api_signUp";
		} else {
			System.out.println("낫널로 들어옴");
			result.setType(vo.getType());
			session.setAttribute("usersVO", result);
			return "/TMS";
		}
		
	}
	
	@RequestMapping("/ajaxTest")
	public @ResponseBody UsersVO ajaxTest(UsersVO vo, HttpSession session) {
		System.out.println("되냐?");
		System.out.println("vo: "+ vo);
		UsersVO result = service.chkApi(vo.getApi_id());
		
		if (result == null) {
			System.out.println("널로 들어옴");
			session.setAttribute("usersVO", vo);
			return vo;
		} else {
			System.out.println("낫널로 들어옴");
			session.setAttribute("usersVO", result);
			return result;
		}
	}
	@RequestMapping("/idChk_api")
	public @ResponseBody String idChk_api(UsersVO vo) {
		
		if (service.chkId(vo) == null) {
			return "ok";
		} else {
			return "no";
		}
		
	}
	
	@RequestMapping("/juso")
	public String juso() {
		return "login/juso";
	}
	
	@GetMapping("sessionDel")
	public String sessionDel(HttpSession session) {
		System.out.println("로그아웃 들어옴");
		session.invalidate();
		return "main/main";
	}
	
	@GetMapping("googleLogin")
	public String googleLogin() {
		return "login/googleLogin";
	}
	
	@RequestMapping("/TMS/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect: /TMS";
	}
	
	@RequestMapping("/test")
	public String goTest() {
		return "main/test";
	}
	
	@PostMapping("/TMS/login")
	public String login(UsersVO vo, HttpSession session, Model model) {
			System.out.println("controller 로그인 테스트");
			
			UsersVO user = service.login(vo);
			if (user == null) {
				System.out.println("유저 로그인 실패!");
				model.addAttribute("loginResult", "fail");
				return "main/main";
			} else if (user.getRank() == 1) {
				session.setAttribute("usersVO", user);
				System.out.println("관리자 확인 : " + user);
				model.addAttribute("loginResult", "admin");
			} else if (user.getRank() != 1) {
				//유저로그인
				session.setAttribute("usersVO", user);
				System.out.println("user 확인 : " + user);
				model.addAttribute("loginResult", "user");
			}
			
			return "redirect: /TMS";
		}
}
