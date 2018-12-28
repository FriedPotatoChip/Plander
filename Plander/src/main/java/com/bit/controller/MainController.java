package com.bit.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bit.utils.UploadFileUtils;

@Controller
@RequestMapping("/TMS")
public class MainController {
	
	
	@GetMapping("")
	public String main() {
		return "main/submain";
	}
	
	@GetMapping("/sub")
	public String sub() {
		return "main/submain";
	}
	
	
	@RequestMapping("/proImgTest")
	public String proImgTest() {
		return "main/proImgTest";
	}
	

	
	
	
	
	
}
