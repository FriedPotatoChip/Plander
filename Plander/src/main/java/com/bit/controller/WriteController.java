package com.bit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.domain.CategoryVO;
import com.bit.domain.PlannerVO;
import com.bit.domain.Planner_dVO;
import com.bit.service.ViewService;
import com.bit.service.WriteService;

@Controller
@RequestMapping("/Plander/write")
public class WriteController {

	@Autowired
	private WriteService service;
	
	@Autowired
	private ViewService viewService;
	
	@GetMapping("")
	public String writeMain(CategoryVO cvo, Model model) {
		List<CategoryVO> ctList = viewService.getListCategory(cvo);
		model.addAttribute("ctList", ctList);
		
		model.addAttribute("planList", service.getListAll());
		return "write/gcal";
	}
	
	@PostMapping("")
	public String writePlan(PlannerVO vo) {
		System.out.println(vo);
		service.register(vo);
		return "redirect: /Plander";
	}
	
	@PostMapping("/detail")
	public String writeDetail(PlannerVO vo, Model model) {
		model.addAttribute("PlannerVO", vo);
		return "write/planderWrite_detail";
	}
	@GetMapping("/detail")
	public String writeDetail() {
		
		return "write/planderWrite_detail";
	}
	
	@RequestMapping("test2")
	public String test2() {
		return "write/test2";
	}
	@RequestMapping("test3")
	public String test3() {
		return "write/gcal3";
	}
	@RequestMapping("gcal2")
	public String gcal2() {
		return "write/gcal2";
	}
	
//	@GetMapping("")
//	public String writeMain() {
//		return "write/planderWrite";
//	}
//	
//	@PostMapping("")
//	public String writeMain(@ModelAttribute("PlannerVO")PlannerVO vo, Model model) {
//		
//		// vo DB(Planner)테이블에 인서트
////		boolean chk = service.register(vo);
////		System.out.println("인서트 결과: "+ chk);
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		model.addAttribute("startD", format.format(vo.getP_start_date()));
//		model.addAttribute("endD", format.format(vo.getP_end_date()));
//		
//		return "write/planderWrite_detail";
//	}
	
	
}
