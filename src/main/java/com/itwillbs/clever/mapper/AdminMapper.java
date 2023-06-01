package com.itwillbs.clever.mapper;

import java.util.*;

import com.itwillbs.clever.vo.*;

public interface AdminMapper {

	// 관리자 페이지 전체 회원 목록 조회
	List<HashMap<String, String>> selectMember();

	// 관리자 페이지 전체 경매 목록 조회
	List<HashMap<String, String>> selectAuctionList();
	
	// 관리자 메인 화면 회원 수 카운트
	int selectMemberCount();

	// 관리자 메인 화면 상품 수 카운트
	int selectProductCount();

	// 관리자 메인 화면 경매 수 카운트
	int selectAuctionCount();

	// 경매 등록 승인
	int updateAuthStatus(int auction_idx);

	List<HashMap<String, String>> selectAuctionAuthList();

	
	// 관리자 정보 조회
	HashMap<String, String> selectAdminInfo();


}
