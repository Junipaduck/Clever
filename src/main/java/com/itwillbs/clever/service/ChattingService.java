package com.itwillbs.clever.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.clever.mapper.ChattingMapper;
import com.itwillbs.clever.vo.ChatListVO;

@Service
public class ChattingService {
	
	@Autowired
	private ChattingMapper mapper;

	public List<ChatListVO> selectChatList(String sId) {
		return null;
//		return mapper.selectChatList(sId);
	}

	public int openRoom(String sId) {
		return 0;
//		return mapper.openRoom(sId);
	}


}
