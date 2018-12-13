package com.bit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.domain.Pagination;
import com.bit.domain.PlannerVO;
import com.bit.domain.UserVO;
import com.bit.service.MyService;

@Controller
@RequestMapping("/Plander/mypage")
public class MypageController {

	@Autowired
	private MyService service;

	@RequestMapping("")
	public String mypage(@ModelAttribute("planner") PlannerVO planner, @ModelAttribute("u_idx") int u_idx,
			Model model, @RequestParam(defaultValue = "1") int curPage) {
		System.out.println("u_idx: " + u_idx);
		model.addAttribute("plannerList", service.getPlannerList(u_idx));
		System.out.println("plannerList: " + service.getPlannerList(u_idx));
		model.addAttribute("bookmarkList", service.getBookmarkList(u_idx));
		System.out.println("bookmarkList: " + service.getBookmarkList(u_idx));
		model.addAttribute("getCommentList", service.getCommentList(u_idx));
		System.out.println("getCommentList: " + service.getCommentList(u_idx));

		// 전체리스트 개수
		int listCnt = service.totalCount(u_idx);

		Pagination pagination = new Pagination(listCnt, curPage);
//		planner.setStartIndex(pagination.getStartIndex());
//		planner.setCntPerPage(pagination.getPageSize());

		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pagination);

		return "myPage/mypage";
	}

	@RequestMapping("/plannerOne")
	public String plannerOne(@ModelAttribute("p_idx") int p_idx, Model model) {
		System.out.println("p_idx: " + p_idx);
		model.addAttribute("plannerOne", service.getPlannerOne(p_idx));
		System.out.println("plannerOne: " + service.getPlannerOne(p_idx));
		return "myPage/plannerDetail";
	}

	@RequestMapping("/bookmarkOne")
	public String bookmarkOne(@ModelAttribute("p_idx") int p_idx, Model model) {
		System.out.println("p_idx: " + p_idx);
		model.addAttribute("bookmarkOne", service.getBookmarkOne(p_idx));
		System.out.println("bookmarkOne: " + service.getBookmarkOne(p_idx));
		return "myPage/bookmarkDetail";
	}

	@RequestMapping("/updatePage")
	public String updatePage() {
		return "myPage/update";
	}

	@RequestMapping("/update")
	public String updateUser(@ModelAttribute("u_idx") int u_idx, @ModelAttribute("user") UserVO vo) {
		System.out.println("u_idx: " + u_idx);
		vo.setU_idx(u_idx);
		System.out.println("user: " + vo);

		int result = service.updateUser(vo);
		System.out.println("처리건수: " + result);

		return "redirect: /Plander/mypage";
	}

}
