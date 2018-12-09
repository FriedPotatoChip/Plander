package com.bit.service.impl;

import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.UserVO;
import com.bit.mapper.UserMapper;
import com.bit.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	//로그인
	@Override
	public UserVO getUser(UserVO vo) {
		System.out.println("userImpl : login 까지옴!");
		return userMapper.getUser(vo);
	}
	
	//회원가입
	@Override
	public UserVO join(UserVO vo) {
		System.out.println("userImpl : join 까지옴!");
		return userMapper.join(vo);
	}
	
	//회원가입 아이디 중복체크
	@Override
	public int idchk(UserVO vo) {
		System.out.println("아이디 중복체크 Impl : " + vo);
		return userMapper.idchk(vo);
	}

}
