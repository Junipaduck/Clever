package com.itwillbs.clever.mapper;

import java.util.*;

import com.itwillbs.clever.vo.*;

public interface GoodsMapper {

	int insertGoods(GoodsVO goods);

	int selectMax();

	List<HashMap<String, String>> selectGoodsList();

	// 굿즈 수정용 조회
	HashMap<String, String> selectGoods(int goods_idx);
	
	// 굿즈 수정
	int updateGoods(GoodsVO goods);

	// 관리자 굿즈 페이지 굿즈 이미지 조회
	List<HashMap<String, String>> selectFile();

	// 굿즈 파일 삭제
	int deleteGoodsFile(FileVO file);

	// 굿즈 파일 셀렉트
	List<HashMap<String, String>> selectGoodsFiles();

	// 굿즈 상세페이지
	List<HashMap<String, String>> selectGoodsDetail(int goods_idx);

	// 굿즈 파일 전체 셀렉트
	List<HashMap<String, String>> selectFiles();

	// 결제창 멤버 정보 조회
	MemberVO selectMemberInfo(String id);

	// 굿즈 결제 처리
	int buyGoods(String id);

	// 굿즈 가격 조회
	GoodsVO selectGoodsPrice(int goods_idx);


}





















































