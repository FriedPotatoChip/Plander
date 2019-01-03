package com.bit.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class PriceVO {
	private int pr_idx, price, sct_idx, time_idx;
	private String pr_name;

}
