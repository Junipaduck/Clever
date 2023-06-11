package com.itwillbs.clever.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.clever.mapper.MypageMapper;

@Service
public class MypageService {
	
	@Autowired
	private MypageMapper mapper;

	// 중고거래 판매내역 조회
	public List<HashMap<String, String>> selectOnSaleProduct(String sId) {
		return mapper.selectOnSaleProduct(sId);
	}
	
	// 중고거래 구매내역 조회
	public List<HashMap<String, String>> selectProductBuyList(String sId) {
		return mapper.selectProductBuyList(sId);
	}
	
	// 경매 찜 조회
//	public List<HashMap<String, String>> selectAutionDibs(String sId) {
//		return mapper.selectAutionDibs(sId);
//	}

	public List<HashMap<String, String>> selectDibsList(String sId) {
		return mapper.selectDibsList(sId);
	}

	// 굿즈 구매 내역
	public List<HashMap<String, String>> selectGoodsList(String sId) {
		
		return mapper.selectGoodsList(sId);
	}

	
}
