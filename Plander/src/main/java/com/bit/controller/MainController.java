package com.bit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.domain.UserVO;
import com.bit.service.UserService;

@Controller
@RequestMapping("/Plander")
public class MainController {
	
	@Autowired
	private UserService service;
	
	@RequestMapping("")
	public void main(UserVO vo) {
		service.getUser(vo);
	}
	
	
}
