package com.bit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.UsersVO;
import com.bit.mapper.TestMapper;
import com.bit.service.TestService;

@Service
public class TestServiceImpl implements TestService {

	@Autowired
	private TestMapper mapper;

	@Override
	public UsersVO getTest() {
		return mapper.test();
	}


}
