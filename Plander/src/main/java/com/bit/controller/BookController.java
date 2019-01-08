package com.bit.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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

	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	Date date = new Date();
	String today = format.format(date);

	// 좌석조회
	@RequestMapping("/selectSeat")
	public String selectSeat(BookingVO bvo, Model model, UsersVO uservo) {
		System.out.println("/selectSeat ===============================================");
		System.out.println("2.날짜 선택, 방 선택");

		bvo.setBk_regdate(today);
		System.out.println("예약날짜(regdate) : " + bvo.getBk_regdate());
		System.out.println("시작날짜 : " + bvo.getStart_time() + ", 끝 날짜 : " + bvo.getEnd_time());
		System.out.println(
				"지점번호 : " + bvo.getBr_idx() + ", 방 번호 : " + bvo.getRoomnum() + ", 정기권 확인 : " + bvo.getTime_idx());

		bvo.setId(uservo.getId());
		boolean cab = cab(bvo.getCabinet());
		System.out.println("사물함 값 확인 : " + cab);
		System.out.println("3.좌석조회");

		if (bvo.getRoomnum() == 1) {
			// 좌석조회 개인실
			int allseat = bookService.seatCnt(bvo.getBr_idx(), bvo.getRoomnum()); // 전체 좌석
			int bookseat = bookService.bookoneCnt(bvo); // 예약 좌석
			int leaveseat = (allseat - bookseat); // 남은 좌석 수
			System.out.println("전체 좌석 수 : " + allseat + ", 예약된 좌석 수 : " + bookseat + ", 남은 좌석 수 : " + leaveseat);
			List<BookingVO> booklist = bookService.bookone(bvo);

			System.out.println("bvo : " + bvo);

			model.addAttribute("booklist", booklist);
			model.addAttribute("bvo", bvo);
			return "book/booking_floor_2";

		} else if (bvo.getRoomnum() == 2) {
			// 좌석조회 랩실
			// 전체 좌석 : 5
			// 예약된 좌석
			int roomseat = bookService.bookroomCnt(bvo);
			int leaveroomseat = (5 - roomseat); // 남은 좌석 수
			System.out.println("랩실 남은 좌석 수 : " + leaveroomseat);
			List<BookingVO> bookroomlist = bookService.bookroom(bvo);

			System.out.println("bvo : " + bvo);

			model.addAttribute("bookroomlist", bookroomlist);
			model.addAttribute("bvo", bvo);
			return "book/booking_floor_1";

		} else {
			return "book/booking";
		}

	}
	
	// 사물함
	public boolean cab(int cab) {
		if (cab == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	//s_idx
	public int[] idx(SeatsVO svo) {
		if (svo.getS_col_2()==0) {
			//1명만 예약할 때
			SeatsVO chk = bookService.seatnum(svo.getS_col(), svo.getBr_idx());
			int[] idx = new int[1];
			idx[0] = chk.getS_idx();
			return idx;
		} else {
			//2명예약 그냥 한명만 예약하자.......1인1좌석..티켓팅도1인1좌석.....
			SeatsVO chk = bookService.seatnum(svo.getS_col(), svo.getBr_idx());
			SeatsVO chk2p = bookService.some_seatnum(svo.getS_col_2(), svo.getBr_idx());
			
			int[] idx = new int[2];
			idx[0] = chk.getS_idx();
			idx[1] = chk2p.getS_idx();
			
			return idx;
		}
	}

	// 결제 페이지
	@RequestMapping("/pay")
	public String pay(BookingVO bvo, BookingCbVO cb_bvo, UsersVO uservo, SeatsVO svo, CabinetVO cvo,
			Model model, HttpServletRequest request) {
		System.out.println("/pay ======================================================");
		bvo.setBk_regdate(today); // 예약날짜
		bvo.setId(uservo.getId());
		
		int[] idx = idx(svo); //여기 오류뜸 수정 
		System.out.println("idx.length 길이 : " + idx.length);
		System.out.println("idx : " + idx);
		
		String test = request.getParameter("test");
		System.out.println("test: " + test);
		
		System.out.println("svo : " + svo);
		System.out.println("bvo : " + bvo);
		
		boolean cab = cab(bvo.getCabinet());
		System.out.println("사물함 사용여부 확인 : " + bvo.getCabinet() + ", t/f : " + cab);
		if (cab == true) {
			// 사물함 사용하면
			// 예약안된 사물함 리스트를 뽑아서 차례대로 cb_idx에 값 넣기
			List<CabinetVO> notbookCb = bookService.not_bookCb(cvo);
			System.out.println("예약안된사물함 확인 : " + notbookCb);
			
			if (idx.length==1) {
				//1명예약
				int chk = idx[0];
				System.out.println("chk : " + chk );
				bvo.setS_idx(chk);
				svo.setS_idx(chk);
				
				cb_bvo.setCb_idx(notbookCb.get(0).getCb_idx());
			} else {
				//2명예약
				int chk = idx[0]; //s_idx
				int chk1 = idx[1];
				System.out.println("chk : " + chk + ", chk1 : " + chk1);
				
				bvo.setS_idx(chk);
				bvo.setS_idx_2(chk1);
				svo.setS_idx(chk);
				svo.setS_idx_2(chk1);
				
				cb_bvo.setCb_idx(notbookCb.get(0).getCb_idx());
				cb_bvo.setCb_idx_2(notbookCb.get(1).getCb_idx());
			}
			
			cb_bvo.setBr_idx(bvo.getBr_idx());
			System.out.println("cb_idx 확인 : " + cb_bvo.getCb_idx() + ", cb_idx_2 : " + cb_bvo.getCb_idx_2());
			model.addAttribute("cb", cb_bvo);
		}

		String chkLen = request.getParameter("chkLen");
		System.out.println("chkLen: " + chkLen);

		model.addAttribute("bvo", bvo);
		model.addAttribute("uservo", uservo);
		model.addAttribute("svo", svo);
		model.addAttribute("test", test);
		model.addAttribute("chkLen", chkLen);
		return "book/payment";
	}

	// 예약완료
	@RequestMapping("/payok")
	public String bookOk(BookingVO bvo, BookingCbVO cb_bvo, UsersVO uservo, SeatsVO svo,
			Model model, HttpServletRequest request) {
		System.out.println("/payok ====================================================");

		bvo.setBk_regdate(today); // 예약날짜
		bvo.setId(uservo.getId());
		System.out.println("bvo : " + bvo);

		String test = request.getParameter("test");
		String chkLen = request.getParameter("chkLen");
		String chkCab = request.getParameter("cab");
		
		System.out.println("test: " + test);
		System.out.println("chkLen: " + chkLen);
		System.out.println("chkCab: " + chkCab);

		boolean cab = cab(cb_bvo.getCabinet());
		System.out.println("사물함 사용여부 확인 : " + cb_bvo.getCabinet() + ", t/f : " + cab);
		
		//2명예약 
		if (bvo.getS_col_2() !=0) {
			
			//사물함 사용 할 때
			if (cab == true) {
				cb_bvo.setCkb_regdate(today);
				cb_bvo.setId(uservo.getId());
				cb_bvo.setStart_date(bvo.getStart_time());
				cb_bvo.setEnd_date(bvo.getEnd_time());
				System.out.println("cb_bvo : " + cb_bvo);
				
				int booked = bookService.bookOk(bvo); //사람예약
				bvo.setS_idx(bvo.getS_idx_2());
				int booked2 = bookService.bookOk(bvo); //사람예약2
				
				int bookCb = bookService.bookCabinet(cb_bvo); //사물함예약
				cb_bvo.setCb_idx(cb_bvo.getCb_idx_2());
				int bookCb2 = bookService.bookCabinet(cb_bvo); //사물함예약2
				
				System.out.println(cb_bvo.getCb_idx() + ", " + cb_bvo.getCb_idx_2());
				System.out.println("예약완료 : " + uservo.getId() + ", " + booked + ", 2명: " + booked2
						+ ", 사물함 예약 : " + bookCb + ", 2명: " + bookCb2);
				model.addAttribute("cb", cb_bvo);
			} else {
				//사물함 사용 안할 때 
				int booked = bookService.bookOk(bvo); //사람예약
				bvo.setS_idx(bvo.getS_idx_2());
				int booked2 = bookService.bookOk(bvo); //사람예약2
				
				System.out.println("예약완료 : " + uservo.getId() + ", " + booked + ", 2명: " + booked2);
			}
			
			
		} else {
			//1명 예약
			//사물함 사용 할 때
			if (cab == true) {
				//사물함
				cb_bvo.setCkb_regdate(today);
				cb_bvo.setId(uservo.getId());
				cb_bvo.setStart_date(bvo.getStart_time());
				cb_bvo.setEnd_date(bvo.getEnd_time());
				System.out.println("cb_bvo : " + cb_bvo);
				//사물함 끝 
				
				int booked = bookService.bookOk(bvo); // 사람예약
				int bookCb = bookService.bookCabinet(cb_bvo); //사물함예약
				System.out.println("예약완료 : " + uservo.getId() + ", " + booked + ", 사물함 예약 : " + bookCb);
				model.addAttribute("cb", cb_bvo);
			} else {
				//사물함 사용 안할 때 
				int booked = bookService.bookOk(bvo); // 사람예약
				System.out.println("예약완료 : " + uservo.getId() + ", " + booked);
			}
		}
		
		
		model.addAttribute("bvo", bvo);
		model.addAttribute("uservo", uservo);
		model.addAttribute("test", test);
		model.addAttribute("chkLen", chkLen);
		model.addAttribute("cab", chkCab);

		return "book/payok";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
//	// 선택 정보 조회
//	@RequestMapping(value = "/myseat", method = { RequestMethod.GET, RequestMethod.POST })
//	public @ResponseBody HashMap<String, Object> myseat(BookingVO bvo) {
//		List<BookingVO> myseat = bookService.myseat(bvo);
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("myseat", myseat);
//
//		System.out.println("myseat : " + myseat);
//
//		return map;
//	}

}
