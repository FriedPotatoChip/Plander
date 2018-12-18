package com.bit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.UsersVO;
import com.bit.mapper.LoginMapper;
import com.bit.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginMapper mapper;
	
	
	@Override
	public UsersVO chkApi(String api_id) {
		return mapper.chkApi(api_id);
	}


	@Override
	public boolean insertApi(UsersVO vo) {
		return mapper.insertApi(vo);
	}


	@Override
	public UsersVO chkId(UsersVO vo) {
		return mapper.chkId(vo);
	}


	@Override
	public UsersVO login(UsersVO vo) {
		return mapper.getUser(vo);
	}

}
