package com.itwillbs.clever.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface MypageMapper {

	List<HashMap<String, String>> selectProductSellList(String sId);

	List<HashMap<String, String>> selectProductSellDate(String sId);

	List<HashMap<String, String>> selectProductBuyList(String sId);

	List<HashMap<String, String>> selectProductDibsList(String sId);

	List<HashMap<String, String>> selectAuctionList(String sId);

	List<HashMap<String, String>> selectAuctionBidList(String sId);

	List<HashMap<String, String>> selectAutionDibsList(String sId);

	List<HashMap<String, String>> selectAuctionFile();
	
	// 굿즈 구매 내역 조회
	List<HashMap<String, String>> selectGoodsList(String sId);

	int updateAuctionStatus(int auction_idx);

	int buyerWithdraw(@Param("sId") String sId, @Param("auction_final_price") int auction_final_price);

	int depositAdMoney(@Param("sId") String sId, @Param("auction_final_price") int auction_final_price);

	int withdrawAdMoney(@Param("auction_final_price") String auction_final_price, @Param("member_id") String member_id);

	int buyerDeposit(@Param("auction_final_price") String auction_final_price, @Param("member_id") String member_id);

	int updateMemAdMoney(@Param("sId") String sId, @Param("auction_final_price") int auction_final_price);

	List<HashMap<String, String>> selectReportList(String sId);

	List<HashMap<String, String>> selectDWHistory(String sId);

	List<HashMap<String, String>> selectMemberGrade(String sId);

	int insertReview(Map<String, String> map);

	List<HashMap<String, String>> selectReviewCheck(String sId);
	
}
