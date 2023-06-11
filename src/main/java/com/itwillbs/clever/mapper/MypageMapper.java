package com.itwillbs.clever.mapper;

import java.util.HashMap;
import java.util.List;

public interface MypageMapper {

	List<HashMap<String, String>> selectProductSellList(String sId);

	List<HashMap<String, String>> selectProductSellDate(String sId);

	List<HashMap<String, String>> selectProductBuyList(String sId);

	List<HashMap<String, String>> selectProductDibsList(String sId);

	List<HashMap<String, String>> selectAutionDibsList(String sId);

	List<HashMap<String, String>> selectAuctionFile();
	
	// 굿즈 구매 내역 조회
	List<HashMap<String, String>> selectGoodsList(String sId);


	
}
