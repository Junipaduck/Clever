package com.itwillbs.clever.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.clever.mapper.*;
import com.itwillbs.clever.vo.MemberVO;

@Service
public class CommunityService {
	@Autowired
	private CommunityMapper mapper;
	
	
	public int insertCommunity(Map<String, String> map, String id) {
		return mapper.insertCommunity(map,id);
	}


	public List communityList() {
		return mapper.communityList();
	}


	public List selectDetail(String community_idx) {
		return mapper.selectDetail(community_idx);
	}


	public int insertTinyReplyCommunity(Map<String, String> map) {
		return mapper.insertTinyReplyCommunity(map);
	}


	public List getTinyReplyCommunityList(String community_idx) {
		return mapper.getTinyReplyCommunityList(community_idx);
	}


	public int registTinyReReplyCommunity(Map<String, String> map) {
		return mapper.registTinyReReplyCommunity(map);
	}


	public int deleteTinyReplyCommunity(Map<String, String> map) {
		return mapper.deleteTinyReplyCommunity(map);
	}


	public int readcountUp(String community_idx) {
		return mapper.readcountUp(community_idx);
	}


	public int communityModify(Map<String, String> map) {
		return mapper.communityModify(map);
	}


	public int communityDelete(Map<String, String> map) {
		mapper.communityTinyDelete(map);
		return mapper.communityDelete(map);
	}


	public List communityAuctionList() {
		return mapper.communityAuctionList();
	}


	// 글 작성시 포인트 적립
	public int getMemberPoint(String id) {
		
		return mapper.updateMemberPoint(id);
	}

}
