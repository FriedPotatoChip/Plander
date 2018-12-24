package com.bit.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BoardVO {
	private int b_idx, ct_idx, cnt, hit;
	private String b_title, b_content, id;
	private Date b_regdate;
}
