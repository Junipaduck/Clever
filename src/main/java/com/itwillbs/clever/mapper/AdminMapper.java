package com.itwillbs.clever.mapper;

import java.util.*;

import com.itwillbs.clever.vo.*;

public interface AdminMapper {

	// 관리자 페이지 전체 회원 목록 조회
	List<HashMap<String, String>> selectMember();

	// 관리자 메인 화면 회원 수 카운트
	int selectMemberCount();

	// 관리자 메인 화면 상품 수 카운트
	int selectProductCount();

}
