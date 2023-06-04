package com.itwillbs.clever.vo;

import lombok.Data;

//CREATE TABLE Log_message (
//		message_idx int
//		,logRoom_idx int
//		,buyer_id varchar(45)
//		,seller_id varchar(45)
//		,message_date date
//		,message_content varchar(100)
// );

@Data
public class LogMessageVO {
	private int message_idx;
	private int logRoom_idx;
	private String buyer_id;
	private String seller_id;
	private String message_date;
	private String message_content;
}
