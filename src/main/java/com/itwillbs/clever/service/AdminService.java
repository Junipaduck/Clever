package com.itwillbs.clever.service;

import java.util.*;

import org.json.simple.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.clever.mapper.*;

import net.nurigo.java_sdk.api.*;
import net.nurigo.java_sdk.exceptions.*;

@Service
public class AdminService {

	@Autowired
	private AdminMapper mapper;
	
	// 관리자 전체 회원 목록 조회
	public List<HashMap<String, String>> selectMember() {
		
		return mapper.selectMember();
	}

	// 관리자 메인 페이지 회원 수 카운트 
	public int selectMemberCount() {
		
		return mapper.selectMemberCount();
	}

	public void certifiedPhoneNumber(String phone, int randomNumber) {
		String api_key = "NCSSDWHWSV57OMLH";
	    String api_secret = "P4ZOPC9S0JKJZ6GBLUIW6QXWDHR1GCBQ";
	    Message  coolsms = new Message(api_key, api_secret);

	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phone);    // 수신전화번호
	    params.put("from", "01023645593");    // 발신전화번호
	    params.put("type", "SMS");
	    params.put("text", "[Clever] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); 
	    
		try {
			JSONObject object = coolsms.send(params);
			System.out.println("확인~~~~~~~~~~~~~~~~~~~~ " + object.toString());
		} catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
		}
		
	}

		
	}


