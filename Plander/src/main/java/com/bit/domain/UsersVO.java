package com.bit.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class UsersVO {
	
	private int u_idx, rank;
	private String id, password, name, address, phone, email, type, api_id;
	private Date regdate;
	
	
}
