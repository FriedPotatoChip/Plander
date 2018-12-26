package com.bit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bit.domain.CommentsVO;
import com.bit.domain.RecruitVO;
import com.bit.service.RecruitService;
import com.bit.utils.MediaUtils;
import com.bit.utils.PagingVO;
import com.bit.utils.UploadFileUtils;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class RecruitController {

	@Autowired
	private RecruitService service;
	
	@GetMapping("/TMS/recruitWrite")
	public String recruitWrite() {
		return "board/recruitWrite";
	}
	
	@PostMapping("/TMS/recruitWrite")
	public String recruitWrite(RecruitVO vo) {
		
		service.register(vo);
		
		return "redirect: /TMS/recruitDetail?idx="+vo.getRc_idx();
	}
	
	@GetMapping("/TMS/recruit")
	public String recruit(Model model, PagingVO page) {
		
		
		page = new PagingVO(page.getNowPage(), page.getCntPerPage(), service.getTotal());
		
		
		page.CalcPage(page.getNowPage(), page.getCntPerPage());
		model.addAttribute("page", page);
		model.addAttribute("boardList", service.getListPage(page));
		return "board/recruit";
	}
	
	@GetMapping("/TMS/recruitDetail")
	public String detailOne(@RequestParam("idx")int rc_idx, Model model, PagingVO page) {
		
		service.updateHit(rc_idx);
		model.addAttribute("rc_board", service.detailOne(rc_idx));
		model.addAttribute("apply", service.getApplyList(rc_idx));
		model.addAttribute("nowPage", page.getNowPage());
		model.addAttribute("cntPerPage", page.getCntPerPage());
		
		return "board/recruitDetail";
	}
	
	@RequestMapping("/apply")
	public @ResponseBody String apply(@RequestParam("id") String id, @RequestParam("rc_idx") int rc_idx) {
		
		log.info("ajax 데이터 테스트: "+ id+", "+ rc_idx);
		boolean chkUp = service.updateCur(rc_idx);
		
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("rc_idx", rc_idx);
		boolean chkApp = service.apply(map);
		
		if(chkUp && chkApp) {
			return "success";
		} else {
			return "fail";
		}
		
	}
	
	@RequestMapping("/applyCancel")
	public @ResponseBody String applyCancel(@RequestParam("id") String id, @RequestParam("rc_idx") int rc_idx) {
		
		boolean chkUp = service.minusCur(rc_idx);
		
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("rc_idx", rc_idx);
		boolean chkApp = service.deleteApply(map);
		
		if(chkUp && chkApp) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@GetMapping("/deleteRec")
	public String deleteRecruit(@RequestParam("rc_idx") int rc_idx) {
		service.deleteRec(rc_idx);
		return "redirect: /TMS/recruit";
	}
	
	@GetMapping("/TMS/modifyRec")
	public String modifyRecruit(@RequestParam("rc_idx") int rc_idx, Model model) {
		model.addAttribute("rc_board", service.detailOne(rc_idx));
		return "board/recruitModify";
	}
	
	@PostMapping("/TMS/modifyRec")
	public String modifyRecruit(RecruitVO vo) {
		service.modifyRec(vo);
		return "redirect: /TMS/detail?idx="+vo.getRc_idx();
	}
	
	// 모집글 댓글 입력
	@PostMapping("/registerComm")
	public @ResponseBody String registerComm(CommentsVO vo) {
		log.info("넘어온 댓글 내용: "+ vo);
		boolean chkIns = service.insertComm(vo);
		if (chkIns) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@PostMapping("/registerReplyComm")
	public @ResponseBody String registerReplyComm(CommentsVO vo) {
		log.info("넘어온 대댓글 내용: "+ vo);
		boolean chkIns = service.insertReplyComm(vo);
		if (chkIns) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 댓글 출력
	@GetMapping("/commentList")
	public @ResponseBody List<CommentsVO> commList(@RequestParam("rc_idx")int rc_idx, PagingVO page, Model model){
		
		Map<String, Object> map = new HashMap<>();
		map.put("rc_idx", rc_idx);
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		model.addAttribute("page", page);
		
		return service.getCommList(map);
	}
	
	// 댓글 페이징처리
	@RequestMapping("/commPaging")
	public @ResponseBody PagingVO paingComm(@RequestParam("rc_idx")int rc_idx, PagingVO page) {
		page = new PagingVO(page.getNowPage(), page.getCntPerPage(), service.cntCommAll(rc_idx));
		
		page.CalcPage(page.getNowPage(), page.getCntPerPage());
		System.out.println("page: "+ page);
		
		return page;
	}
	
	@GetMapping("/deleteComm")
	public @ResponseBody String deleteComm(@RequestParam("c_idx")int c_idx, @RequestParam("rc_idx")int rc_idx) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("rc_idx", rc_idx);
		map.put("rp_idx", c_idx);
		boolean chk;
		
		// 대댓글 여부 확인
		int cntReply = service.cntReplyComm(map);
		
		if (cntReply == 0) {
			chk = service.deleteComm(c_idx);
		} else {
			chk = service.updateDeleteComm(c_idx);
		}
		
		if (chk) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@PostMapping("/modifyComm")
	public @ResponseBody String modifyComm(CommentsVO vo) {
		boolean chk = service.updateComm(vo);
		if (chk) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 업로드 관련
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping("uploadTest")
	public String uploadTest() {
		return "board/uploadTest";
	}
	
	@GetMapping("uploadForm")
	public void uploadForm() throws Exception {
		
	}
	
	@PostMapping("uploadPath")
	public String uploadForm(MultipartFile file, Model model) throws Exception{
		
		log.info("originalName: "+ file.getOriginalFilename());
		log.info("size: "+ file.getSize());
		log.info("contentType: "+ file.getContentType());
		
		String saveName = uploadFile(file.getOriginalFilename(), file.getBytes());
		
		model.addAttribute("saveName", saveName);
		
		return "uploadResult";
	}
	
	// UUID를 이용한 겹치지 않는 이름 생성
	private String uploadFile(String originalName, byte[] fileData) throws Exception{
		
		UUID uid = UUID.randomUUID();
		String saveName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, saveName);
		FileCopyUtils.copy(fileData, target);
		return saveName;
	}
	
	
	
	
	
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/imageUpload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String uploadAjax(MultipartFile file, String str, HttpSession session,
			HttpServletRequest request, Model model) throws Exception {

			log.info("originalName: " + file.getOriginalFilename());

			ResponseEntity<String> img_path = new ResponseEntity<>(
					UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
					HttpStatus.CREATED);
			String user_imgPath = (String) img_path.getBody();

			log.info(user_imgPath);
//			UserVO vo = new UserVO();
//			vo.setUser_profileImagePath(user_imgPath);
//			UserVO id = (UserVO) session.getAttribute("login");
//			System.out.println(id.getUser_id());
//			vo.setUser_id(id.getUser_id());
			log.info("file name : " + user_imgPath);

			return user_imgPath;
	}

	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		log.info("FILE NAME: " + fileName);

		try {

			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = MediaUtils.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + fileName);

			if (mType != null) {
				headers.setContentType(mType);
			} else {

				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {

		log.info("delete file: " + fileName);

		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		MediaType mType = MediaUtils.getMediaType(formatName);

		if (mType != null) {

			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
		}

		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	
	
	
	
}
