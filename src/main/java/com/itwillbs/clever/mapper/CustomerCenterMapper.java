package com.itwillbs.clever.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;


public interface CustomerCenterMapper {

	List FAQcategory(String param);

	List FAQlist(int fAQ_idx);

}
