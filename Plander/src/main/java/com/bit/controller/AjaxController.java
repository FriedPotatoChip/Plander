package com.bit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bit.domain.BookingVO;
import com.bit.domain.CouponVO;
import com.bit.domain.PriceVO;
import com.bit.service.BoardService;
import com.bit.service.CommonService;
import com.bit.service.RecruitService;

@RestController
public class AjaxController {
	
	@Autowired
	private CommonService comService;
	@Autowired
	private RecruitService recService;
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/getPrice")
	public List<PriceVO> getPrice() {
		return comService.getPriceList();
	}
	
	@RequestMapping("/endRecruit")
	public String endRecruit(@RequestParam("rc_idx")int rc_idx, @RequestParam("id")String id, @RequestParam("cb_idx")int cb_idx) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("cb_idx", cb_idx);
		map.put("cp_quantity", 5);
		boolean chkOn = recService.updateOnOff(rc_idx);
		boolean chkCou = recService.insertCoupon(map);
		
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
	
	@RequestMapping("/chkBooking")
	public String chkBooking(@RequestParam("id")String id) {
		List<BookingVO> bookList = boardService.searchBooking(id);
		if (bookList.size() == 0) {
			return "fail";
		} else {
			return "success";
		}
	}
	
	@RequestMapping("/minusReview")
	public String minusReview(@RequestParam("bk_idx")int bk_idx, @RequestParam("id")String id) {
		Map<String, Object> map = new HashMap<>();
		boolean chk = boardService.minusReview(bk_idx);
		map.put("id", id);
		map.put("cb_idx", 2);
		map.put("cp_quantity", 1);
		boolean chkCou = recService.insertCoupon(map);
		if (chk && chkCou) {
			return "success";
		} else {
			return "fail";
		}
	}
}
