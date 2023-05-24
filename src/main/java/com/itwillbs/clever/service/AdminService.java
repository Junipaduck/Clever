package com.itwillbs.clever.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.clever.mapper.*;

@Service
public class AdminService {

	@Autowired
	private AdminMapper mapper;
	
	// 관리자 전체 회원 목록 조회
	public List<HashMap<String, String>> selectMember() {
		
		return mapper.selectMember();
	}

	// 관리자 메인 페이지 회원 수 카운트 
	public int selectMemberCount() {
		
		return mapper.selectMemberCount();
	}

		
	}


