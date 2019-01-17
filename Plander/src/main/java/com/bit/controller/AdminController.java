package com.bit.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.domain.BookingCbVO;
import com.bit.domain.BookingVO;
import com.bit.domain.RecvMsgVO;
import com.bit.domain.SendMsgVO;
import com.bit.domain.UsersVO;
import com.bit.service.BookService;
import com.bit.service.MyService;
import com.bit.service.adminService;
import com.bit.utils.PagingVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private BookService bookservice;

	@Autowired
	private adminService service;
	
	
	@RequestMapping("")
	public String adminPage(UsersVO vo, Model model, PagingVO page, HttpSession session) {
		session.setAttribute("user", vo);
		System.out.println("user: " + vo);
		
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
	
	// 페이징
	public Map<String, Object> paging(PagingVO page, UsersVO vo, int total) {

		page = new PagingVO(page.getNowPage(), total);
		page.CalcPage(page.getNowPage());

		Map<String, Object> map = new HashMap();
		map.put("id", vo.getId());
		map.put("page", page);

		System.out.println("페이징 테스트 map: " + map);
		return map;
	}
	
	@RequestMapping("Message")
	public String Message() {

		return "adminPage/Message";
	}
	
	@RequestMapping("recvMsg")
	public String recvMsg(PagingVO page, HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");
		System.out.println("vo admin : " + vo);
		
		// 페이징 처리
		int total = service.recvMsgCnt(vo);
		System.out.println("total: " + total);
		Map<String, Object> m = paging(page, vo, total);
		page = (PagingVO) m.get("page");
		model.addAttribute("page", page);

		Map<String, Object> map = new HashMap<>();
		map.put("id", vo.getId());
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		System.out.println("id: " + vo.getId() + ", start: " + page.getStart() + ", end: " + page.getEnd());
		List<RecvMsgVO> list = service.recvMsg(map);
		System.out.println("list: " + list);
		model.addAttribute("list", list);
		
		return "adminPage/recvmsg";
	}
	
	@RequestMapping("sendMsg")
	public String sendMsg(PagingVO page, HttpSession session, Model model) {
		UsersVO vo = (UsersVO) session.getAttribute("user");
		
		// 페이징 처리
		int total = service.sendMsgCnt(vo);
		System.out.println("total: " + total);
		Map<String, Object> m = paging(page, vo, total);
		page = (PagingVO) m.get("page");
		model.addAttribute("page", page);

		Map<String, Object> map = new HashMap<>();
		map.put("id", vo.getId());
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		System.out.println("id: " + vo.getId() + ", start: " + page.getStart() + ", end: " + page.getEnd());
		List<SendMsgVO> list = service.sendMsg(map);
		System.out.println("list: " + list);
		model.addAttribute("list", list);
		
		return "adminPage/sendmsg";
	}

	@RequestMapping("/delete")
	public String userDelete(@RequestParam int u_idx) {
		System.out.println("u_idx : " + u_idx);
		service.userDelete(u_idx);
		return "redirect: /admin";
	}

	@RequestMapping("/Cabinet")
	public String CabitnetPage(@RequestParam(value="br_idx", defaultValue="1") int br_idx, BookingCbVO bcvo, Model model) {
		bcvo.setBr_idx(br_idx);
		System.out.println("bcvo : " + bcvo);
		List<BookingCbVO> list = service.bookingCabinet(bcvo);
		System.out.println("list: "+ list);
		model.addAttribute("cabinet", list);
		model.addAttribute("count", service.bookingCabinet_count(bcvo));
		model.addAttribute("br_idx", br_idx);
		return "adminPage/Cabinet";
	}

	@RequestMapping("/Chart")
	public String ChartPage(Model model) {
		model.addAttribute("chartA", service.chartA());
		model.addAttribute("chartB", service.chartB());
		model.addAttribute("chartC", service.chartC());
		model.addAttribute("monday", service.monday());
		model.addAttribute("tuesday", service.Tuesday());
		model.addAttribute("wednesday", service.Wednesday());
		model.addAttribute("thursday", service.Thursday());
		model.addAttribute("friday", service.Friday());
		model.addAttribute("saturday", service.Saturday());
		model.addAttribute("sunday", service.Sunday());
		return "adminPage/Chart";
	}
	
	@RequestMapping("/update")
	public String changeSeats(@RequestParam(value="br_idx", defaultValue="1") int br_idx, @RequestParam int s_col, @RequestParam int bk_idx,  @RequestParam(value="roomnum", defaultValue="1") int roomnum, BookingVO bvo) throws ParseException {
		System.out.println("roomnum1 : " + roomnum);
		Map<Object, Object> map1 = new HashMap<>();
		map1.put("s_col", s_col);
		map1.put("br_idx", br_idx);
		
		int sidx = service.s_idx(map1);
		
		System.out.println("map1 : " + sidx);
		
		Map<String, Object> map = new HashMap<>();
		map.put("bk_idx", bk_idx);
		map.put("s_idx", sidx);

		service.changeSeats(map);
		
		return "redirect: /admin/Seats?roomnum="+ roomnum;
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
		model.addAttribute("br_idx", br_idx);
		return "adminPage/Seats";
	}
	
	@RequestMapping("/LabSeats")
	public String LabSeatsPage(@RequestParam(value="roomnum", defaultValue="2") int roomnum, @RequestParam(value="br_idx", defaultValue="1") int br_idx, Model model, 
			BookingVO bvo) {
		System.out.println("br_idx : " + br_idx);
		System.out.println("roomnum : " + roomnum);
		System.out.println("bvo : " + bvo);
		bvo.setBr_idx(br_idx);
		bvo.setRoomnum(roomnum);
		model.addAttribute("br_idx", br_idx);
		model.addAttribute("BookingSeats", service.BookingSeats(bvo));
		return "adminPage/LabSeats";
	}
	
	@RequestMapping("/Receipt")
	public String Receipt(Model model, BookingVO bvo, PagingVO page) {
		page = new PagingVO(page.getNowPage(), page.getCntPerPage(), service.receiptTotal());

		page.CalcPage(page.getNowPage(), page.getCntPerPage());
		
		model.addAttribute("page", page);
		model.addAttribute("receipt", service.receiptList(page));
		model.addAttribute("count", service.receiptTotal());
		model.addAttribute("sum", service.receiptSum());
		return "adminPage/receipt";
	}
	
	@RequestMapping("/ListSearch")
	public String ListSearch(@RequestParam("keyword") String keyword, @RequestParam("target") String target,
			PagingVO page, Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("target", target);

		page = new PagingVO(page.getNowPage(), page.getCntPage(), service.getTotalSearch(map));
		page.CalcPage(page.getNowPage(), page.getCntPerPage());

		map.put("start", page.getStart());
		map.put("end", page.getEnd());

		model.addAttribute("page", page);
		model.addAttribute("receipt", service.getListSearch(map));
		return "adminPage/receipt";
	}
}
