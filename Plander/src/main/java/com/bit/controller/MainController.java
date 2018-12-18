package com.bit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.service.BoardService;

@Controller
@RequestMapping("/TMS")
public class MainController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping("")
	public String main() {
		return "main/main";
	}
	
	@GetMapping("/recruit")
	public String recruit(Model model) {
		model.addAttribute("boardList", service.getList());
		return "board/recruit";
	}
	
	
	
	
}
