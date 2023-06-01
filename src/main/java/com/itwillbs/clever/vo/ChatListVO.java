package com.itwillbs.clever.vo;

import lombok.Data;

//CREATE TABLE chat_list (
//		chat_idx int,
//		product_idx int,
//		chat_date date,
//		product_subject varchar(45),
//		status varchar(1)
//		);

@Data
public class ChatListVO {
	private int chat_idx;
	private int product_idx;
	private String chat_date;
	private String product_subject;
	private String status;
}
