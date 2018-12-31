package com.bit.service;

import com.bit.domain.UsersVO;

public interface LoginService {
	
	public UsersVO chkApi(String api_id);
	
	public boolean insertApi(UsersVO vo);
	
	public UsersVO chkId(UsersVO vo);
	
	public UsersVO login(UsersVO vo);
	
	public boolean signUp(UsersVO vo);
	
	public UsersVO findId(UsersVO vo);

	public UsersVO findPw(UsersVO vo);
	
	public boolean tmpPwd(UsersVO vo);
}
