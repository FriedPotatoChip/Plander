 package com.bit.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bit.domain.BookingVO;
import com.bit.domain.SeatsVO;
import com.bit.domain.UsersVO;
import com.bit.service.BookService;

@Controller
@SessionAttributes("usersVO")
@RequestMapping("/TMS/book")
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	@RequestMapping("")
	public String book(Model model, HttpSession session) {
		System.out.println("예약 페이지");
		model.addAttribute("uservo", session.getAttribute("usersVO"));
		
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
	public String oneseat(BookingVO bvo, Model model, UsersVO uservo) {
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
		int bookseat = bookService.bookoneCnt(bvo);
		System.out.println("예약된 좌석 수 : " + bookseat);
		//남은 좌석 수
		int leaveseat = (allseat - bookseat);
		System.out.println("남은 좌석 수 : " + leaveseat);
		
		List<BookingVO> booklist = bookService.bookone(bvo);
		bvo.setId(uservo.getId());
		System.out.println("booklist : " + booklist);
		System.out.println("bvo : " + bvo);
		
		model.addAttribute("booklist", booklist);
		model.addAttribute("bvo", bvo);
		
		return "book/booking_floor_2";
		
	}
	
	//좌석 조회(랩실)
	@RequestMapping("/roomseat")
	public String roomseat(BookingVO bvo, Model model, UsersVO uservo) {
		System.out.println("/roomseat");
		
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
		Date date = new Date();
		String today = format.format(date);
		bvo.setBk_regdate(today);
		
		System.out.println("예약날짜(regdate) : " + bvo.getBk_regdate());
		System.out.println("시작날짜 : " + bvo.getStart_time());
		System.out.println("끝 날짜 : " + bvo.getEnd_time());
		System.out.println("***** 지점번호 : " + bvo.getBr_idx());
		
		//전체 좌석 : 5
		//예약된 좌석
		int roomseat = bookService.bookroomCnt(bvo);
		int leaveroomseat = (5 - roomseat); //남은 좌석 수
		System.out.println("랩실 남은 좌석 수 : " + leaveroomseat);
		
		List<BookingVO> bookroomlist = bookService.bookroom(bvo);
		bvo.setId(uservo.getId());
		System.out.println("bookroomlist : " + bookroomlist);
		System.out.println("bvo : " + bvo);
		
		model.addAttribute("bookroomlist", bookroomlist);
		model.addAttribute("bvo", bvo);
		
		return "book/booking_floor_1";
	}
	
	
	//결제 페이지
	@RequestMapping("/pay")
	public String pay(BookingVO bvo, Model model, UsersVO uservo) {
		System.out.println("/pay");
		
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
		Date date = new Date();
		String today = format.format(date);
		bvo.setBk_regdate(today); //예약날짜
		bvo.setId(uservo.getId());
		
		
		//내가 선택한 좌석 정보 넘기기
		List<BookingVO> myseat = bookService.myseat(bvo);
		System.out.println("myseat : " + myseat);
		
		model.addAttribute("bvo", bvo);
		model.addAttribute("myseat", myseat);
		model.addAttribute("uservo", uservo);
		return "book/payment";
	}
	
	
	
	
	
	
	
	
	
	
	//선택 정보 조회
	@RequestMapping(value="/myseat", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody HashMap<String, Object> myseat(BookingVO bvo) {
		List<BookingVO> myseat = bookService.myseat(bvo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("myseat", myseat);
		
		System.out.println("myseat : " + myseat);
		
		return map;
	}
	
}
