package com.bit.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApplyVO {
	
	private int ap_idx, rc_idx;
	private String id;
	private Date ap_regdate;
	
	private String rc_title;
	private Date rc_regdate;
}
