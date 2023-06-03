package com.itwillbs.clever.vo;

import lombok.Data;

@Data
public class ReportVO {
	private int report_idx;
	private String report_content;
	private int report_count;
	private int product_idx;
	private String seller_id;
	private String reporter_id;
}

