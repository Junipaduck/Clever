package com.itwillbs.clever.service;

import java.util.*;

import org.json.*;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.clever.mapper.*;
import com.itwillbs.clever.vo.*;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.*;
import net.nurigo.sdk.message.model.*;

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

	// 회원가입 휴대폰 인증 
	public void authPhoneNumber(String member_phone, int randomAuthNumber) {
		
		String api_key = "NCSSDWHWSV57OMLH";
		String api_secret = "P4ZOPC9S0JKJZ6GBLUIW6QXWDHR1GCBQ";
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", member_phone); // 수신자
		params.put("from", "01023645593"); // 발신자
		params.put("type", "SMS");
		params.put("text", "클레버(Clever) 회원가입 인증 번호는" +  " [ " + randomAuthNumber + " ] " +  "입니다. ");
	    params.put("app_version", "test app 1.2"); 

	    try {
			JSONObject object = (JSONObject)coolsms.send(params);
			System.out.println(object.toString());
		} catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
		}
		
		
	}

}
