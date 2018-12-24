package com.bit.controller;

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

import com.bit.domain.BoardVO;
import com.bit.domain.CommentsVO;
import com.bit.domain.RecruitVO;
import com.bit.service.BoardService;
import com.bit.utils.PagingVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	
	@GetMapping("/TMS/board")
	public String freeBoard(Model model, PagingVO page, @RequestParam("ct_idx")int ct_idx) {
		log.info("처음 들어온 page: "+ page);
		Map<String, Integer> map = new HashMap<>();
		page = new PagingVO(page.getNowPage(), page.getCntPerPage(), service.getTotal(ct_idx));
		log.info("page 객체 생성: "+ page);
		page.CalcPage(page.getNowPage(), page.getCntPerPage());
		log.info("page 계산 결과: "+ page);
		model.addAttribute("page", page);
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		map.put("ct_idx", ct_idx);
		model.addAttribute("boardList", service.getListPage(map));
		model.addAttribute("ct_idx", ct_idx);
		return "board/boardList";
	}
	
	@GetMapping("/TMS/boardWrite")
	public String recruitWrite(Model model, @RequestParam("ct_idx")int ct_idx) {
		model.addAttribute("ct_idx", ct_idx);
		return "board/boardWrite";
	}
	
	@PostMapping("/TMS/boardWrite")
	public String recruitWrite(BoardVO vo) {
		service.register(vo);
		// 글 등록 후 디테일 페이지로 이동
		return "redirect: /TMS/boardDetail?idx="+vo.getB_idx();
		
	}
	
	@GetMapping("/TMS/boardDetail")
	public String detailOne(@RequestParam("idx")int b_idx, Model model, PagingVO page) {
		
		service.updateHit(b_idx);
		log.info("디테일 가기 전 page: "+ page);
		model.addAttribute("board", service.detailOne(b_idx));
		model.addAttribute("nowPage", page.getNowPage());
		model.addAttribute("cntPerPage", page.getCntPerPage());
		
		return "board/boardDetail";
	}
	
	/* 수정 삭제 시작 */
	@GetMapping("/deleteBoard")
	public String deleteRecruit(@RequestParam("b_idx") int b_idx, @RequestParam("ct_idx")int ct_idx) {
		service.deleteRec(b_idx);
		return "redirect: /TMS/board?ct_idx="+ ct_idx;
	}
	
	@GetMapping("/TMS/modifyBoard")
	public String modifyRecruit(@RequestParam("b_idx") int b_idx, Model model) {
		model.addAttribute("board", service.detailOne(b_idx));
		return "board/boardModify";
	}
	
	@PostMapping("/TMS/modifyBoard")
	public String modifyRecruit(BoardVO vo) {
		service.modifyRec(vo);
		return "redirect: /TMS/boardDetail?idx="+vo.getB_idx();
	}
	/* 수정 삭제 끝 */
	
	/* 댓글 관련 시작 */
	// 게시판 댓글 입력
	@PostMapping("/registerBoardComm")
	public @ResponseBody String registerComm(CommentsVO vo) {
		log.info("넘어온 댓글 내용: "+ vo);
		boolean chkIns = service.insertComm(vo);
		if (chkIns) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@PostMapping("/registerBoardReplyComm")
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
	@GetMapping("/commentBoardList")
	public @ResponseBody List<CommentsVO> commList(@RequestParam("b_idx")int b_idx, PagingVO page, Model model){
		
		Map<String, Object> map = new HashMap<>();
		map.put("b_idx", b_idx);
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		model.addAttribute("page", page);
		
		return service.getCommList(map);
	}
	
	// 댓글 페이징처리
	@RequestMapping("/commBoardPaging")
	public @ResponseBody PagingVO paingComm(@RequestParam("b_idx")int b_idx, PagingVO page) {
		page = new PagingVO(page.getNowPage(), page.getCntPerPage(), service.cntCommAll(b_idx));
		
		page.CalcPage(page.getNowPage(), page.getCntPerPage());
		System.out.println("page: "+ page);
		
		return page;
	}
	
	@GetMapping("/deleteBoardComm")
	public @ResponseBody String deleteComm(@RequestParam("c_idx")int c_idx, @RequestParam("b_idx")int b_idx) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("b_idx", b_idx);
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
	
	@PostMapping("/modifyBoardComm")
	public @ResponseBody String modifyComm(CommentsVO vo) {
		boolean chk = service.updateComm(vo);
		if (chk) {
			return "success";
		} else {
			return "fail";
		}
	}	
	/* 댓글 관련 시작 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
