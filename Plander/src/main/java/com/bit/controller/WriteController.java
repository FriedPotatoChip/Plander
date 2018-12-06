package com.bit.controller;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.domain.PlannerVO;
import com.bit.domain.Planner_dVO;
import com.bit.service.WriteService;

@Controller
@RequestMapping("/Plander/write")
public class WriteController {

	@Autowired
	private WriteService service;
	
	@GetMapping("")
	public String writeMain() {
		return "write/planderWrite";
	}
	
	@PostMapping("")
	public String writeMain(@ModelAttribute("PlannerVO")PlannerVO vo, Model model) {
		
		// vo DB(Planner)테이블에 인서트
//		boolean chk = service.register(vo);
//		System.out.println("인서트 결과: "+ chk);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		model.addAttribute("startD", format.format(vo.getP_start_date()));
		model.addAttribute("endD", format.format(vo.getP_end_date()));
		
		return "write/planderWrite_detail";
	}
	
	@PostMapping("/detail")
	public String writeDetail(Planner_dVO vo) {
		System.out.println("디테일 VO: "+ vo);
		return "";
	}
	@GetMapping("/detail")
	public String writeDetail() {
		
		return "write/planderWrite_detail";
	}
}
