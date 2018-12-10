package com.bit.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class CommentsVO {
	private int c_idx, p_idx, b_idx;
	private String c_content, u_idx;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date c_regdate;
	
	private String p_title;
	private int ct_idx;
}
