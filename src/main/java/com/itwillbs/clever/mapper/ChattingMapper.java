package com.itwillbs.clever.mapper;

import java.util.List;

import org.apache.ibatis.annotations.*;

import com.itwillbs.clever.vo.ChatRoomVO;
import com.itwillbs.clever.vo.ProductVO;

public interface ChattingMapper {

	List<ProductVO> selectProduct(int product_idx);
	
	String selectUserInfo(String id);
	
	List<ChatRoomVO> selectChatList(String chatRoomId);

	int openRoom(@Param("chatRoomId") String chatRoomId, @Param("productIdx") int productIdx);

	int insertChat(@Param("productIdx") int productIdx, @Param("chatRoomId") String chatRoomId, 
			@Param("buyerId") String buyerId, @Param("sellerId") String sellerId, @Param("messageContent") String messageContent);




}
