package com.itwillbs.clever.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.clever.mapper.MemberMapper;
import com.itwillbs.clever.vo.MemberVO;


@Service
public class MemberService {

	@Autowired
	private MemberMapper mapper;

	public boolean loginSuccess(MemberVO member) {
		return mapper.loginSuccess(member);
	}
	
	
}
