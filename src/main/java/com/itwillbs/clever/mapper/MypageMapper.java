package com.itwillbs.clever.mapper;

import java.util.HashMap;
import java.util.List;

public interface MypageMapper {

	List<HashMap<String, String>> selectOnSaleProduct(String sId);
	
}
