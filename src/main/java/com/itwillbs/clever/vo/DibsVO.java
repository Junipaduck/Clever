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
	private int dibs_idx;
	private String dibs_type;
	private int type_num;
	private String member_id;
	private int dibs_check;
}
