package com.itwillbs.clever.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.clever.mapper.ProductMapper;
import com.itwillbs.clever.vo.ProductVO;

@Service
public class ProductService {

	@Autowired
	private ProductMapper mapper;

	// 중고상품 INSERT
	public int insertProduct(ProductVO product) {
		return mapper.insertProduct(product);
	}
	
//	public void insertFile(Map<String, Object> paramMap) { //리턴 안할때는 void
//		mapper.insertFile(paramMap);
//	}
	
	// file 테이블의 file_num(= product테이블의 product_idx)의 max값을 select함
	public int selectMax() {
		return mapper.selectMax();
	}
}
