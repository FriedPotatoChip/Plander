package com.bit.mapper;

import java.util.List;
import java.util.Map;

import com.bit.domain.BookingCbVO;
import com.bit.domain.DateTimeVO;
import com.bit.domain.UsersVO;
import com.bit.utils.PagingVO;

public interface AdminMapper {
	
	// 페이징 처리 후 회원조회
	public List<UsersVO> getUserList(PagingVO page);
	
	// 총 회원 수
	public int getTotal();
	
	// 예약된 사물함 조회
	public List<BookingCbVO> bookingCabinet(BookingCbVO bcvo);
	
	// 예약된 사물함 수
	public int bookingCabinet_count(BookingCbVO bcvo);
	
	// (검색) 조회
	public List<UsersVO> getSearchList(Map<String,Object> map);
	
	// (검색) 회원 총 수
	public int getSearchTotal(Map<String, Object> map);
	
	//아직 미정
	public List<DateTimeVO> DateTime();
	
	//회원 삭제
	public int userDelete(int u_idx);
	
}
