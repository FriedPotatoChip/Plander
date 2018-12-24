package com.bit.service;

import java.util.List;

import com.bit.domain.BookingCbVO;
import com.bit.domain.BookingVO;
import com.bit.domain.DateTimeVO;
import com.bit.domain.UsersVO;

public interface adminService {
	
	public int getTotal();
	
	public List<UsersVO> getUserList(UsersVO vo);
	
	public List<BookingCbVO> bookingCabinet(BookingCbVO bcvo);
	
	public int bookingCabinet_count(BookingCbVO bcvo);
	
	public List<DateTimeVO> DateTime();
}
