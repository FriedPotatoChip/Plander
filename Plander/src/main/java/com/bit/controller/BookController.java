 package com.bit.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bit.domain.BookingCbVO;
import com.bit.domain.BookingVO;
import com.bit.domain.CabinetVO;
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
		
		model.addAttribute("svo", svo);
		return "book/booking";
	}
	
	SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
	Date date = new Date();
	String today = format.format(date);
	
	//좌석조회
	@RequestMapping("/selectSeat")
	public String selectSeat(BookingVO bvo, Model model, UsersVO uservo) {
		System.out.println("/selectSeat");
		System.out.println("2.날짜 선택, 방 선택");
		
		bvo.setBk_regdate(today);
		System.out.println("예약날짜(regdate) : " + bvo.getBk_regdate());
		System.out.println("시작날짜 : " + bvo.getStart_time() + ", 끝 날짜 : " + bvo.getEnd_time());
		System.out.println("지점번호 : " + bvo.getBr_idx() + ", 방 번호 : " + bvo.getRoomnum()
				+ ", 정기권 확인 : " + bvo.getTime_idx());
		
		bvo.setId(uservo.getId());
		boolean cab = cab(bvo.getCabinet());
		System.out.println("사물함 값 확인 : " + cab);
		System.out.println("3.좌석조회");
		
		if (bvo.getRoomnum() == 1) {
			//좌석조회 개인실
			int allseat = bookService.seatCnt(bvo.getBr_idx(), bvo.getRoomnum()); //전체 좌석 
			int bookseat = bookService.bookoneCnt(bvo); //예약 좌석
			int leaveseat = (allseat - bookseat); //남은 좌석 수
			System.out.println("전체 좌석 수 : " + allseat + ", 예약된 좌석 수 : " + bookseat + ", 남은 좌석 수 : " + leaveseat);
			List<BookingVO> booklist = bookService.bookone(bvo);
			
			System.out.println("booklist : " + booklist);
			System.out.println("bvo : " + bvo);
			
			model.addAttribute("booklist", booklist);
			model.addAttribute("bvo", bvo);
			return "book/booking_floor_2";
			
		} else if (bvo.getRoomnum() == 2) {
			//좌석조회 랩실
			//전체 좌석 : 5
			//예약된 좌석
			int roomseat = bookService.bookroomCnt(bvo);
			int leaveroomseat = (5 - roomseat); //남은 좌석 수
			System.out.println("랩실 남은 좌석 수 : " + leaveroomseat);
			List<BookingVO> bookroomlist = bookService.bookroom(bvo);
			
			System.out.println("bookroomlist : " + bookroomlist);
			System.out.println("bvo : " + bvo);
			
			model.addAttribute("bookroomlist", bookroomlist);
			model.addAttribute("bvo", bvo);
			return "book/booking_floor_1";
			
		} else {
			return "book/booking";
		}
		
	}
	
	public int idxchk(SeatsVO svo) {
		SeatsVO svochk = bookService.seatnum(svo.getS_col(), svo.getBr_idx());
		int idx = svochk.getS_idx();
		System.out.println("svochk 확인 : " + svochk + ", idx 확인 : " + idx);
		return idx;
	}
	
	
	//사물함 
	public boolean cab(int cab) {
		if (cab==1) {
			return true;
		} else {
			return false;
		}
	}
	
	
	
	//결제 페이지
	@RequestMapping("/pay")
	public String pay(BookingVO bvo, BookingCbVO cb_bvo, Model model,
					UsersVO uservo, SeatsVO svo, HttpServletRequest request, CabinetVO cvo) {
		System.out.println("/pay");
		System.out.println(bvo);
		
		bvo.setBk_regdate(today); //예약날짜
		bvo.setId(uservo.getId());
		
		int idx = idxchk(svo);
		System.out.println("idx 확인 : " + idx);
		bvo.setS_idx(idx);
		svo.setS_idx(idx);
		
		String test = request.getParameter("test");
		System.out.println("test: " + test);
		
		boolean cab = cab(bvo.getCabinet());
		System.out.println("사물함 사용여부 확인 : " + bvo.getCabinet() + ", t/f : " + cab);
		if (cab==true) {
			//사물함 사용하면
			//예약안된 사물함 리스트를 뽑아서 차례대로 cb_idx에 값 넣기
			
			List<CabinetVO> notbookCb = bookService.not_bookCb(cvo);
			System.out.println("예약안된사물함 확인 : " + notbookCb);
			cb_bvo.setCb_idx(notbookCb.get(0).getCb_idx());
			cb_bvo.setBr_idx(bvo.getBr_idx());
			System.out.println("cb_idx 확인 : " + cb_bvo.getCb_idx());
			model.addAttribute("cb", cb_bvo);
		} 
		
		String chkLen = request.getParameter("chkLen");
		System.out.println("chkLen: " + chkLen);
		
		model.addAttribute("bvo", bvo);
		model.addAttribute("uservo", uservo);
		model.addAttribute("test", test);
		model.addAttribute("svo", svo);
		model.addAttribute("chkLen", chkLen);
		return "book/payment";
	}
	
	//예약완료
	@RequestMapping("/payok")
	public String bookOk(BookingVO bvo, BookingCbVO cb_bvo, Model model, UsersVO uservo) {
		System.out.println("/payok");
		
		bvo.setBk_regdate(today); //예약날짜
		bvo.setId(uservo.getId());
		System.out.println("bvo : " + bvo );
		
		boolean cab = cab(cb_bvo.getCabinet());
		System.out.println("사물함 사용여부 확인 : " + cb_bvo.getCabinet() + ", t/f : " + cab);
		
		if (cab==true) {
			cb_bvo.setCkb_regdate(today);
			cb_bvo.setId(uservo.getId());
			cb_bvo.setStart_date(bvo.getStart_time());
			cb_bvo.setEnd_date(bvo.getEnd_time());
			
			System.out.println("cb_bvo : " + cb_bvo);
			
			int booked = bookService.bookOk(bvo); //사람예약
			int bookCb = bookService.bookCabinet(cb_bvo); //사물함예약
			System.out.println("예약완료 : " + uservo.getId() + ", " + booked + ", 사물함 예약 : " + bookCb);
			model.addAttribute("cb", cb_bvo);
		} else {
			int booked = bookService.bookOk(bvo);
			System.out.println("예약완료 : " + uservo.getId() + ", " + booked);
		}
		
		model.addAttribute("bvo", bvo);
		model.addAttribute("uservo", uservo);
		return "book/payok";
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
