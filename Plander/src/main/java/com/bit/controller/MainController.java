package com.bit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.domain.CategoryVO;
import com.bit.domain.PlannerVO;
import com.bit.domain.UserVO;
import com.bit.service.PlanService;
import com.bit.service.UserService;
import com.bit.service.ViewService;

@Controller
@RequestMapping("/Plander")
public class MainController {
	
	@Autowired
	private UserService service;
	
	@Autowired
	private PlanService planService;
	
	@Autowired
	private ViewService viewService;
	
	
	@RequestMapping("")
	public String main(Model model, CategoryVO cvo) {
		System.out.println("메인화면");
		//카테고리 목록 출력
		model.addAttribute("category", viewService.getListCategory(cvo));
		model.addAttribute("listPlan", planService.getListPlan());
		System.out.println("listPlan : " + planService.getListPlan());
		return "main";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(UserVO vo, HttpSession session) {
		System.out.println("controller 로그인 테스트");
		UserVO user = service.getUser(vo);
		UserVO admin = service.userchk(vo);
		
		if (user == null || admin == null) {
			System.out.println("로그인 실패" + user);
			return "main";
		} else if (admin.getId().equals(vo.getId()) || admin.getPassword().equals(vo.getPassword())) {
			session.setAttribute("admin", admin);
			System.out.println("관리자 확인 : " + admin);
			return "main";
		} else if ( user.getId().equals(vo.getId()) || user.getPassword().equals(vo.getPassword())) {
			session.setAttribute("user", user);
			System.out.println("user 확인 : " + user);
			return "main";
		} 
		
		else {
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
			int cnt = planService.searchCnt(pvo);
			
			System.out.println("검색결과 : " + searchlist + ", cnt : " + cnt);
			model.addAttribute("searchPlan", searchlist);
			model.addAttribute("keyword", keyword);
			model.addAttribute("cnt", cnt);
			path = "main/searchList";
		}
		
		return path;
	}
	
	@RequestMapping("/findIdPw")
	public String findIdPw() {
		return "main/findIdPw";
	}
	
	//아이디 찾기
	@RequestMapping(value="/findId", method = { RequestMethod.GET, RequestMethod.POST })
	public String findId(UserVO vo, Model model) {
		System.out.println("controller 아이디 비밀번호 찾기");
		UserVO findid = service.findId(vo);
		if (findid == null) {
			System.out.println("찾는 값이 없습니다.");
			return "main/findIdPw";
		} else {
			System.out.println("아이디 찾기 : " + findid);
			model.addAttribute("findid", findid);
			return "main/findOk";
		}
		
	}
	
	//비밀번호 찾기
	@RequestMapping(value="/findPw", method = { RequestMethod.GET, RequestMethod.POST })
	public String findPw(UserVO vo, Model model) {
		UserVO findpw = service.findPw(vo);
		System.out.println("비밀번호 찾기 : " + findpw);
		model.addAttribute("findpw", findpw);
		return "main/findOk";
	}
	
	
}
