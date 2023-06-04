package com.itwillbs.clever.mapper;

import java.util.*;

import com.itwillbs.clever.vo.*;

public interface NoticeMapper {

	// 공지사항 등록
	int insertNotice(NoticeVO notice);

	// 공지사항 조회
	List<HashMap<String, String>> selectNoticeList();

	// 공지사항 수정 페이지 플레이스홀더
	HashMap<String, String> selectNotice(int notice_idx);

	// 공지사항 수정 처리
	int updateNotice(NoticeVO notice);

}