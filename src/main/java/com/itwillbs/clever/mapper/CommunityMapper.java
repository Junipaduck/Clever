package com.itwillbs.clever.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

public interface CommunityMapper {

	int insertCommunity(@Param("map") Map<String, String> map,@Param("id") String id);

	List communityList();

	List selectDetail(String community_idx);

	int insertTinyReplyCommunity(@Param("map") Map<String, String> map);

	List getTinyReplyCommunityList(String community_idx);

	int registTinyReReplyCommunity(@Param("map") Map<String, String> map);

	int deleteTinyReplyCommunity(@Param("map") Map<String, String> map);

	int readcountUp(String community_idx);

	int communityModify(@Param("map") Map<String, String> map);

	int communityDelete(@Param("map") Map<String, String> map);
	int communityTinyDelete(@Param("map") Map<String, String> map);

	List communityAuctionList();
	

}
