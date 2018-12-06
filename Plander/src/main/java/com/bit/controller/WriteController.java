package com.bit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Plander/write/*")
public class WriteController {

	@RequestMapping("test")
	public String test() {
		return "home";
	}
	
	
	
	
	
	
}
