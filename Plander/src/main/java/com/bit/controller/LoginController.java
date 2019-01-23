package com.bit.controller;

import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.domain.UsersVO;
import com.bit.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService service;
	
	@Autowired
	private JavaMailSender mailSender;	
	
	@RequestMapping("/TMS/naverCallback")
	public String naverCallback() {
		return "login/naverCallback";
	}
	
	@RequestMapping("/signUpSuc")
	public String signUpSuc(@RequestParam(value="name", required=false)String name, Model model) {
		model.addAttribute("name", name);
		return "main/joinOk";
	}
	
	@PostMapping("/signUp")
	public String signUp(UsersVO vo, RedirectAttributes rttr) {
		boolean chkSignUp = service.signUp(vo);
		if (chkSignUp) {
			rttr.addAttribute("name", vo.getName());
			return "redirect: /signUpSuc";
		}else {
			return "redirect: /";
		}
	}
	
	@RequestMapping("/api_signUp")
	public String api_signUP(UsersVO vo, Model model) {
		System.out.println("api_dignUp: "+ vo);
		model.addAttribute("api_user", vo);
		return "/login/api_signUp";
	}
	
	@PostMapping("/signUp_api")
	public String signUp_api(UsersVO vo, RedirectAttributes rttr) {
		System.out.println("usersVO: "+ vo);
		service.insertApi(vo);
		rttr.addAttribute("name", vo.getName());
		return "redirect: /signUpSuc";
	}
	
	@GetMapping("joinOk")
	public String joinOk() {
		return "main/joinOk";
	}
	
	@PostMapping("/TMS/naverAjax")
	public @ResponseBody String naverAjax(UsersVO vo,HttpSession session, RedirectAttributes rttr) {
		
		
		System.out.println("vo: "+ vo);
		UsersVO result = service.chkApi(vo.getApi_id());
		if (result == null) {
			System.out.println("널로 들어옴");
			return "/api_signUp";
		} else {
			System.out.println("낫널로 들어옴");
			result.setType(vo.getType());
			session.setAttribute("usersVO", result);
			return "/";
		}
		
	}
	
	@RequestMapping("/ajaxTest")
	public @ResponseBody UsersVO ajaxTest(UsersVO vo, HttpSession session, Model model) {
		System.out.println("되냐?");
		System.out.println("vo: "+ vo);
		UsersVO result = service.chkApi(vo.getApi_id());
		
		if (result == null) {
			System.out.println("널로 들어옴");
			return vo;
		} else {
			System.out.println("낫널로 들어옴");
			session.setAttribute("usersVO", result);
			return result;
		}
	}
	@RequestMapping("/idChk_api")
	public @ResponseBody String idChk_api(UsersVO vo) {
		
		if (service.chkId(vo) == null) {
			return "ok";
		} else {
			return "no";
		}
		
	}
	
	@RequestMapping("/juso")
	public String juso() {
		return "login/juso";
	}
	
	@GetMapping("sessionDel")
	public String sessionDel(HttpSession session) {
		System.out.println("로그아웃 들어옴");
		session.invalidate();
		return "main/main";
	}
	
	@GetMapping("googleLogin")
	public String googleLogin() {
		return "login/googleLogin";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, @RequestParam(value="chk", required=false) String chk, RedirectAttributes rttr) {
		session.invalidate();
		rttr.addAttribute("chk", chk);
		
		return "redirect: /";
	}
	
	@PostMapping("/loginAjax")
	public @ResponseBody String loginAjax(UsersVO vo, HttpSession session) {
			System.out.println("controller 로그인 테스트");
			
			UsersVO user = service.login(vo);
			if (user == null) {
//				System.out.println("유저 로그인 실패!");
//				model.addAttribute("loginResult", "fail");
				return "fail";
			} else if (user.getRank() == 1) {
				// 관리자 로그인 성공
				session.setAttribute("usersVO", user);
//				System.out.println("관리자 확인 : " + user);
//				model.addAttribute("loginResult", "admin");
				return "admin";
			} else if (user.getRank() != 1) {
				//유저로그인
				session.setAttribute("usersVO", user);
//				System.out.println("user 확인 : " + user);
//				model.addAttribute("loginResult", "user");
				return "success";
			}
			
			return "redirect: /";
		}	
	
	// email
	@RequestMapping("/findIdPw")
	public String findIdPw() {
		return "login/findIdPw";
	}
	
	@PostMapping("/findId")
	public String findId(UsersVO vo, Model model, RedirectAttributes rttr) {
		UsersVO user = service.findId(vo);
		if (user == null) {
			return "redirect: /findIdPwFail";
		} else {
			rttr.addAttribute("findId", user.getId());
			return "redirect: /findIdOk";
		}
	}
	@PostMapping("/findPw")
	public String findPw(UsersVO vo, Model model, RedirectAttributes rttr) {
		UsersVO user = service.findPw(vo);
		
		if (user == null) {
			return "redirect: /findIdPwFail";
		} else {
			String setfrom = "tutlestudy@gmail.com";
		    String tomail  = vo.getEmail();     // 받는 사람 이메일
		    String title   = "[TMS]거북이의 기적 스터디카페 임시 비밀번호";      // 제목
		    String content = "<!DOCTYPE html>\r\n" + 
		    		"<html>\r\n" + 
		    		"<head>\r\n" + 
		    		"<meta charset=\"UTF-8\">\r\n" + 
		    		"</head>\r\n" + 
		    		"<body>"
		    		+ "<div style=\"border: 1px solid black; padding: 2%; margin: auto; width: 50%;\">"
		    		+ "<h4>[TMS] 임시 비밀번호 변경 안내</h4><hr><br>"
		    		+ "<img src=\"https://image.flaticon.com/icons/svg/483/483408.svg\" alt=\"자물쇠 이미지\"\r style=\"width: 80px; display: block; margin: auto;\">"
		    		+ "<br><div style=\"text-align: center;\">"
		    		+ "<p>회원님의 <b style=\"color: darkblue;\">임시 비밀번호</b>입니다.<br>"
		    		+ "로그인 후 반드시 비밀번호를 변경해주시길 바랍니다.</p>"
		    		+ "<p>임시 비밀번호 : "
		    		+ "<b>";    // 내용
		    String tmpPwd = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 10);
		    content += tmpPwd;
		    content += "</b></p>"
		    		+ "</div></div>"
		    		+ "</body></html>";
		    user.setPassword(tmpPwd);
		   service.tmpPwd(user);
		   rttr.addAttribute("findpw", "success");
		    try {
		      MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper 
		                        = new MimeMessageHelper(message, true, "UTF-8");
		 
		      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(tomail);     // 받는사람 이메일
		      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		      messageHelper.setText(content, true);  // 메일 내용
		     
		      mailSender.send(message);
		    } catch(Exception e){
		      System.out.println(e);
		    }
	    return "redirect: /findOk";
		}
	}
	
	@GetMapping("/findOk")
	public String findOk(@RequestParam("findpw")String pw, Model model) {
		model.addAttribute("findpw", "success");
		return "login/findOk";
	}
	@GetMapping("/findIdOk")
	public String findIdOk(@RequestParam("findId")String id, Model model) {
		model.addAttribute("findId", id);
		return "login/findOk";
	}
	@RequestMapping("/findIdPwFail")
	public String findIdPwFail(Model model) {
		model.addAttribute("result", "fail");
		return "login/findIdPw";
	}
	
	@RequestMapping("/login")
	public String TMSlogin(Model model) {
		model.addAttribute("login", "false");
		return "main/submain";
	}
	
}
