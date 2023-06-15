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
	
//조회 -----------------------------------------------------------------------------------------------------------------------------	
	
	// 관리자 전체 회원 목록 조회
	public List<HashMap<String, String>> selectMember() {
		
		return mapper.selectMember();
	}
	
	// 관리자 회원 등급 조회
	public List<HashMap<String, String>> selectMemberGrade() {
		return mapper.selectMemberGrade();
	}
	
	// 관리자 경매 목록 조회
	public List<HashMap<String, String>> getAuctionList() {
		
		return mapper.selectAuctionList();
	}
	
//카운트 ---------------------------------------------------------------------------------------------------------------------------
	
	// 관리자 메인 페이지 회원 수 카운트 
	public int getMemberCount() {
		
		return mapper.selectMemberCount();
	}
	
	// 관리자 메인 페이지 등록 상품 수 카운트 
	public int getProductCount() {
		
		return mapper.selectProductCount();
	}
	
	// 관리자 메인 페이지 경매 등록 상품 수 카운트
	public int getAuctionCount() {
		
		return mapper.selectAuctionCount();
	}
	
	
// 인증 -----------------------------------------------------------------------------------------------------------------------------
	
	public void certifiedPhoneNumber(String phone, int randomNumber) {
//		String api_key = "NCSSDWHWSV57OMLH";
//	    String api_secret = "P4ZOPC9S0JKJZ6GBLUIW6QXWDHR1GCBQ";
	    String api_key = "NCS1A41F0IBBCMH3";
	    String api_secret = "PMLW2WP1ZKJECKSRJO23VAZFMI3CODNN";
	    Message  coolsms = new Message(api_key, api_secret);

	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phone);    // 수신전화번호
	    params.put("from", "01048902740");    // 발신전화번호
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

	public int auctionAuth(int auction_idx) {
		
		return mapper.updateAuthStatus(auction_idx);
	}

	public List<HashMap<String, String>> getAuctionAuthList() {
		
		return mapper.selectAuctionAuthList();
	}

	
	// 관리자 정보 조회
	public HashMap<String, String> getAdminInfo() {
		
		return mapper.selectAdminInfo();
	}

	// 관리자 메인 페이지 신고수 카운트
	public int getReportCount() {
		
		return mapper.selectReportCount();
	}

	// 관리자 페이지 신고 목록 조회
	public List<HashMap<String, String>> getReportList() {
		
		return mapper.selectReportList();
	}
	
	// 신고 카운트 조회
	public List<HashMap<String, String>> getReportProList() {
		
		return mapper.selectReportProList();
	}

	// 신고 처리
	public int reportPro(int product_idx) {
		
		return mapper.deleteProduct(product_idx);
	}

	// 1:1 문의 조회
	public List<HashMap<String, String>> getAskList() {
		
		return mapper.selectAskList();
	}

	public List<HashMap<String, String>> getProductList() {
		
		return mapper.selectProductList();
	}

	public List<HashMap<String, String>> selectAuctionFile() {
		
		return mapper.selectAuctionFile();
	}

	// 관리자 메인 페이지 경매 상품 카테고리 차트 조회
	public List<HashMap<String, String>> getAuctionChartList() {
		
		return mapper.selectAuctionChartList();
	}

	// 포인트 입출금 내역 - 메인페이지 limit 걸어 놓음
	public List<HashMap<String, String>> getPointList() {
		
		return mapper.selectPointList();
	}

	// 포인트 입출금 내역 - 입출금내역 페이지
	public List<HashMap<String, String>> selectPointList() {
		
		return mapper.selectAdminPointList();
	}

	// 개인회원 입출금 내역 
	public List<HashMap<String, String>> getMemberAccountList() {
		
		return mapper.selectMemberAccountList();
	}

	// 회원 등급 산정을 위한 카운트 조회
	public List<HashMap<String, String>> selectCountList() {
		
		return mapper.selectCountList();
	}

	// 등업
	public int updateGrade(String member_id) {
		
		return mapper.memberGradeUpdate(member_id);
	}

		
	}


