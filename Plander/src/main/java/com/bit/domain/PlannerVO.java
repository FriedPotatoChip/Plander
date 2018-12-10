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
	
	//전체목록 작성자보기
	private String name;
	//조회수 좋아요 증가 
	private int hit, good;
	
	//검색
	private String keyword;
	
}
