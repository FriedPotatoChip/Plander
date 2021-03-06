package com.bit.mapper;

import com.bit.domain.UsersVO;

public interface LoginMapper {

	
	public UsersVO chkApi(String api_id);	
	
	public boolean insertApi(UsersVO vo);
	
	public UsersVO chkId(UsersVO vo);
	
	public UsersVO getUser(UsersVO vo);
	
	public boolean insertUser(UsersVO vo);
	
	public UsersVO findId(UsersVO vo);

	public UsersVO findPw(UsersVO vo);
	
	public boolean tmpPwd(UsersVO vo);
}
