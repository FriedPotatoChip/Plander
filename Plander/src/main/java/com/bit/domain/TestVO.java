package com.bit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TestVO {
	
	private String title, writer, content;
	private int seq, cnt;
	private Date regdate;
	
}
