 package com.bit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/TMS/book")
public class BookController {
	
	@RequestMapping("")
	public String book() {
		System.out.println("예약 페이지");
		return "book/book";
	}
	
	@RequestMapping("/booking")
	public String booking() {
		System.out.println("예약하기");
		return "booking";
	}
	
	
}
