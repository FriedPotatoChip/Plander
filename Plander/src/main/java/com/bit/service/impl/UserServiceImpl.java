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
	
	//로그인
	@Override
	public UserVO getUser(UserVO vo) {
		System.out.println("userImpl : login 까지 옴!");
		return userMapper.getUser(vo);
	}
	
	//관리자 확인
	@Override
	public UserVO userchk(UserVO vo) {
		System.out.println("userImpl : userchk 까지 옴!");
		return userMapper.userchk(vo);
	}
	
	//회원가입
	@Override
	public int join(UserVO vo) {
		System.out.println("userImpl : join 까지 옴!");
		return userMapper.join(vo);
	}
	
	//회원가입 아이디 중복체크
	@Override
	public int idchk(UserVO vo) {
		System.out.println("아이디 중복체크 Impl : " + vo);
		return userMapper.idchk(vo);
	}
	
	//아이디 찾기
	@Override
	public UserVO findId(UserVO vo) {
		System.out.println("아이디 찾기 Impl");
		return userMapper.findId(vo);
	}
	
	//비밀번호 찾기
	@Override
	public UserVO findPw(UserVO vo) {
		System.out.println("비밀번호 찾기 Impl");
		return userMapper.findPw(vo);
	}

	
}
