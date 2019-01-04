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
	
	@PostMapping("/signUp")
	public String signUp(UsersVO vo, Model model, HttpSession session) {
		boolean chkSignUp = service.signUp(vo);
		if (chkSignUp) {
			session.setAttribute("usersVO", vo);
			return "main/joinOk";
		}else {
			return "main/main";
		}
	}
	
	@RequestMapping("/TMS/api_signUp")
	public String api_signUP(UsersVO vo, HttpSession session) {
		return "/login/api_signUp";
	}
	
	@PostMapping("/TMS/signUp_api")
	public String signUp_api(UsersVO vo, HttpSession session) {
		UsersVO sessionUser = (UsersVO) session.getAttribute("usersVO");
		sessionUser.setId(vo.getId());
		sessionUser.setPhone(vo.getPhone());
		sessionUser.setAddrDetail(vo.getAddrDetail());
		sessionUser.setZipNo(vo.getZipNo());
		sessionUser.setRoadAddrPart1(vo.getRoadAddrPart1());
		sessionUser.setType(vo.getType());
		System.out.println("usersVO: "+ sessionUser);
		service.insertApi(sessionUser);
		session.removeAttribute("usersVO");
		session.setAttribute("usersVO", sessionUser);
		
		return "redirect: /joinOk";
	}
	
	@GetMapping("joinOk")
	public String joinOk() {
		return "main/joinOk";
	}
	
	@PostMapping("/TMS/naverAjax")
	public @ResponseBody String naverAjax(UsersVO vo,HttpSession session) {
		
		
		System.out.println("vo: "+ vo);
		UsersVO result = service.chkApi(vo.getApi_id());
		
		if (result == null) {
			System.out.println("널로 들어옴");
			session.setAttribute("usersVO", vo);
			return "/TMS/api_signUp";
		} else {
			System.out.println("낫널로 들어옴");
			result.setType(vo.getType());
			session.setAttribute("usersVO", result);
			return "/TMS";
		}
		
	}
	
	@RequestMapping("/ajaxTest")
	public @ResponseBody UsersVO ajaxTest(UsersVO vo, HttpSession session) {
		System.out.println("되냐?");
		System.out.println("vo: "+ vo);
		UsersVO result = service.chkApi(vo.getApi_id());
		
		if (result == null) {
			System.out.println("널로 들어옴");
			session.setAttribute("usersVO", vo);
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
	
	@RequestMapping("/TMS/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect: /TMS";
	}
	
	@RequestMapping("/test")
	public String goTest() {
		return "main/test";
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
			
			return "redirect: /TMS";
		}	
	
	// email
	@RequestMapping("/TMS/findIdPw")
	public String findIdPw() {
		return "login/findIdPw";
	}
	
	@PostMapping("/TMS/findId")
	public String findId(UsersVO vo, Model model, RedirectAttributes rttr) {
		UsersVO user = service.findId(vo);
		if (user == null) {
			return "redirect: /TMS/findIdPwFail";
		} else {
			rttr.addAttribute("findId", user.getId());
			return "redirect: /TMS/findIdOk";
		}
	}
	@PostMapping("/TMS/findPw")
	public String findPw(UsersVO vo, Model model, RedirectAttributes rttr) {
		UsersVO user = service.findPw(vo);
		
		if (user == null) {
			return "redirect: /TMS/findIdPwFail";
		} else {
			String setfrom = "tutlestudy@gmail.com";
		    String tomail  = vo.getEmail();     // 받는 사람 이메일
		    String title   = "[TMS]거북이의 기적 스터디카페 임시 비밀번호";      // 제목
		    String content = "회원님의 임시 비밀번호 \n<b>";    // 내용
		    String tmpPwd = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 10);
		    content += tmpPwd;
		    content += "</b>";
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
		      messageHelper.setText(content);  // 메일 내용
		     
		      mailSender.send(message);
		    } catch(Exception e){
		      System.out.println(e);
		    }
	    return "redirect: /TMS/findOk";
		}
	}
	
	@GetMapping("/TMS/findOk")
	public String findOk(@RequestParam("findpw")String pw, Model model) {
		model.addAttribute("findpw", "success");
		return "login/findOk";
	}
	@GetMapping("/TMS/findIdOk")
	public String findIdOk(@RequestParam("findId")String id, Model model) {
		model.addAttribute("findId", id);
		return "login/findOk";
	}
	@RequestMapping("/TMS/findIdPwFail")
	public String findIdPwFail(Model model) {
		model.addAttribute("result", "fail");
		return "login/findIdPw";
	}
	
	@RequestMapping("/TMS/login")
	public String TMSlogin(Model model) {
		model.addAttribute("login", "false");
		return "main/submain";
	}
	
}
