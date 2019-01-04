package com.bit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.BookingCbVO;
import com.bit.domain.BookingVO;
import com.bit.domain.DateTimeVO;
import com.bit.domain.UsersVO;
import com.bit.mapper.AdminMapper;
import com.bit.service.adminService;
import com.bit.utils.PagingVO;

@Service
public class AdminServiceImpl implements adminService {

	@Autowired
	private AdminMapper mapper;

	//페이징 처리 후 회원 조회
	@Override
	public List<UsersVO> getUserList(PagingVO page) {
		return mapper.getUserList(page);
	}

	//예약된 사물함 조회
	@Override
	public List<BookingCbVO> bookingCabinet(BookingCbVO bcvo) {
		return mapper.bookingCabinet(bcvo);
	}

	//예약된 사물함 수
	@Override
	public int bookingCabinet_count(BookingCbVO bcvo) {
		return mapper.bookingCabinet_count(bcvo);
	}

	//아직
	@Override
	public List<DateTimeVO> DateTime() {
		return mapper.DateTime();
	}
	
	//총 회원 수
	@Override
	public int getTotal() {
		return mapper.getTotal();
	}

	//검색 조회
	@Override
	public List<UsersVO> getSearchList(Map<String, Object> map) {
		return mapper.getSearchList(map);
	}

	//검색 후 회원 수
	@Override
	public int getSearchTotal(Map<String, Object> map) {
		return mapper.getSearchTotal(map);
	}

	//회원 삭제
	@Override
	public int userDelete(int u_idx) {
		return mapper.userDelete(u_idx);
	}
	
	//좌석별 예약현황
	@Override
	public List<BookingVO> BookingSeats(BookingVO bvo) {
		return mapper.BookingSeats(bvo);
	}


}
