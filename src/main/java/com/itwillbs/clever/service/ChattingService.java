package com.itwillbs.clever.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.clever.mapper.ChattingMapper;
import com.itwillbs.clever.vo.ChatMessageVO;
import com.itwillbs.clever.vo.ChatRoomVO;
import com.itwillbs.clever.vo.ProductVO;

@Service
public class ChattingService {
	
	@Autowired
	private ChattingMapper mapper;

	// 채팅페이지 이동 시 판매물품 정보 조회
	public List<ProductVO> selectProduct(int product_idx) {
		return mapper.selectProduct(product_idx);
	}
	
	// 채팅페이지 이동 시 멤버idx조회
	public String selectUser(String id) {
		return mapper.selectUserInfo(id);
	}
	
	// 메세지 전송 후 채팅방 존재하는지 확인
	public List<ChatRoomVO> selectChatRoom(String chatRoomId) {
		return mapper.selectChatRoom(chatRoomId);
	}
	
	public List<ChatRoomVO> selectChatList(String sId) {
		return mapper.selectChatList(sId);
	}

	// 채팅방 생성
	public int OpenRoom(String chatRoomId, int productIdx) {
		return mapper.openRoom(chatRoomId, productIdx);
	}

	public int insertMessage(int productIdx, String chatRoomId, String buyerId, String sellerId,
			String messageContent) {
		return mapper.insertChat(productIdx, chatRoomId, buyerId, sellerId, messageContent);
	}

	// 채팅방 목록에서 해당 방 메세지 조회
	public List<ChatMessageVO> selectRoomInfo(String roomId) {
		return mapper.selectRoomInfo(roomId);
	}






}
