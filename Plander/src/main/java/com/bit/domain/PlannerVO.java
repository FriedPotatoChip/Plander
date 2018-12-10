package com.bit.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class PlannerVO {

	private int p_idx;
	private String p_title;
	private String p_start_date;
	// @DateTimeFormat(pattern = "yyyy-MM-dd")	
	private String p_end_date;
	private Date regdate;
	private int u_idx;
	private int ct_idx;
	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_start_date() {
		return p_start_date;
	}
	public void setP_start_date(String p_start_date) {
		this.p_start_date = p_start_date;
	}
	public String getP_end_date() {
		return p_end_date;
	}
	public void setP_end_date(String p_end_date) {
		this.p_end_date = p_end_date;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getU_idx() {
		return u_idx;
	}
	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}
	public int getCt_idx() {
		return ct_idx;
	}
	public void setCt_idx(int ct_idx) {
		this.ct_idx = ct_idx;
	}
	
	public void setCntPerPage(int pageSize) {
		// TODO Auto-generated method stub
		
	}
	
	public void setStartIndex(int startIndex) {
		// TODO Auto-generated method stub
		
	}
	
	
	//전체목록 작성자보기
	private String name;
	//조회수 좋아요 증가 
	private int hit, good;
	
	//검색
	private String keyword;
	
}
