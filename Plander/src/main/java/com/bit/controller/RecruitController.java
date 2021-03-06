package com.bit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.domain.CommentsVO;
import com.bit.domain.RecruitVO;
import com.bit.service.BoardService;
import com.bit.service.RecruitService;
import com.bit.utils.PagingVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class RecruitController {

	@Autowired
	private RecruitService service;
	@Autowired
	private BoardService boardService;
	
	/* 모집글 작성 시작 */
	@GetMapping("/recruitWrite")
	public String recruitWrite() {
		return "board/recruitWrite";
	}
	
	@PostMapping("/recruitWrite")
	public String recruitWrite(RecruitVO vo) {
		
		service.register(vo);
		
		return "redirect: /recruitDetail?idx="+vo.getRc_idx();
	}
	/* 모집글 작성 끝 */
	
	/* 모집글 목록 */
	@GetMapping("/recruit")
	public String recruit(Model model, PagingVO page) {
		
		page = new PagingVO(page.getNowPage(), page.getCntPerPage(), service.getTotal());
		
		page.CalcPage(page.getNowPage(), page.getCntPerPage());
		model.addAttribute("page", page);
		model.addAttribute("boardList", service.getListPage(page));
		model.addAttribute("noticeList", boardService.getNoticeList());
		return "board/recruit";
	}
	
	/* 모집글 상세보기 */
	@GetMapping("/recruitDetail")
	public String detailOne(@RequestParam("idx")int rc_idx, Model model, PagingVO page) {
		System.out.println("rc_idx: " + rc_idx);
		service.updateHit(rc_idx);
		model.addAttribute("rc_board", service.detailOne(rc_idx));
		model.addAttribute("apply", service.getApplyList(rc_idx));
		model.addAttribute("nowPage", page.getNowPage());
		model.addAttribute("cntPerPage", page.getCntPerPage());
		
		return "board/recruitDetail";
	}
	
	/* 모집글 신청 */
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
	
	/* 모집글 신청 취소 */
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
	
	/* 수정, 삭제 시작 */
	@GetMapping("/deleteRec")
	public String deleteRecruit(@RequestParam("rc_idx") int rc_idx) {
		service.deleteRec(rc_idx);
		return "redirect: /recruit";
	}
	
	@GetMapping("/modifyRec")
	public String modifyRecruit(@RequestParam("rc_idx") int rc_idx, Model model) {
		model.addAttribute("rc_board", service.detailOne(rc_idx));
		return "board/recruitModify";
	}
	
	@PostMapping("/modifyRec")
	public String modifyRecruit(RecruitVO vo) {
		service.modifyRec(vo);
		return "redirect: /recruitDetail?idx="+vo.getRc_idx();
	}
	/* 수정, 삭제 끝 */
	
	/* 검색 */
	@GetMapping("/searchRecruitList")
	public String searchList(@RequestParam("keyword")String keyword, @RequestParam("target")String target, PagingVO page, Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("target", target);
		
		page = new PagingVO(page.getNowPage(), page.getCntPerPage(), service.getSearchTotal(map));
		page.CalcPage(page.getNowPage(), page.getCntPerPage());
		
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		
		model.addAttribute("page", page);
		model.addAttribute("boardList", service.getSearchList(map));
		return "board/recruit";
	}
	
	// 글목록 출력 ajax
	@RequestMapping("/recruitListAjax")
	public @ResponseBody List<RecruitVO> boardListAjax(@RequestParam("nowPage")int nowPage, @RequestParam("cntPerPage")int cntPerPage){
		
		Map<String, Integer> map = new HashMap<>();
		PagingVO page = new PagingVO(nowPage, 5, service.getTotal());
		page.CalcPage(nowPage, cntPerPage);
		
		
		List<RecruitVO> list = new ArrayList<>();
		RecruitVO vo = new RecruitVO();
		String chkEndPage = "false";
		String chkStartPage = "false";
		if (page.getNowPage() != 1) {
			chkStartPage = "true";
		}
		if (page.getNowPage() != page.getLastPage()) {
			chkEndPage = "true";
		}
		vo.setRc_title(chkEndPage);
		vo.setRc_content(chkStartPage);
		list.add(vo);
		
		List<RecruitVO> listPage = service.getListPage(page);
		list.addAll(listPage);
		
		return list;
	}
	
	/* 댓글 관련 시작 */
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
		
		page.CalcPage(page.getNowPage(), 20);
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
	/* 댓글 관련 끝 */
	
	
	
	
	
	
	
	
	
	
	

	
	 
	
	
	
	
	
	
	
	// 업로드 관련
/*	@Resource(name = "uploadPath")
	private String uploadPath;
	
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
	}*/
	
	
	
	
	
}
