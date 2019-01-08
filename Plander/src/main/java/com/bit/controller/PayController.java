package com.bit.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bit.domain.BookingCbVO;
import com.bit.domain.BookingVO;
import com.bit.domain.CabinetVO;
import com.bit.domain.SeatsVO;
import com.bit.domain.UsersVO;
import com.bit.service.BookService;

@Controller
@SessionAttributes("usersVO")
@RequestMapping("/TMS/payment")
public class PayController {

//	@Autowired
//	private BookService bookService;

	@RequestMapping("/naverPay")
	public String payment() {
		System.out.println("페이지 이동 확인");
		return "/pay/naverPay";
	}

}
