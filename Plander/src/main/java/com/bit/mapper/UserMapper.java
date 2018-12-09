package com.bit.mapper;

import com.bit.domain.UserVO;

public interface UserMapper {
	
	public UserVO getUser(UserVO vo);
	
	public UserVO join(UserVO vo);
	public int idchk(UserVO vo);
	
}
