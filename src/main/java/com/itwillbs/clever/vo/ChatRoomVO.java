package com.itwillbs.clever.vo;

import lombok.Data;

//CREATE TABLE chat_room (
//		chatRoom_idx int,
//		product_idx int,
//		chatRoom_date date,
//		product_subject varchar(45),
//		status varchar(1)
//		);

@Data
public class ChatRoomVO {
	private String chatRoom_id;
	private int product_idx;
	private String chatRoom_date;
	private String product_subject;
	private String status;
}
