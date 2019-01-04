package com.bit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bit.domain.CouponVO;
import com.bit.domain.PriceVO;
import com.bit.service.CommonService;
import com.bit.service.RecruitService;

@RestController
public class AjaxController {
	
	@Autowired
	private CommonService comService;
	@Autowired
	private RecruitService recService;
	
	@RequestMapping("/getPrice")
	public List<PriceVO> getPrice() {
		return comService.getPriceList();
	}
	
	@RequestMapping("/endRecruit")
	public String endRecruit(@RequestParam("rc_idx")int rc_idx, @RequestParam("id")String id) {
		boolean chkOn = recService.updateOnOff(rc_idx);
		boolean chkCou = recService.insertCoupon(id);
		
		if (chkOn && chkCou) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping("/couponList")
	public List<CouponVO> couponList(@RequestParam("id")String id){
		return comService.getUserCoupon(id);
	}
	
	@RequestMapping("/minusCoupon")
	public String minusCoupon(@RequestParam("cp_idx")int cp_idx) {
		boolean chkMin = comService.minusCoupon(cp_idx);
		if (chkMin) {
			return "success";
		}else {
			return "fail";
		}
	}
	
}
