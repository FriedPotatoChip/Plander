package com.bit.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class PaymentVO {
	private int p_idx, bk_idx, price, u_idx, bkc_idx;
	private String payment;

}
