package com.bit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.domain.PlannerVO;

@Controller
@RequestMapping("/Plander/write")
public class WriteController {

	@RequestMapping("/test")
	public String test() {
		return "write/planderWrite";
	}
	@RequestMapping("test2")
	public String test2() {
		return "write/planderWrite";
	}
	
//	@RequestMapping("/")
//	public String writeMain() {
//		return "write/planderWrite";
//	}
	@GetMapping("")
	public String writeMain() {
		return "write/planderWrite";
	}
	
	@PostMapping("")
	public String writeMain(@ModelAttribute("PlannerVO")PlannerVO vo) {
		System.out.println("디테일 옴");
		return "write/planderWrite_detail";
	}
	
}
