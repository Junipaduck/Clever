package com.itwillbs.clever.mapper;

import java.util.Map;

import com.itwillbs.clever.vo.ProductVO;

public interface ProductMapper {

	int insertProduct(ProductVO product);

	void insertFile(Map<String, Object> paramMap);

	int selectMax();

	
}
