package com.bit.mapper;

import java.util.List;
import java.util.Map;

import com.bit.domain.BookingCbVO;
import com.bit.domain.BookingVO;
import com.bit.domain.DateTimeVO;
import com.bit.domain.RecvMsgVO;
import com.bit.domain.SendMsgVO;
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
	
	//좌석별 예약현황
	public List<BookingVO> BookingSeats(BookingVO bvo);
	
	//좌석이동
	public int changeSeats(Map<String, Object> map);
	
	// 보낸쪽지 갯수
	public int sendMsgCnt(UsersVO vo);
	
	// 보낸쪽지
	public List<SendMsgVO> sendMsg(Map map);
	
	// 받은쪽지 갯수
	public int recvMsgCnt(UsersVO vo);
	
	// 받은쪽지
	public List<RecvMsgVO> recvMsg(Map map);
	
	//결제내역
	public List<BookingVO> receiptList(PagingVO page);
	
	//결제페이지 검색
	public List<BookingVO> getListSearch(Map<String, Object> map);
	
	//결제페이지 검색 후 결과
	public int getTotalSearch(Map<String, Object> map);
}
