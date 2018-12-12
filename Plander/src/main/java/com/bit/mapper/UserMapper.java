package com.bit.mapper;

import com.bit.domain.UserVO;

public interface UserMapper {
	
	//로그인
	public UserVO getUser(UserVO vo);
	//관리자 확인 
	public UserVO userchk(UserVO vo);
	
	//회원가입
	public int join(UserVO vo);
	//회원가입 아이디 중복체크
	public int idchk(UserVO vo);
	
	//아이디 찾기
	public UserVO findId(UserVO vo);
	//비밀번호 찾기 
	public UserVO findPw(UserVO vo);
	
}
