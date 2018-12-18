package com.bit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.RecruitVO;
import com.bit.mapper.BoardMapper;
import com.bit.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public List<RecruitVO> getList() {
		return mapper.getList();
	}

}
