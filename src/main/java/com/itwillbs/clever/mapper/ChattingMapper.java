package com.itwillbs.clever.mapper;

import java.util.List;

import org.apache.ibatis.annotations.*;

import com.itwillbs.clever.vo.ChatListVO;

public interface ChattingMapper {

	List<ChatListVO> selectChatList(int product_idx);

	int openRoom(@Param("chat_idx") int chat_idx, @Param("product_idx") int product_idx);

}
