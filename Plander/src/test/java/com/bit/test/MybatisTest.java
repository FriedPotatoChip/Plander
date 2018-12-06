package com.bit.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bit.mapper.TestMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MybatisTest {
	
	@Autowired
	private TestMapper mapper;
	
	@Test
	public void testList() {
		
		mapper.getTestList().forEach(test -> log.info(test));
		
//		mapper2.getTestList().forEach(test -> log.info(test));
		
	}
	
	
}
