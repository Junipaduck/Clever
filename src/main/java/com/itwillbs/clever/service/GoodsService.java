package com.itwillbs.clever.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.clever.mapper.*;
import com.itwillbs.clever.vo.*;

@Service
public class GoodsService {

	@Autowired
	GoodsMapper mapper;

	public int insertGoods(GoodsVO goods) {
		
		return mapper.insertGoods(goods);
	}

	//file 테이블의 file_num의 max값 select
	public int selectMax() {
		
		return mapper.selectMax();
	}

	// 굿즈 목록 조회
	public List<HashMap<String, String>> getGoodsList() {
		
		return mapper.selectGoodsList();
	}

	// 굿즈 수정용 굿즈 목록 조회
	public HashMap<String, String> getGoods(int goods_idx) {
		
		return mapper.selectGoods(goods_idx);
	}

	// 굿즈 수정 
	public int updateGoods(GoodsVO goods) {
		
		return mapper.updateGoods(goods);
	}

	
}
