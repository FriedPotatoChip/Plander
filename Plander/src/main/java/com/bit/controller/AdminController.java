package com.bit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.domain.BookingCbVO;
import com.bit.domain.Paging;
import com.bit.domain.UsersVO;
import com.bit.service.adminService;
import com.bit.utils.PagingVO;

@Controller
@RequestMapping("/TMS/admin")
public class AdminController {

	@Autowired
	private adminService service;

	// 페이징 처리
	Paging p = new Paging();

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
		/*model.addAttribute("dateTime", service.DateTime());
		List<DateTimeVO> datetime = service.DateTime();
		System.out.println(datetime.toString());*/
		return "adminPage/Chart";
	}
}
