package com.itwillbs.clever.vo;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

/*

CREATE TABLE product (
 	product_idx int UNIQUE,
 	member_id varchar(45),
 	product_file varchar(200),
 	product_subject varchar(45),
 	product_category varchar(45),
 	sale_location varchar(45),
 	product_status varchar(45),
 	product_price varchar(45),
 	product_content varchar(3000),
 	product_tag varchar(100),
 	sale_pay varchar(45),
 	sale_status varchar(45)
 );

*/

@Data
public class ProductVO {
	private int product_idx;
	private String member_id;
	private String product_subject;
//	private String product_category;
	private String sale_location;
	private String product_status;
	private String product_price;
	private String product_content;
	private String product_tag;
	private String sale_pay;
	private String sale_status;
	private MultipartFile file;
	private String product_date;
	private String product_Lcategory;
	private String product_Mcategory;
	private String product_Scategory;
}


