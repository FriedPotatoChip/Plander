package com.bit.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BookingCbVO {
	private int ckb_idx, cb_number, cb_idx, br_idx, cabinet;
	private String id;
	private String start_date, end_date, ckb_regdate;

	private String br_name;
}
