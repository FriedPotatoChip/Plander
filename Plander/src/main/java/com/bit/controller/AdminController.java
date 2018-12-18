package com.bit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.domain.UsersVO;
import com.bit.service.adminService;

@Controller
@RequestMapping("/TMS/admin")
public class AdminController {
	
	@Autowired
	private adminService service;
	
	@RequestMapping("")
	public String adminPage(UsersVO vo, Model model) {
		model.addAttribute("user", service.getUserList(vo));
		return "adminPage/admin";
	}
	
}
