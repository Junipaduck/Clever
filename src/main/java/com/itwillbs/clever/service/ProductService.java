package com.itwillbs.clever.service;

import java.util.HashMap;
import java.util.List;
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

	// 중고상품 전체 select
	public List<HashMap<String, String>> selectProduct() {
		return mapper.selectProduct();
	}

	// 중고상품 특정idx만 select 
	public List<HashMap<String, String>> selectProductDetail(int product_idx) {
		return mapper.selectProductDetail(product_idx);
	}

	
}
