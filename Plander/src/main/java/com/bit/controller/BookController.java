 package com.bit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.domain.BookingVO;
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
		
		//전체 좌석 수 확인
		int allseat = bookService.seatCnt(svo.getBr_idx(), svo.getSct_idx());
		System.out.println("전체 좌석 수 : " + allseat);
		//예약된 좌석 수 확인
		int bookseat = bookService.bookSeatCnt(svo.getSct_idx());
		System.out.println("예약된 좌석 수 : " + bookseat);
		//남은 좌석 수
		int leaveseat = (allseat - bookseat);
		System.out.println("남은 좌석 수 : " + leaveseat);
		
		model.addAttribute("BRidx", svo.getBr_idx());
		model.addAttribute("SCTidx", svo.getSct_idx());
		model.addAttribute("date", svo.getDate());
		model.addAttribute("allseat", allseat);
		model.addAttribute("bookseat", bookseat);
		model.addAttribute("leaveseat", leaveseat);
		
		return "book/bookingSeat";
	}
	
	
	//예약된 좌석 확인
	@RequestMapping("/seatchk")
	public @ResponseBody int seatchk(BookingVO bvo) {
		int result = bookService.bookSeat();
		System.out.println("예약된 좌석 내역 : " + result);
		return result;
	}
	
	@RequestMapping("/pay")
	public String pay(BookingVO bvo) {
		int result = bookService.bookSeat();
		System.out.println("예약된 좌석 내역 : " + result);
		return "book/payment";
	}
	
	
	
}
