package com.bit.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ReplyVO {
	private int rp_idx, b_idx, rc_idx, c_idx;
	private String rp_content, id;
	private Date rp_regdate;

}
