package com.bit.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ask")
public class AskController {

	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping("")
	public String ask() {
		return "ask/ask";
	}

	@GetMapping("mail")
	public String mail() {
		return "ask/mail";
	}

	@RequestMapping("sendMail")
	public String sendMail(HttpServletRequest request) {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println("name: " + name);
		System.out.println("email: " + email);
		System.out.println("category: " + category);
		System.out.println("title: " + title);
		System.out.println("content: " + content);

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(email); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo("tutlestudy@gmail.com"); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText("보내는 사람: " + name + ", 이메일 주소: " + email + ", 내용: " + content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return "ask/thanks";
	}

}
