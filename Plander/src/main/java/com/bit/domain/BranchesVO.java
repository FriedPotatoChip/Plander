package com.bit.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BranchesVO {
	private int br_idx, br_lat, br_lng;
	private String br_name, br_location, br_phone;

}
