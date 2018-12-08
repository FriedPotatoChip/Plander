package com.bit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.UserVO;
import com.bit.mapper.UserMapper;
import com.bit.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public UserVO getUser(UserVO vo) {
		System.out.println("userImpl 까지옴!");
		return userMapper.getUser(vo);
	}
	
	public int loginchk(UserVO vo) {
		return 0;
	}

}
