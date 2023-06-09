package com.itwillbs.clever.mapper;

import java.util.HashMap;
import java.util.List;

public interface MypageMapper {

	List<HashMap<String, String>> selectOnSaleProduct(String sId);

	List<HashMap<String, String>> selectProductBuyList(String sId);

	//	List<HashMap<String, String>> selectAutionDibs(String sId);

	List<HashMap<String, String>> selectDibsList(String sId);

	
}
