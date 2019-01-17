package com.bit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.apigateway.model.Model;
import com.bit.domain.BookingVO;
import com.bit.domain.CouponVO;
import com.bit.domain.PriceVO;
import com.bit.domain.RecvMsgVO;
import com.bit.domain.SendMsgVO;
import com.bit.domain.UsersVO;
import com.bit.service.BoardService;
import com.bit.service.CommonService;
import com.bit.service.RecruitService;
import com.bit.utils.UploadFileUtils;
import com.bit.utils.UploadFileUtilsS3;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	public String endRecruit(@RequestParam("rc_idx") int rc_idx, @RequestParam("id") String id,
			@RequestParam("cb_idx") int cb_idx) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("cb_idx", cb_idx);
		map.put("cp_quantity", 5);
		boolean chkOn = recService.updateOnOff(rc_idx);
		boolean chkCou = recService.insertCoupon(map);

		if (chkOn && chkCou) {
			return "success";
		} else {
			return "fail";
		}
	}

	@RequestMapping("/couponList")
	public List<CouponVO> couponList(@RequestParam("id") String id) {
		return comService.getUserCoupon(id);
	}

	@RequestMapping("/minusCoupon")
	public String minusCoupon(@RequestParam("cp_idx") int cp_idx) {
		boolean chkMin = comService.minusCoupon(cp_idx);
		if (chkMin) {
			return "success";
		} else {
			return "fail";
		}
	}

	@RequestMapping("/chkBooking")
	public String chkBooking(@RequestParam("id") String id) {
		List<BookingVO> bookList = boardService.searchBooking(id);
		if (bookList.size() == 0) {
			return "fail";
		} else {
			return "success";
		}
	}

	@RequestMapping("/minusReview")
	public String minusReview(@RequestParam("bk_idx") int bk_idx, @RequestParam("id") String id) {
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

	@RequestMapping("/sendMsg")
	public String sendMsg(SendMsgVO vo) {
		System.out.println(vo);
		boolean chkMsg = comService.sendMsg(vo);
		if (chkMsg) {
			return "success";
		} else {
			return "fail";
		}
	}

	@RequestMapping("/newRecvMsg")
	public List<RecvMsgVO> newRecvMsg(@RequestParam("id") String id) {
		return comService.newRecvMsg(id);
	}

	@RequestMapping("/msgDel")
	public String msgDel(@RequestParam("rm_idx") int rm_idx) {
		boolean chkDel = comService.delRecvMsg(rm_idx);
		if (chkDel) {
			return "success";
		} else {
			return "fail";
		}
	}
	@RequestMapping("/sendMsgDel")
	public String sendMsgDel(@RequestParam("sm_idx") int sm_idx) {
		boolean chkDel = comService.delSendMsg(sm_idx);
		if (chkDel) {
			return "success";
		} else {
			return "fail";
		}
	}

	@RequestMapping("/imgDel")
	public String imgDel(HttpSession session) {
		UsersVO user = (UsersVO) session.getAttribute("usersVO");
		boolean chkDel = comService.imgDel(user.getId());
		user.setUser_profileImagePath(null);
		session.setAttribute("usersVO", user);

		if (chkDel) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	
	
	
	// 프로필 이미지 업로드
	@ResponseBody
	@RequestMapping(value = "/uploadAjaxS3", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String uploadAjax(MultipartFile file) throws Exception {

		log.info("originalName: " + file.getOriginalFilename());
		//프로필 이미지의 추가경로
		String uploadpath = "resources/upload";

		ResponseEntity<String> img_path = new ResponseEntity<>(
				UploadFileUtilsS3.uploadFile(uploadpath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);

		String user_imgPath = (String) img_path.getBody();

		log.info(user_imgPath);

		log.info("file name : " + user_imgPath);


		log.info(user_imgPath);
		return user_imgPath;
	}
	
}
