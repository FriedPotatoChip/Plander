package com.bit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bit.domain.PriceVO;
import com.bit.service.CommonService;

@RestController
public class AjaxController {
	
	@Autowired
	private CommonService service;
	
	@RequestMapping("/getPrice")
	public List<PriceVO> getPrice() {
		return service.getPriceList();
	}
	
	
}
