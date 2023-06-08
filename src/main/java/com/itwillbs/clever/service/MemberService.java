package com.itwillbs.clever.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.clever.mapper.MemberMapper;
import com.itwillbs.clever.vo.MemberVO;


@Service
public class MemberService {

	@Autowired
	private MemberMapper mapper;

	//회원가입
	public int insertMember(MemberVO member) {
		return mapper.insertMember(member);
	}

	//로그인
	public boolean isSuccessMember(MemberVO member) {
		return mapper.isSuccessMember(member);
	}
	
	//로그인시 비밀번호 확인
	public String getPasswd(MemberVO member) {
		return mapper.getPasswd(member);
	}

	//회원 정보 불러오기
	public MemberVO selectMember(String sId) {
		return mapper.selectMember(sId);
	}

	// 회원정보 수정 페이지에서 생일, 주소 split을 위한 select
	public HashMap<String, String> selectModifyMember(String sId) {
		return mapper.selectModifyMember(sId);
	}
	
}
