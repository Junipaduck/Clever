package com.itwillbs.clever.vo;

import java.sql.*;

import org.springframework.web.multipart.*;

import lombok.*;

/*
 * 
 * CREATE TABLE goods (
goods_idx int, 
goods_name varchar(50),
goods_price varchar(50),
goods_content varchar(1000),
goods_file varchar(100),
goods_file_path varchar(100),
goods_date date
);
 * */

@Data
public class GoodsVO {
	private int goods_idx;
	private String goods_name;
	private String goods_price;
	private String goods_content;
	private String goods_file;
	private Date goods_date;
	private MultipartFile file;
}
