package com.itwillbs.clever.vo;

import java.sql.*;

import lombok.*;

@Data
public class CommunityTinyVO {
	
	private int reply_num; 
	private int community_idx;
	private String reply_name;
	private String reply_content;
	private int reply_re_ref;
	private int reply_re_lev;
	private int reply_re_seq;
	private Timestamp reply_date;
	
	
}
