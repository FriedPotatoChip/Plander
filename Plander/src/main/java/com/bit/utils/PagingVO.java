package com.bit.utils;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PagingVO {
	
/*
	현재 페이지
	페이지 당 보여줄 글 갯수
	전체 글 갯수
	
	보여줄 페이지 갯수
	
	시작페이지
	끝페이지
	
	맨 마지막 페이지
	
	보여줄 글 시작 로우넘
	보여줄 글 끝 로우넘
	
	boolean chk끝페이지 	
	boolean chk시작페이지 	

	1 2 3 4 5	10개 5개
	끝페이지: (올림 (현재페이지 / 페이지갯수)) * 페이지갯수
	시작페이지: 끝페이지 - 페이지갯수 + 1  

	start: 1~10 11~20 21~30 ... 
	end: 현재페이지 * 페이지당 보여줄 글 갯수
	start: end - 페이지당 보여줄 글 갯수 + 1
	
	마지막 페이지: 올림(전체 글갯수 / 페이지당 글 갯수)
	
	if(끝페이지 > 마지막 페이지){
		끝페이지 = 마지막 페이지
	}
	if (시작페이지 = 1){
		chk시작페이지 = false;
	}
	if (끝페이지 = 마지막페이지){
		chk끝페이지 = false;
	}
	
*/	
	
	private int nowPage = 1;
	private int cntPerPage;
	private int total;
	private int cntPage;
	private int startPage;
	private int endPage;
	private int lastPage;
	private int start;
	private int end;
	private boolean chkStartPage;
	private boolean chkEndPage;
	
	public PagingVO(){
		setNowPage(1);
		setCntPerPage(10);
		setCntPage(5);
		setTotal(100);
	}
	
	public PagingVO(int total) {
		setTotal(total);
		setNowPage(1);
		setCntPerPage(10);
		setCntPage(5);
	}
	
	public PagingVO(int nowPage, int cntPerPage, int total) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setCntPage(5);
		setTotal(total);
	}
	
	public PagingVO(int nowPage, int total) {
		setNowPage(nowPage);
		setCntPage(5);
		setTotal(total);
	}
	
	public void CalcPage(int nowPage, int cntPerPage) {
		
		boolean chkSP = true;
		boolean chkEP = true;
		int endP = (int)Math.ceil((double)nowPage / (double)this.cntPage) * getCntPage();
		this.startPage = endP - this.cntPage + 1;
		
		this.end = nowPage * cntPerPage;
		this.start = end - cntPerPage + 1;
		
		this.lastPage = (int) Math.ceil((double)total / (double)cntPerPage);
		
		if (endP > lastPage) {
			endP = lastPage;
		}
		if (startPage == 1) {
			chkSP = false;
		}
		if (endP == lastPage) {
			chkEP = false;
		}
		setEndPage(endP);
		setChkStartPage(chkSP);
		setChkEndPage(chkEP);
	}
	
	public void CalcPage(int nowPage) {
		
		boolean chkSP = true;
		boolean chkEP = true;
		int endP = (int)Math.ceil((double)nowPage / (double)this.cntPage) * getCntPage();
		this.startPage = endP - this.cntPage + 1;
		cntPerPage = 3;
		
		this.end = nowPage * cntPerPage;
		this.start = end - cntPerPage + 1;
		
		this.lastPage = (int) Math.ceil((double)total / (double)cntPerPage);
		
		if (endP > lastPage) {
			endP = lastPage;
		}
		if (startPage == 1) {
			chkSP = false;
		}
		if (endP == lastPage) {
			chkEP = false;
		}
		setEndPage(endP);
		setChkStartPage(chkSP);
		setChkEndPage(chkEP);
	}
	
	
	
}
