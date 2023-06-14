package com.itwillbs.clever.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.clever.mapper.*;
import com.itwillbs.clever.vo.*;

@Service
public class BankService {
	@Autowired
	private BankMapper mapper;
	
	// 토큰 정보 저장
	public int writeToken(String id, ResponseTokenVO responseToken) {
		// 토큰 정보 저장 요청
		int insertCount = mapper.insertToken(id, responseToken);
		if(insertCount > 0) { // 토큰 정보 저장 성공 시
			// 계좌 인증 상태 변경 요청
			return mapper.updateAccountAuthStatus(id); 
		} else {
			return 0;
		}
	}

	// 계좌 정보 조회
	public AccountVO getAccount(String id) {
		return mapper.selectAccount(id);
	}

	// 포인트 적립
	public int updateMemberPoint(String id, int point, int account_amt) {
		
		return mapper.updateMemberPoint(id, point, account_amt);
	}

	// 멤버 잔액 조회
	public MemberVO getMemberInfo(String id) {
		
		return mapper.selectMemberInfo(id);
	}

	// 포인트 히스토리
	public int insertPointHistory(Map<String, String> map) {
		
		System.out.println("map~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" + map);
		
		return mapper.insertPointHistory(map);
	}

	// admin balance 업데이트
	public int updateAdminBalance(int charge_point) {
		
		return mapper.updateAdminBalance(charge_point);
	}

	// 관리자 잔액 조회
	public MemberVO getAdminInfo(String id) {
		
		return mapper.getAdminInfo(id);
	}

	// 세션 아이디 포인트 조회
	public MemberVO getMemberPoint(String id) {
		
		return mapper.selectMemberPoint(id);
	}


	
}















