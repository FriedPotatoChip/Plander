package com.bit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.domain.BookingCbVO;
import com.bit.domain.DateTimeVO;
import com.bit.domain.Paging;
import com.bit.domain.UsersVO;
import com.bit.service.adminService;

@Controller
@RequestMapping("/TMS/admin")
public class AdminController {

	@Autowired
	private adminService service;

	// 페이징 처리
	Paging p = new Paging();

	@RequestMapping("")
	public String adminPage(UsersVO vo, Model model, HttpServletRequest request) {

		// 1. 전체 게시물의 수를 구함.
		p.setTotalRecord(service.getTotal());
		p.setTotalPage();

		System.out.println("전체 건수 : " + p.getTotalRecord());
		System.out.println("전체 페이지 갯수 : " + p.getTotalPage());

		// 2. 현재 페이지 구하기(default : 1)
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		// 3. 현재페이지의 시작번호와 끝 번호 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		System.out.println("현재페이지(nowPage) : " + p.getNowPage());
		System.out.println("시작번호(begin) : " + p.getBegin());
		System.out.println("끝번호(end) : " + p.getEnd());

		// 4. 블록의 시작페이지, 끝 페이지 번호 구하기
		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

		// 4-1 끝페이지(endPage)가 총페이지(totalPage)보다 크면
		// endPage = totalPage 설정
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		System.out.println("변경후 끝페이지(endPage) : " + p.getEndPage());

		model.addAttribute("pvo", p);
		model.addAttribute("cPage", cPage);
		model.addAttribute("user", service.getUserList(vo));
		return "adminPage/admin";
	}

	@RequestMapping("/Cabinet")
	public String CabitnetPage(BookingCbVO bcvo, Model model) {
		model.addAttribute("cabinet", service.bookingCabinet(bcvo));
		model.addAttribute("count", service.bookingCabinet_count(bcvo));
		return "adminPage/Cabinet";
	}
	
	@RequestMapping("/Cabinet/test")
	public @ResponseBody List<BookingCbVO> test(BookingCbVO bcvo) {
		System.out.println("bcvo : " + bcvo);
		return service.bookingCabinet(bcvo);
	}
	
	@RequestMapping("/Chart")
	public String ChartPage(Model model) {
		model.addAttribute("dateTime", service.DateTime());
		List<DateTimeVO> datetime = service.DateTime();
		System.out.println(datetime.toString());
		return "adminPage/Chart";
	}
}
