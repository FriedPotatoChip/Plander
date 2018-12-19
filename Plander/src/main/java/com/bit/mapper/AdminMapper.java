package com.bit.mapper;

import java.util.List;

import com.bit.domain.BookingCbVO;
import com.bit.domain.UsersVO;

public interface AdminMapper {
	
	public List<UsersVO> getUserList();
	
	public List<BookingCbVO> bookingCabinet(BookingCbVO bcvo);
	
	public int bookingCabinet_count(BookingCbVO bcvo);
}
