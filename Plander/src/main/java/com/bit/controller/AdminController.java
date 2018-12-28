package com.bit.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.domain.BookingCbVO;
import com.bit.domain.BookingVO;
import com.bit.domain.UsersVO;
import com.bit.service.BookService;
import com.bit.service.adminService;
import com.bit.utils.PagingVO;

@Controller
@RequestMapping("/TMS/admin")
public class AdminController {
	
	@Autowired
	private BookService bookservice;
	
	@Autowired
	private adminService service;


	@RequestMapping("")
	public String adminPage(UsersVO vo, Model model, PagingVO page) {
		
		page = new PagingVO(page.getNowPage(), page.getCntPerPage(), service.getTotal());
		
		page.CalcPage(page.getNowPage(), page.getCntPerPage());
		
		model.addAttribute("page", page);
		model.addAttribute("user", service.getUserList(page));
		return "adminPage/admin";
	}

	
	@RequestMapping("/searchList")
	public String searchList(@RequestParam("keyword")String keyword, @RequestParam("target")String target, UsersVO vo, PagingVO page, Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("target", target);
		
		page  = new PagingVO(page.getNowPage(), page.getCntPage(), service.getSearchTotal(map));
		page.CalcPage(page.getNowPage(), page.getCntPerPage());
		
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		
		model.addAttribute("page", page);
		model.addAttribute("user", service.getSearchList(map));
		return "adminPage/admin";
	}
	
	@RequestMapping("/delete")
	public String userDelete(@RequestParam int u_idx) {
		System.out.println("u_idx : " + u_idx);
		service.userDelete(u_idx);
		return "redirect: /TMS/admin";
	}
	
	@RequestMapping("/Cabinet")
	public String CabitnetPage(BookingCbVO bcvo, Model model) {
		model.addAttribute("cabinet", service.bookingCabinet(bcvo));
		model.addAttribute("count", service.bookingCabinet_count(bcvo));
		return "adminPage/Cabinet";
	}
	
	
	@RequestMapping("/Chart")
	public String ChartPage(Model model) {
		
		return "adminPage/Chart";
	}
	
	@RequestMapping("/Seats")
	public String SeatsPage(@RequestParam("sct_idx")int sct_idx , Model model, BookingVO bvo) {
		return "adminPage/Seats";
	}
}
