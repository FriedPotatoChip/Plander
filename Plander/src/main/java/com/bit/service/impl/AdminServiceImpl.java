package com.bit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.BookingCbVO;
import com.bit.domain.BookingVO;
import com.bit.domain.DateTimeVO;
import com.bit.domain.UsersVO;
import com.bit.mapper.AdminMapper;
import com.bit.service.adminService;

@Service
public class AdminServiceImpl implements adminService {

	@Autowired
	private AdminMapper mapper;

	@Override
	public List<UsersVO> getUserList(UsersVO vo) {
		return mapper.getUserList();
	}

	@Override
	public List<BookingCbVO> bookingCabinet(BookingCbVO bcvo) {
		return mapper.bookingCabinet(bcvo);
	}

	@Override
	public int bookingCabinet_count(BookingCbVO bcvo) {
		return mapper.bookingCabinet_count(bcvo);
	}

	@Override
	public List<DateTimeVO> DateTime() {
		return mapper.DateTime();
	}
	
	@Override
	public int getTotal() {
		return mapper.getTotal();
	}


}
