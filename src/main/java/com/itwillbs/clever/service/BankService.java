package com.itwillbs.clever.service;

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
	public int updateMemberPoint(String id) {
		
		return mapper.updateMemberPoint(id);
	}
	
}















