package com.bit.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class UserVO {
	private int u_idx, rank;
	private String id, password, name, email, address;
	private Date regdate;
}
