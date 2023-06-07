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
	
}
