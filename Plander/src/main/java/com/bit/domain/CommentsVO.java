package com.bit.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class CommentsVO {
	private int c_idx, b_idx, rp_idx, rc_idx, level, del;
	private String c_content, id;
	private Date c_regdate;
}
