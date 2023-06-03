package com.itwillbs.clever.mapper;

import java.util.List;

import org.apache.ibatis.annotations.*;

import com.itwillbs.clever.vo.ChatRoomVO;

public interface ChattingMapper {

	List<ChatRoomVO> selectChatList(@Param("product_idx") int product_idx, @Param("sId") String sId);

	int openRoom(@Param("chatRoom_idx") int chatRoom_idx, @Param("product_idx") int product_idx);

}
