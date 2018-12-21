package com.bit.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class UsersVO {

	private int u_idx, rank;
	private String id, password, name, phone, email, type, api_id, zipNo, roadAddrPart1, addrDetail, file_name,
			ori_name;
	private Date regdate;

	// 파일 관련 필드 추가
	private MultipartFile uploadFile;
}
