package com.itwillbs.clever.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.itwillbs.clever.vo.*;

public interface BankMapper {
	
	// 토큰 정보 저장
	int insertToken(@Param("id") String id, @Param("token") ResponseTokenVO responseToken);

	// 계좌 인증 상태 변경
	int updateAccountAuthStatus(String id);

	// 계좌 정보 조회
	AccountVO selectAccount(String id);

	// 포인트 적립
	int updateMemberPoint(@Param("id") String id, @Param("charge_point") int charge_point, @Param("account_amt") int account_amt);

	// 멤버 잔액 조회 
	MemberVO selectMemberInfo(String id);

	int insertPointHistory(Map<String, String> map);

}
