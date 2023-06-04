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

}





















































