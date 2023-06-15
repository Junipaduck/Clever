package com.itwillbs.clever.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.clever.vo.MemberVO;

public interface MemberMapper {

	int insertMember(MemberVO member);
	
	boolean isSuccessMember(MemberVO member);

	String getPasswd(MemberVO member);

	MemberVO selectMember(String sId);

	HashMap<String, String> selectModifyMember(String sId);

	String getModifyPasswd(String sId);

	int modifyMember(String sId, HashMap<String, String> paramMember);

	int updateMember(@Param("sId") String sId, @Param("member") MemberVO member, @Param("modifypasswd") String modifypasswd);

	String findId(MemberVO member);

	MemberVO selectMemberFindPasswd(MemberVO member);

	int updateMemberFindPasswd(MemberVO member);

	boolean isDuplicateMember(String member_id);

	String getPassword(String sId);

	int deleteMember(String sId);
	
}
