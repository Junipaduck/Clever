package com.itwillbs.clever.mapper;

import java.util.*;

import com.itwillbs.clever.vo.*;

public interface GoodsMapper {

	int insertGoods(GoodsVO goods);

	int selectMax();

	List<HashMap<String, String>> selectGoodsList();

}





















































