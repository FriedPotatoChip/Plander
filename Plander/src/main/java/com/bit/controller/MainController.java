package com.bit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/TMS")
public class MainController {
	
	
	@GetMapping("")
	public String main() {
		return "main/main";
	}
	
	@GetMapping("/sub")
	public String sub() {
		return "main/submain";
	}
	
	
	
	
	
	
	
	
	
	
	
}
