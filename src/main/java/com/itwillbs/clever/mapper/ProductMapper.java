package com.itwillbs.clever.mapper;

import java.util.Map;

import com.itwillbs.clever.vo.ProductVO;

public interface ProductMapper {

	int insertProduct(ProductVO product);

	// common.util 공용 패키지의 FileUpload.java 서비스를 불러오는 코드
	void insertFile(Map<String, Object> paramMap);

	int selectMax();

	
}
