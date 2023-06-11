package com.itwillbs.clever.vo;

import java.sql.*;

import lombok.*;

/*
 * 
 * CREATE TABLE buyGoods (
buy_idx int,
buy_id varchar(50),
buy_title varchar(100),
buy_price varchar(100),
buy_date date,
goods_idx int,
buy_status char(1)
);
 * */

@Data
public class BuyGoodsVO {
	private int buy_idx;
	private String buy_id;
	private String buy_title;
	private String buy_price;
	private Date buy_date;
	private int goods_idx;
	private String buy_status; 
}
