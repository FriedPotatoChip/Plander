package com.bit.service;

import com.bit.domain.UserVO;

public interface UserService {
	
	//로그인
	public UserVO getUser(UserVO vo);
	
	//회원가입
	public int join(UserVO vo);
	//회원가입 아이디 중복체크
	public int idchk(UserVO vo);
	
}
