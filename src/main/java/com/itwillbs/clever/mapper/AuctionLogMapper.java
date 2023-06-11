package com.itwillbs.clever.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.*;

import com.itwillbs.clever.vo.LogRoomVO;


public interface AuctionLogMapper {

	List<LogRoomVO> selectLogList(@Param("auction_idx")int auction_idx);

	int openRoom2(@Param("logRoom_idx")int logRoom_idx, @Param("auction_idx")int auction_idx);

	int insertChat2(@Param("auction_idx")int auction_idx, @Param("logRoom_idx")int logRoom_idx, @Param("chatId")String chatId, @Param("messageContent")String messageContent);

	List<HashMap<String, String>> auctionConfirmed(@Param("auction_idx")int auction_idx);

}
