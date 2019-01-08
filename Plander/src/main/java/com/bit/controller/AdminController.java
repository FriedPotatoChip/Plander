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
	public String searchList(@RequestParam("keyword") String keyword, @RequestParam("target") String target, UsersVO vo,
			PagingVO page, Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("target", target);

		page = new PagingVO(page.getNowPage(), page.getCntPage(), service.getSearchTotal(map));
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
	
	@RequestMapping("/update")
	public String changeSeats(@RequestParam int s_idx, @RequestParam String id, @RequestParam(value="roomnum", defaultValue="1") int roomnum, @RequestParam(value="br_idx", defaultValue="1") int br_idx, BookingVO bvo) {
		System.out.println("roomnum1 : " + roomnum);
		System.out.println("br_idx : " + br_idx);
		System.out.println("s_idx : " + s_idx);
		System.out.println("id : " + id);
		
		Map<String, Object> map = new HashMap<>();
		map.put("br_idx", br_idx);
		map.put("s_idx", s_idx);
		map.put("id", id);
		System.out.println("--오니?");
		service.changeSeats(map);
		System.out.println("오니?--");
		return "redirect: /TMS/admin/Seats";
	}
	
	@RequestMapping("/Seats")
	public String SeatsPage(@RequestParam(value="roomnum", defaultValue="1") int roomnum, @RequestParam(value="br_idx", defaultValue="1") int br_idx, Model model,
			BookingVO bvo) {
		System.out.println("br_idx : " + br_idx);
		System.out.println("roomnum : " + roomnum);
		bvo.setBr_idx(br_idx);
		bvo.setRoomnum(roomnum);
		System.out.println("bvo : " + bvo);
		model.addAttribute("BookingSeats", service.BookingSeats(bvo));
		return "adminPage/Seats";
	}
	
	@RequestMapping("/LabSeats")
	public String LabSeatsPage(@RequestParam("roomnum") int roomnum, @RequestParam("br_idx") int br_idx, Model model,
			BookingVO bvo) {
		System.out.println("br_idx : " + br_idx);
		System.out.println("roomnum : " + roomnum);
		System.out.println("bvo : " + bvo);
		model.addAttribute("BookingSeats", service.BookingSeats(bvo));
		return "adminPage/LabSeats";
	}
}
