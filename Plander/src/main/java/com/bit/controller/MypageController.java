package com.bit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.domain.UserVO;
import com.bit.service.MyService;

@Controller
@RequestMapping("/Plander/mypage")
public class MypageController {
	
	@Autowired
	private MyService service;
	
	
	@RequestMapping("")
	public String mypage(int u_idx, Model model) {
		model.addAttribute("plannerList", service.getPlannerList(u_idx));
		model.addAttribute("bookmarkList", service.getBookmarkList(u_idx));
		return "myPage/mypage";
	}
	
	@RequestMapping("/plannerOne")
	public String plannerOne(@ModelAttribute("p_idx") int p_idx, Model model) {
		System.out.println("p_idx: " + p_idx);
		model.addAttribute("plannerOne", service.getPlannerOne(p_idx));
		return "myPage/plannerDetail";
	}
	
	@RequestMapping("/bookmarkOne")
	public String bookmarkOne(@ModelAttribute("p_idx") int p_idx, Model model) {
		System.out.println("p_idx: " + p_idx);
		model.addAttribute("bookmarkOne", service.getBookmarkOne(p_idx));
		return "myPage/bookmarkDetail";
	}

	@RequestMapping("/update")
	public String updateUser(UserVO vo) {
		System.out.println("vo" + vo);
		int result = service.updateUser(vo);
		System.out.println("처리건수: " + result);
		return "myPage/mypage";
	}
	
	
	
	
	
}
