package com.itwillbs.clever.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.clever.mapper.*;
import com.itwillbs.clever.vo.*;

@Service
public class AdminService {

	@Autowired
	private AdminMapper mapper;
	
	public List<MemberVO> selectMember() {
		
		return mapper.selectMember();
	}

	public int selectMemberCount() {
		
		return mapper.selectMemberCount();
	}

}
