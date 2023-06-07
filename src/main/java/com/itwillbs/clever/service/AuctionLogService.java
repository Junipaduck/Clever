package com.itwillbs.clever.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.clever.mapper.AuctionLogMapper;
import com.itwillbs.clever.vo.LogRoomVO;

@Service
public class AuctionLogService {
	
	@Autowired
	private AuctionLogMapper mapper;

	public List<LogRoomVO> selectLogList(int auction_idx) {
		return mapper.selectLogList(auction_idx);
	}

	public int OpenRoom(int logRoom_idx, int auction_idx) {
		return mapper.openRoom2(logRoom_idx, auction_idx);
	}

	public int insertMessage(int auction_idx, int logRoom_idx, String chatId, String messageContent) {
		
		return mapper.insertChat2(auction_idx, logRoom_idx, chatId, messageContent);
	}
	
	

}
