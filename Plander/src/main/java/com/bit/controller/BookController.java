 package com.bit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.domain.SeatsVO;
import com.bit.service.BookService;

@Controller
@RequestMapping("/TMS/book")
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	@RequestMapping("")
	public String book() {
		System.out.println("예약 페이지");
		return "book/book";
	}
	
	@RequestMapping("/booking")
	public String booking(SeatsVO svo, Model model) {
		System.out.println("/booking");
		System.out.println("1.지점번호 : " + svo.getBr_idx());
		System.out.println("2.날짜 선택, 방 선택");
		
		model.addAttribute("BRidx", svo.getBr_idx());
		return "book/booking";
	}
	
	//좌석 조회
	@RequestMapping("/selectSeat")
	public String seat(SeatsVO svo, Model model) {
		System.out.println("/selectSeat");
		System.out.println("날짜 : " + svo.getDate());
		System.out.println("지점번호 : " + svo.getBr_idx() + ", 방 번호 : " + svo.getSct_idx());
		
		//남은 좌석 수 확인
//		int result = bookService.seatCnt(svo.getBr_idx(), svo.getSct_idx());
//		System.out.println("result : " + result);
		
		model.addAttribute("BRidx", svo.getBr_idx());
		model.addAttribute("SCTidx", svo.getSct_idx());
		
		return "book/bookingSeat";
	}
	
	
	
}
