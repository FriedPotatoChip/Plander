package com.bit.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
	@RequestMapping("/proImgTest")
	public String proImgTest() {
		return "main/proImgTest";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/profileUpload", method = RequestMethod.POST)
	public String uploadAjax(@RequestBody HashMap<String, Object> map) throws Exception {
		System.out.println("File: "+ map);
		
		return "";
	}
	
	
	
	
	
}
