package com.itwillbs.clever.vo;

import lombok.Data;

/*
  create table dibs (
	product_idx int,
	member_id varchar(45) not null,
	dibs_check varchar(1) not null,
	dibs_date date
  );
*/

@Data
public class DibsVO {
	private int product_idx;
	private String member_id;
	private String dibs_check;
}
