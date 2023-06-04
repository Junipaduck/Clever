package com.itwillbs.clever.mapper;

import java.util.List;

import org.apache.ibatis.annotations.*;

import com.itwillbs.clever.vo.LogRoomVO;


public interface AuctionLogMapper {

	List<LogRoomVO> selectLogList(@Param("auction_idx")int auction_idx, @Param("sId")String sId);

	int openRoom2(@Param("logRoom_idx")int logRoom_idx, @Param("auction_idx")int auction_idx);

	int insertChat2(@Param("auction_idx")int auction_idx, @Param("logRoom_idx")int logRoom_idx, @Param("chatId")String chatId, @Param("messageContent")String messageContent);

}
