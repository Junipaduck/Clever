package com.itwillbs.clever.service;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.mail.javamail.*;
import org.springframework.stereotype.*;

@Component
public class MailSendService {

	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber;
	
	public void makeRandomNumber() {
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
	}
	
	public String joinEmail(String email) {
		makeRandomNumber();
		String setFrom = "nongdamyang@gmail.com";
		String toMail = email;
		String title = "이메일 인증 코드 입니다";
		String content = 
				"홈페이지를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
                "<br><br>" + 
			    "인증 번호는 " + authNumber + "입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입	
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	public void mailSend(String setFrom, String toMail, String title, String content) {
		
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}





























































