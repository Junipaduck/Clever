package com.itwillbs.clever.mapper;

import com.itwillbs.clever.vo.MemberVO;

public interface MemberMapper {

	//회원가입
	int insertMember(MemberVO member);
	
	boolean loginSuccess(MemberVO member);

}
