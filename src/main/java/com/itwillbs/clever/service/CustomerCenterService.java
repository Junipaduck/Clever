package com.itwillbs.clever.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.clever.mapper.CustomerCenterMapper;

@Service
public class CustomerCenterService {

	@Autowired
	private CustomerCenterMapper mapper;
	
	// 자주묻는질문 카테고리
	public List FAQcategory(String param) {
		return mapper.FAQcategory(param);
	}

	// 자주묻는질문 list 조회
	public List FAQlist(int FAQ_idx) {
		return mapper.FAQlist(FAQ_idx);
	}

	// 자주묻는질문 관리자 글 insert
	public int insertFAQ(Map<String, String> map) {
		return mapper.insertFAQ(map);
	}

	// 1:1 문의 list 조회
	public List<String> myAskedList(String sId) {
		return mapper.myAskedList(sId);
	}
	
	// 1:1 문의 detail 조회
	public List<String> myAskedDetail(int asked_idx) {
		return mapper.myAskedDetail(asked_idx);
	}

	// 1:1 문의 등록
	public int insertAsked(Map<String, String> map) {
		return mapper.insertAsked(map);
	}


}
