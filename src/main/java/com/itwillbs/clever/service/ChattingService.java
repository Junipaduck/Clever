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

	public List<ChatListVO> selectChatList(int product_idx) {
		return mapper.selectChatList(product_idx);
	}

	public int openRoom(int product_idx) {
		return mapper.openRoom(product_idx);
	}


}
