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

	List<HashMap<String, String>> selectReportList(String sId);

	List<HashMap<String, String>> selectMemberGrade(String sId);

	int insertReview(Map<String, String> map);

	List<HashMap<String, String>> selectReviewCheck(String sId);
	
	List<HashMap<String, String>> selectAuctionDetail(int auction_idx);
	
	Object selectMemberInfo(String sId);

	int updateAuctionStatus(int auction_idx);

	int updateMemAdMoney(@Param("sId") String sId, @Param("auction_final_price") int auction_final_price);

	int buyerWithdraw(@Param("sId") String sId, @Param("auction_final_price") int auction_final_price);

	int depositAdMoney(@Param("sId") String sId, @Param("auction_final_price") int auction_final_price);

	Map<String, String> selectByInfo(int auction_idx);

	int insertBuyAuction(@Param("selectByInfo") Map<String, String> selectByInfo, @Param("sId") String sId);

	int withdrawAdMoney(@Param("auction_buy_price") String auction_buy_price, @Param("auction_buy_seller") String auction_buy_seller);

	int buyerDeposit(@Param("auction_buy_price") String auction_buy_price, @Param("auction_buy_seller") String auction_buy_seller);

	int updateStatus(String auction_idx);

	int updateAStatus(String auction_idx);

	List<HashMap<String, String>> selectGoodsFile();

	int deletePDibs(@Param("sId")String sId, @Param("type_num") int type_num);

	int deleteADibs(@Param("sId")String sId, @Param("type_num") int type_num);

}
