package com.itwillbs.clever.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.clever.mapper.ProductMapper;
import com.itwillbs.clever.vo.ProductVO;

@Service
public class ProductService {

	@Autowired
	private ProductMapper mapper;

	public int insertProduct(ProductVO product) {
		return mapper.insertProduct(product);
	}
}
