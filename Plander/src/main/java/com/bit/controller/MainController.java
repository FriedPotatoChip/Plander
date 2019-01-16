package com.bit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bit.domain.BookingCbVO;
import com.bit.domain.BookingVO;
import com.bit.domain.RecruitVO;
import com.bit.domain.RecvMsgVO;
import com.bit.domain.UsersVO;
import com.bit.service.CommonService;
import com.bit.service.LoginService;
import com.bit.service.MyService;
import com.bit.utils.UploadFileUtils;

@Controller
@RequestMapping("/TMS")
public class MainController {

	@Resource(name = "uploadPath")
	private String uploadPath;

	@Autowired
	private MyService myService;
	@Autowired
	private LoginService logService;
	@Autowired
	private CommonService comService;

	@RequestMapping("")
	public String main(HttpSession session, Model model, @RequestParam(value="chk", required=false) String chk) {
		UsersVO user = (UsersVO) session.getAttribute("usersVO");
		if (user != null) {

			// 전체 좌석, 사물함 예약 갯수
			int seatcnt = myService.my_seat_header_cnt(user);
			int cabinetcnt = myService.my_cabinet_header_cnt(user);

			session.setAttribute("seatcnt", seatcnt);
			session.setAttribute("cabinetcnt", cabinetcnt);

			// 현재 좌석 예약내역
			List<BookingVO> seat = myService.my_seat_header(user);
			System.out.println("seat: " + seat);
			session.setAttribute("seat", seat);

			// 현재 사물함 예약내역
			List<BookingCbVO> cabinet = myService.my_cabinet_header(user);
			session.setAttribute("cabinet", cabinet);
			System.out.println("cabinet: " + cabinet);
			
		}
		List<RecruitVO> lrvo = comService.RandomRecruit();
		System.out.println("lrvo : " + lrvo);
		model.addAttribute("RandomRecruit", comService.RandomRecruit());
		
		model.addAttribute("chk", chk);

		return "main/main";
	}

/*	@GetMapping("/sub")
	public String sub() {
		return "main/submain";
	}*/

	@RequestMapping("/proImgTest")
	public String proImgTest() {
		return "main/proImgTest";
	}

	// 프로필 사진 업로드
	@RequestMapping(value = "/profileUpload", method = RequestMethod.POST)
	public String profileUpload(@RequestParam("file") MultipartFile file, @RequestParam("x") String x,
			@RequestParam("y") String y, @RequestParam("w") String w, @RequestParam("h") String h, UsersVO vo,
			HttpSession session) throws Exception {
		System.out.println("file: " + file);
		System.out.println("x: " + x + ", y: " + y + ", w: " + w + ", h: " + h);
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
		System.out.println("오리지널: " + file.getOriginalFilename());
		System.out.println("썸네일 경로: " + user_imgPath);
		String imgPath = "/resources/upload" + user_imgPath;
		vo.setUser_profileImagePath(imgPath);
		myService.updateProfileImg(vo);

		// 세션 정보 수정
		UsersVO user = (UsersVO) session.getAttribute("usersVO");
		user.setUser_profileImagePath(vo.getUser_profileImagePath());
		session.setAttribute("usersVO", user);
		
		try {
			Thread.sleep(3000);
		} catch (Exception e) { }
		return "redirect: /TMS/my";
	}
	
	@GetMapping("/sendMsg")
	public String sendMsg(@RequestParam(value="recv_id", required=false)String recv_id, Model model) {
		
		UsersVO vo = new UsersVO();
		vo.setId(recv_id);
		vo = logService.chkId(vo);
		model.addAttribute("recv_user", vo);
		return "main/sendMsg";
	}
	
	@GetMapping("/profileSummary")
	public String profileSummary(@RequestParam(value="id", required=false)String id, Model model) {
		
		UsersVO vo = new UsersVO();
		vo.setId(id);
		vo = logService.chkId(vo);
		model.addAttribute("profile", vo);
		return "main/profileSummary";
	}
	
	@GetMapping("/recvMsg")
	public String recvMsg(@RequestParam("rm_idx")int rm_idx, Model model) {
		RecvMsgVO vo = new RecvMsgVO();
		vo = comService.msgDetail(rm_idx);
		model.addAttribute("msg", vo);
		if (vo.getChk() == 1) {
			comService.readMsgOne(rm_idx);
		}
		return "main/recvMsg";
	}
	
}
