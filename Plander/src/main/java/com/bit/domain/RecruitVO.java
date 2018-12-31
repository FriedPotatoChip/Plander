package com.bit.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class RecruitVO {
	private String rc_title, rc_content, id, user_profileImagePath;
	private int rc_idx, cur_mem, max_mem, hit, cnt;
	private Date rc_regdate;
}
