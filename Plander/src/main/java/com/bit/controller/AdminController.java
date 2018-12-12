package com.bit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Plander/admin")
public class AdminController {
	
	@RequestMapping("")
	public String adminPage() {
		
		return "adminPage/admin";
	}
	
	
	
}
