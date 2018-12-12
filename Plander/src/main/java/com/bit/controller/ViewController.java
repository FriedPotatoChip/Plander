package com.bit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.domain.CategoryVO;
import com.bit.domain.Category_dVO;
import com.bit.domain.PlannerVO;
import com.bit.service.ViewService;

@Controller
@RequestMapping("/Plander/view")
public class ViewController {
	
	@Autowired
	private ViewService service;
	
	@RequestMapping("")
	public String main(CategoryVO cvo, Model model, Category_dVO cdvo, PlannerVO pvo) {
		model.addAttribute("category", service.getListCategory(cvo));
		model.addAttribute("plannerRandom", service.getListPlannerRandom(pvo));
		model.addAttribute("category_d", service.getListCategory_d(cdvo));

		return "viewPage/planderList";
	}
	
	@RequestMapping("CategoryDetailPlanner")
	public String main(CategoryVO cvo, Model model, PlannerVO pvo) {
		model.addAttribute("category", service.getListCategory(cvo));
		/*model.addAttribute("plannerRandom", service.getListPlannerRandom(pvo));*/
		model.addAttribute("plannerDetail", service.getDetailPlannerList(pvo));
		return "viewPage/CategoryDetailPlanner";
	}
	
	
	@RequestMapping("test")
	public @ResponseBody List<PlannerVO> test(PlannerVO pvo){
		System.out.println("pvo: "+ pvo);
		if(pvo.getCt_idx() == 0) {
			return service.getListPlannerRandom(pvo);			
		} else {
			return service.getDetailPlannerList_2(pvo);
		}
	}
	
	
}
