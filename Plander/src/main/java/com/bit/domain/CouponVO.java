package com.bit.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CouponVO {
	
	private int cp_idx;
	private int cb_idx;
	private String id;
	private Date cp_regdate;
	private Date cp_enddate;
	private int cp_quantity;
	
	private String cb_name, cb_distype, cb_roomtype;
	private int cb_discount;
	
}
