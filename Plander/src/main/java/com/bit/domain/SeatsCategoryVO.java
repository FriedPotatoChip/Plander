package com.bit.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class SeatsCategoryVO {
	private String sct_idx, sct_name;
	private int maximum;

}
