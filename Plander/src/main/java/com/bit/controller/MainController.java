package com.bit.controller;

import java.util.HashMap;
import java.util.Map;
 
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bit.domain.UsersVO;
import com.bit.service.MyService;
import com.bit.utils.UploadFileUtils;

@Controller
@RequestMapping("/TMS")
public class MainController {
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	private MyService myService;
	
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
	
	// 프로필 사진 업로드
	@RequestMapping(value = "/profileUpload", method = RequestMethod.POST)
	public String profileUpload(@RequestParam("file")MultipartFile file, @RequestParam("x")String x, @RequestParam("y")String y, @RequestParam("w")String w, @RequestParam("h")String h, UsersVO vo, HttpSession session) throws Exception{
		System.out.println("file: "+ file);
		System.out.println("x: "+ x+ ", y: "+ y+ ", w: "+ w+ ", h: "+ h);
		Map<String, Integer> map = new HashMap<>();
		int xx = (int) Math.round(Double.parseDouble(x));
		int yy = (int) Math.round(Double.parseDouble(y));
		int ww = (int) Math.round(Double.parseDouble(w));
		int hh = (int) Math.round(Double.parseDouble(h));
		map.put("x", xx);
		map.put("y", yy);
		map.put("w", ww);
		map.put("h", hh);
		ResponseEntity<String> img_path = new ResponseEntity<>(
				UploadFileUtils.uploadThum(uploadPath, file.getOriginalFilename(), file.getBytes(), map),
				HttpStatus.CREATED);
		String user_imgPath = (String) img_path.getBody();
		System.out.println("오리지널: "+ file.getOriginalFilename());
		System.out.println("썸네일 경로: "+ user_imgPath);
		String imgPath = "/resources/upload" + user_imgPath;
		vo.setUser_profileImagePath(imgPath);
		myService.updateProfileImg(vo);
		
		// 세션 정보 수정
		UsersVO user = (UsersVO) session.getAttribute("usersVO");
		user.setUser_profileImagePath(vo.getUser_profileImagePath());
		session.setAttribute("usersVO", user);
		return "redirect: /TMS/my";
	}
	
	
	
	
	
}
