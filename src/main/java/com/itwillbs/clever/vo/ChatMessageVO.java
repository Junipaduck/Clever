package com.itwillbs.clever.vo;

import lombok.Data;

//CREATE TABLE chat_message (
//		message_idx int
//		,chatRoom_idx int
//		,buyer_id varchar(45)
//		,seller_id varchar(45)
//		,message_date date
//		,message_content varchar(100)
//);

@Data
public class ChatMessageVO {
	private int message_idx;
	private String chatRoom_id;
	private String buyer_id;
	private String seller_id;
	private String message_date;
	private String message_content;
	private String senderId;
}
