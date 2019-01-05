package com.bit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.domain.BoardVO;
import com.bit.domain.BookingVO;
import com.bit.domain.CommentsVO;
import com.bit.domain.UsersVO;
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
		
		Map<String, Integer> map = new HashMap<>();
		page = new PagingVO(page.getNowPage(), page.getCntPerPage(), service.getTotal(ct_idx));
		page.CalcPage(page.getNowPage(), page.getCntPerPage());
		model.addAttribute("page", page);
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		map.put("ct_idx", ct_idx);
		model.addAttribute("boardList", service.getListPage(map));
		model.addAttribute("ct_idx", ct_idx);
		
		return "board/boardList";
	}
	
	@GetMapping("/TMS/boardWrite")
	public String recruitWrite(Model model, @RequestParam("ct_idx")int ct_idx, HttpSession session) {
		model.addAttribute("ct_idx", ct_idx);
		
		if (ct_idx == 3) {
			UsersVO user = (UsersVO) session.getAttribute("usersVO");
			List<BookingVO> bookList = service.searchBooking(user.getId());
			model.addAttribute("bookList", bookList);
			return "board/boardWrite";
		}else {
			return "board/boardWrite";
		}
	}
	
	@PostMapping("/TMS/boardWrite")
	public String recruitWrite(BoardVO vo) {
		service.register(vo);
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
	
	// 글목록 출력 ajax
	@RequestMapping("/boardListAjax")
	public @ResponseBody List<BoardVO> boardListAjax(@RequestParam("nowPage")int nowPage, @RequestParam("ct_idx")int ct_idx, @RequestParam("cntPerPage")int cntPerPage){
		
		Map<String, Integer> map = new HashMap<>();
		PagingVO page = new PagingVO(nowPage, 5, service.getTotal(ct_idx));
		page.CalcPage(nowPage, cntPerPage);
		
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		map.put("ct_idx", ct_idx);
		
		List<BoardVO> list = new ArrayList<>();
		BoardVO vo = new BoardVO();
		String chkEndPage = "false";
		String chkStartPage = "false";
		if (page.getNowPage() != 1) {
			chkStartPage = "true";
		}
		if (page.getNowPage() != page.getLastPage()) {
			chkEndPage = "true";
		}
		vo.setB_title(chkEndPage);
		vo.setB_content(chkStartPage);
		list.add(vo);
		
		List<BoardVO> listPage = service.getListPage(map);
		list.addAll(listPage);
		
		return list;
	}
	
	
	
	
	/* 검색 */
	@GetMapping("/TMS/searchList")
	public String searchList(@RequestParam("keyword")String keyword, @RequestParam("target")String target, BoardVO vo, PagingVO page, Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("target", target);
		
		page = new PagingVO(page.getNowPage(), page.getCntPerPage(), service.getSearchTotal(map));
		page.CalcPage(page.getNowPage(), page.getCntPerPage());
		
		map.put("ct_idx", vo.getCt_idx());
		map.put("start", page.getStart());
		map.put("end", page.getEnd());
		
		model.addAttribute("page", page);
		model.addAttribute("boardList", service.getSearchList(map));
		model.addAttribute("ct_idx", vo.getCt_idx());
		return "board/boardList";
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
		
		page.CalcPage(page.getNowPage(), 20);
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
	/* 댓글 관련 끝 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
