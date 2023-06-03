package com.itwillbs.clever.mapper;

import java.util.*;

import com.itwillbs.clever.vo.*;

public interface NoticeMapper {

	// 공지사항 등록
	int insertNotice(NoticeVO notice);

	// 공지사항 조회
	List<HashMap<String, String>> selectNoticeList();

}