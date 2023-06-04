package com.itwillbs.clever.vo;

import lombok.Data;

//CREATE TABLE LogRoom (
//		logRoom_idx int,
//		auction_idx int,
//		logRoom_date date,
//		aution_subject varchar(45),
//		status varchar(1)
//		);

@Data
public class LogRoomVO {
	private int logRoom_idx;
	private int auction_idx;
	private String logRoom_date;
	private String aution_subject;
	private String status;
}
