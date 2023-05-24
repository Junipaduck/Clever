package com.itwillbs.clever.mapper;

import com.itwillbs.clever.vo.MemberVO;

public interface MemberMapper {

	int insertMember(MemberVO member);
	
	boolean isSuccessMember(MemberVO member);

	String getPasswd(MemberVO member);

}
