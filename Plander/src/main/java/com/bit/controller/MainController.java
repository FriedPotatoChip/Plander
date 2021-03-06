package com.bit.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.imgscalr.Scalr;
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
import com.bit.domain.PriceVO;
import com.bit.domain.RecruitVO;
import com.bit.domain.RecvMsgVO;
import com.bit.domain.UsersVO;
import com.bit.service.CommonService;
import com.bit.service.LoginService;
import com.bit.service.MyService;
import com.bit.utils.UploadFileUtilsS3;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/")
public class MainController {

	@Autowired
	private MyService myService;
	@Autowired
	private LoginService logService;
	@Autowired
	private CommonService comService;

	@RequestMapping("test")
	public String test() {
		return "board/test";
	}
	
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

	// 프로필 이미지 업로드
	@RequestMapping(value = "/profileUpload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String uploadAjax(@RequestParam("file") MultipartFile file, @RequestParam("x") String x,
			@RequestParam("y") String y, @RequestParam("w") String w, @RequestParam("h") String h, UsersVO vo,
			HttpSession session) throws Exception {
		
		System.out.println("file: " + file.getOriginalFilename());
		
		String originName = file.getOriginalFilename();
		String type = originName.substring(originName.lastIndexOf("."), originName.length());
		System.out.println("type: "+ type);
		System.out.println("type: "+ type.substring(1));
		Map<String, Integer> map = new HashMap<>();
		int xx = (int) Math.round(Double.parseDouble(x));
		int yy = (int) Math.round(Double.parseDouble(y));
		int ww = (int) Math.round(Double.parseDouble(w));
		int hh = (int) Math.round(Double.parseDouble(h));
		map.put("x", xx);
		map.put("y", yy);
		map.put("w", ww);
		map.put("h", hh);
		
		
		System.out.println("멀티파트 사이즈: "+ file.getSize());
		// MultiFile to byte[] to BufferedImage
		InputStream in = new ByteArrayInputStream(file.getBytes());
		BufferedImage sourceImg = ImageIO.read(in);
		BufferedImage destImg = Scalr.crop(sourceImg, map.get("x"), map.get("y"), map.get("w"), map.get("h"));
		destImg = Scalr.resize(destImg, 150, 150);
		System.out.println("width: "+ destImg.getWidth());
		// BufferedImage to byte[]
	    ByteArrayOutputStream baos = new ByteArrayOutputStream();            
		ImageIO.write(destImg, type.substring(1).toUpperCase(), baos);
		baos.close();
		System.out.println("size: "+ baos.size());
		
		log.info("originalName: " + file.getOriginalFilename());
		//프로필 이미지의 추가경로
		String uploadpath = "resources/upload";

		ResponseEntity<String> img_path = new ResponseEntity<>(
				UploadFileUtilsS3.uploadProfileImg(uploadpath, originName, baos.toByteArray()),
				HttpStatus.CREATED);

		String user_imgPath = (String) img_path.getBody();

		log.info(user_imgPath);

		log.info("file name : " + user_imgPath);


		log.info(user_imgPath);
		String imgPath = "https://s3.ap-northeast-2.amazonaws.com/turtlesmiraclebucket/resources/upload" + user_imgPath;
		vo.setUser_profileImagePath(imgPath);
		myService.updateProfileImg(vo);
		
		// 세션 정보 수정
		UsersVO user = (UsersVO) session.getAttribute("usersVO");
		user.setUser_profileImagePath(vo.getUser_profileImagePath());
		session.setAttribute("usersVO", user);
		return "redirect: /my";
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
	public String recvMsg(@RequestParam("rm_idx")int rm_idx, @RequestParam(value="type", required=false)String type, Model model) {
		RecvMsgVO vo = new RecvMsgVO();
		vo = comService.msgDetail(rm_idx);
		model.addAttribute("msg", vo);
		if (type == null) {
			if (vo.getChk() == 1) {
				comService.readMsgOne(rm_idx);
			}
		}
		return "main/recvMsg";
	}
	
	@RequestMapping("/operation")
	public String operation() {
		
		return "main/operation";
	}
	
	
	@RequestMapping("/guide")
	public String guide() {
		
		return "main/guide";
	}

}
