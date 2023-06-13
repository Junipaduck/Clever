package com.itwillbs.clever.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.clever.mapper.*;
import com.itwillbs.clever.vo.*;

@Service
public class NoticeService {

	@Autowired
	private NoticeMapper mapper;

	
	// 공지사항 등록
	public int registerNotice(NoticeVO notice) {
		
		return mapper.insertNotice(notice);
	}


	// 관리자 페이지 공지사항 조회
	public List<HashMap<String, String>> getNoticeList() {
		
		return mapper.selectNoticeList();
	}


	// 공지사항 수정 페이지 플레이스홀더
	public HashMap<String, String> getNotice(int notice_idx) {
		
		return mapper.selectNotice(notice_idx);
	}


	// 공지사항 수정 처리
	public int updateNotice(NoticeVO notice) {
		
		return mapper.updateNotice(notice);
	}

	
	// 공지사항 삭제 처리
	public int deleteNotice(int notice_idx) {
		
		return mapper.deleteNotice(notice_idx);
	}


	// 공지사항 상세보기
	public List<HashMap<String, String>> getNoticeDetail(int notice_idx) {
		
		return mapper.selectNoticeDetail(notice_idx);
	}

	// 공지사항 조회수 증가 
	public int updateReadCount(int notice_idx) {
		
		return mapper.updateReadCount(notice_idx);
	}
	
}
