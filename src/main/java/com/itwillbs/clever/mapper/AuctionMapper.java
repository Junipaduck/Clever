package com.itwillbs.clever.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

public interface AuctionMapper {

	int insertAutcion(@Param("map") Map<String, String> map, @Param("id") String id);

	List selectImminent();

	List selectHotList();

	List selectCurrent();

	Object selectMax();

	List selectFiles();
	
	Map<String, String> selectDetailList(int auction_idx);

	List selectProductSearch(String auction_search);

	List selectMemberSearch(String auction_search);

	List getProductList(String param);

	String getBigCategory(String param);

	List getMidCategory(String param);

	List getSmallCategory(String param);

	List getBigCategorys();

	List getMidCategorys(String param);

	List getSmallCategorys(String param);

	List selectFilesIdx(int auction_idx);
	
	void updatePrice(@Param("auction_idx") int auction_idx, @Param("auction_final_price") int auction_final_price);

	int detailModify(Map<String, String> map);

	int readCountUp(int auction_idx);

	int dibsCount(int auction_idx);

	int deleteAution(int auction_idx);

	int deleteAutionFile(int auction_idx);

	void updateConfirmed(@Param("buyer_id") String buyer_id, @Param("auction_idx")int auction_idx);

	HashMap<String, String> selectAcution(int auctionIdx);

	void updateDate(@Param("auctionIdx")int auctionIdx, @Param("chatId")String chatId);

}
