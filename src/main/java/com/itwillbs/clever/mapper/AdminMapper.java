package com.itwillbs.clever.mapper;

import java.util.*;

import com.itwillbs.clever.vo.*;

public interface AdminMapper {

	List<HashMap<String, String>> selectMember();

	int selectMemberCount();

}
