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
	
	// 관리자 메인 화면 신고 수 카운트
	int selectReportCount();

	// 경매 등록 승인
	int updateAuthStatus(int auction_idx);

	List<HashMap<String, String>> selectAuctionAuthList();

	
	// 관리자 정보 조회
	HashMap<String, String> selectAdminInfo();

	// 신고 목록 조회
	List<HashMap<String, String>> selectReportList();

	// 신고 카운트 조회
	List<HashMap<String, String>> selectReportProList();

	// 신고 처리
	int deleteProduct(int product_idx);

	// 1:1 문의 조회
	List<HashMap<String, String>> selectAskList();

	List<HashMap<String, String>> selectProductList();

	// 옥션 파일 조회
	List<HashMap<String, String>> selectAuctionFile();





}
