package com.bit.mapper;

import com.bit.domain.UserVO;

public interface UserMapper {
	
	//로그인
	public UserVO getUser(UserVO vo);
	
	//회원가입
	public int join(UserVO vo);
	//회원가입 아이디 중복체크
	public int idchk(UserVO vo);
	
	
}
