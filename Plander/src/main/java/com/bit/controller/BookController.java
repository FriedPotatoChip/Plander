 package com.bit.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		
		model.addAttribute("svo", svo);
		return "book/booking";
	}
	
	//좌석 조회(개인실)
	@RequestMapping("/oneseat")
	public String seat(BookingVO bvo, Model model) {
		System.out.println("/oneseat");
		
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
		Date date = new Date();
		String today = format.format(date);
		bvo.setBk_regdate(today);
		
		System.out.println("예약날짜(regdate) : " + bvo.getBk_regdate());
		System.out.println("시작날짜 : " + bvo.getStart_time());
		System.out.println("끝 날짜 : " + bvo.getEnd_time());
		System.out.println("***** 지점번호 : " + bvo.getBr_idx() + ", 방 번호 : " + bvo.getSct_idx());
		
		//전체 좌석 
		int allseat = bookService.seatCnt(bvo.getBr_idx(), bvo.getSct_idx());
		System.out.println("전체 좌석 수 : " + allseat);
		//예약 좌석
		int bookseat = bookService.bookSeatCnt(bvo);
		System.out.println("예약된 좌석 수 : " + bookseat);
		//남은 좌석 수
		int leaveseat = (allseat - bookseat);
		System.out.println("남은 좌석 수 : " + leaveseat);
		
		List<BookingVO> booklist = bookService.bookSeat(bvo);
		System.out.println("booklist : " + booklist);
		
		model.addAttribute("bvo", bvo);
		model.addAttribute("booklist", booklist);
		
		return "book/booking_floor_2";
		
	}
	
	//좌석 조회(랩실)
	@RequestMapping("/roomseat")
	public String roomseat(BookingVO bvo, Model model) {
		System.out.println("/oneseat");
		
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
		Date date = new Date();
		String today = format.format(date);
		bvo.setBk_regdate(today);
		
		System.out.println("예약날짜(regdate) : " + bvo.getBk_regdate());
		System.out.println("시작날짜 : " + bvo.getStart_time());
		System.out.println("끝 날짜 : " + bvo.getEnd_time());
		System.out.println("***** 지점번호 : " + bvo.getBr_idx());
		
		
		return "book/booking_floor_1";
	}
	
	//결제 페이지
	@RequestMapping("/pay")
	public String pay(BookingVO bvo) {
		
		return "book/payment";
	}
	
	
}
