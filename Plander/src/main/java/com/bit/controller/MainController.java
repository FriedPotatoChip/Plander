package com.bit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/TMS")
public class MainController {
	
	
	
	@GetMapping("naverTest")
	public String test() {
		return "main/naverLoginTest";
	}
	
	@PostMapping("naver")
	public String naverTest() {
		return "main/naverTest";
	}
	
	@RequestMapping("test")
	public String asdf() {
		return "main/test";
	}
	
}
