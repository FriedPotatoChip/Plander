package com.bit.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.SeatsVO;
import com.bit.domain.UsersVO;
import com.bit.mapper.BookMapper;
import com.bit.mapper.MyMapper;
import com.bit.service.BookService;
import com.bit.service.MyService;

@Service
public class MyServiceImpl implements MyService {
	
	@Autowired
	private MyMapper myMapper;

	@Override
	public UsersVO user(String id) {
		UsersVO vo = myMapper.user(id);
		return vo;
	}

}
