package com.bit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.service.RecruitService;

@Controller
@RequestMapping("/TMS")
public class MainController {

	@Autowired
	private RecruitService service;

	@GetMapping("")
	public String main() {
		return "main/submain";
	}

}
