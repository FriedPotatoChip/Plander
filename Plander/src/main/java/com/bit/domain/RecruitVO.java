package com.bit.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class RecruitVO {
	private String rc_title, rc_content, id;
	private int rc_idx, cur_mem, max_mem;
	private Date rc_regdate;

}
