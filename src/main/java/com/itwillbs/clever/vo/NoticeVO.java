package com.itwillbs.clever.vo;

import java.sql.*;

import lombok.*;

@Data
public class NoticeVO {
	private int notice_idx;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	private int notice_readcount;
}
