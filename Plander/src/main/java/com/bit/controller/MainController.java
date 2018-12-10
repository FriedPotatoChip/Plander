package com.bit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.domain.PlannerVO;
import com.bit.domain.UserVO;
import com.bit.service.PlanService;
import com.bit.service.UserService;

@Controller
@RequestMapping("/Plander")
public class MainController {
	
	@Autowired
	private UserService service;
	
	@Autowired
	private PlanService planService;
	
	@RequestMapping("")
	public String main(Model model) {
		System.out.println("메인화면");
		model.addAttribute("listPlan", planService.getListPlan());
		System.out.println("listPlan : " + planService.getListPlan());
		return "main";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(UserVO vo, HttpSession session) {
		System.out.println("controller 로그인 테스트");
		UserVO user = service.getUser(vo);
		
		if (user == null) {
			System.out.println("로그인 실패" + user);
			return "main";
		} else if (user.getId().equals(vo.getId()) || user.getPassword().equals(vo.getPassword())) {
			session.setAttribute("user", user);
			System.out.println("user 확인 : " + user);
			return "main";
		} else {
			System.out.println("로그인 실패");
			return "main";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("로그아웃 되었습니다.");
		session.invalidate();
		return "main";
	}
	
	//회원가입
	@RequestMapping(value="/join", method = { RequestMethod.GET, RequestMethod.POST })
	public String join(UserVO vo, Model model) {
		System.out.println("controller 회원가입");
		service.join(vo);
		System.out.println("컨트롤러에서 : " + vo);
		model.addAttribute("username", vo.getName());
		return "main/joinOk";
	}
	
	//회원가입 아이디 중복확인
	@RequestMapping(value="/idchk", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String idChk(UserVO vo, Model model) {
		int result = service.idchk(vo);
		return String.valueOf(result);
	}
	
	//플래너 제목 내용 검색 
	@RequestMapping(value="/search", method = { RequestMethod.GET, RequestMethod.POST })
	public String search(PlannerVO pvo, Model model) {
		System.out.println("controller 검색");
		
		String keyword = pvo.getKeyword();
		System.out.println("검색어 : " + keyword + ", pvo : " + pvo);
		String path ="";
		
		if (keyword == null) {
			pvo.setKeyword("");
			System.out.println("검색 결과가 없습니다.");
			path = "main";
		} else {
			List<PlannerVO> searchlist = planService.searchPlan(pvo);
			System.out.println("검색결과 : " + searchlist);
			model.addAttribute("searchPlan", searchlist);
			model.addAttribute("keyword", keyword);
			path = "main/searchList";
		}
		
		return path;
	}
//	
//	@RequestMapping("/searchList")
//	public String searchList() {
//		return "main/searchList";
//	}
//	
	
}
