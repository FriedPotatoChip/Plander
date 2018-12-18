package com.bit.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class SeatsCategoryVO {
	private int sct_idx, maximum;
	private String sct_name;

}
