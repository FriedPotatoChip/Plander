package com.bit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.domain.CategoryVO;
import com.bit.domain.Category_dVO;
import com.bit.service.ViewService;

@Controller
@RequestMapping("/Plander/view")
public class ViewController {
	
	@Autowired
	private ViewService service;
	
	@RequestMapping("")
	public String main(CategoryVO cvo, Model model, Category_dVO cdvo) {
		System.out.println("sadasd");
		model.addAttribute("category", service.getListCategory(cvo));
		model.addAttribute("category_d", service.getListCategory_d(cdvo));
		return "planderList";
	}
	
}
