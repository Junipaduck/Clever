package com.itwillbs.clever.mapper;

import java.util.HashMap;

import com.itwillbs.clever.vo.MemberVO;

public interface MemberMapper {

	int insertMember(MemberVO member);
	
	boolean isSuccessMember(MemberVO member);

	String getPasswd(MemberVO member);

	MemberVO selectMember(String sId);

	HashMap<String, String> selectModifyMember(String sId);

}
