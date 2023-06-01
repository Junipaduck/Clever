package com.itwillbs.clever.mapper;

import java.util.List;

import com.itwillbs.clever.vo.ChatListVO;

public interface ChattingMapper {

	List<ChatListVO> selectChatList(String sId);

	int openRoom(String sId);

}
