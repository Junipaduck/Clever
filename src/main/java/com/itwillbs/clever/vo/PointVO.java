package com.itwillbs.clever.vo;

import java.sql.*;

import lombok.*;

@Data
public class PointVO {
/*
 * CREATE TABLE point (
point_idx int,
member_id varchar(50),
charge_point int, 
point_date date, 
point_status varchar(50),
account_amt int 
);
 * */
	
	private int point_idx;
	private String member_id;
	private int charge_point;
	private Date point_date;
	private String point_status;
	private int account_amt;
}
