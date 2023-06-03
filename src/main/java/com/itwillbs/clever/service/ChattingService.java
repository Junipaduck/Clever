package com.itwillbs.clever.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.clever.mapper.ChattingMapper;
import com.itwillbs.clever.vo.ChatRoomVO;

@Service
public class ChattingService {
	
	@Autowired
	private ChattingMapper mapper;

	public List<ChatRoomVO> selectChatList(int product_idx, String sId) {
		return mapper.selectChatList(product_idx, sId);
	}

//	public int openRoom(int product_idx) {
//		return mapper.openRoom(product_idx);
//	}

	public int OpenRoom(int chatRoom_idx, int product_idx) {
		return mapper.openRoom(chatRoom_idx, product_idx);
	}


}
