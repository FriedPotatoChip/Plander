package com.bit.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BoardVO {
	private int b_idx, u_idx, b_ct;
	private String b_title, b_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date b_regdate;

}
