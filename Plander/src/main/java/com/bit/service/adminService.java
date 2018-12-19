package com.bit.service;

import java.util.List;

import com.bit.domain.UsersVO;

public interface adminService {
	
	public List<UsersVO> getUserList(UsersVO vo);
	
}
