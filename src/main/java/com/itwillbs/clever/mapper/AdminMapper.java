package com.itwillbs.clever.mapper;

import java.util.*;

import com.itwillbs.clever.vo.*;

public interface AdminMapper {

	List<MemberVO> selectMember();

	int selectMemberCount();

}
