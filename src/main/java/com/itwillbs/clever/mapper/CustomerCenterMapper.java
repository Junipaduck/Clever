package com.itwillbs.clever.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;


public interface CustomerCenterMapper {

	List FAQcategory(String param);

	List FAQlist(int fAQ_idx);

	int insertFAQ(Map<String, String> map);

	List<String> myAskedList(String sId);

	List<String> myAskedDetail(int asked_idx);

	int insertAsked(Map<String, String> map);


}
