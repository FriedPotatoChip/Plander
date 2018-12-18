package com.bit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.UsersVO;
import com.bit.mapper.AdminMapper;
import com.bit.service.adminService;

@Service
public class AdminServiceImpl implements adminService {

	@Autowired
	private AdminMapper mapper;

	@Override
	public List<UsersVO> getUserList(UsersVO vo) {
		return mapper.getUserList();
	}


}
