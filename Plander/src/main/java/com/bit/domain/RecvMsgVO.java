package com.bit.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class RecvMsgVO {
	
	private int rm_idx, chk;
	private String send_id, recv_id, title, content;
	private Date regdate;
}
