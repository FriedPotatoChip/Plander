package com.bit.service;

import com.bit.domain.UserVO;

public interface UserService {
	
	//로그인 정보
	public UserVO getUser(UserVO vo);
	
}