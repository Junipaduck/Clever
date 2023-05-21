package com.itwillbs.clever.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class ProductController {
	
	// 상품 리스트 
	@GetMapping("/product_list")
	public String productList() {
		return "product/product_list";
	}
	
	// 상품 상세보기
	@GetMapping("/product_detail")
	public String productDetail() {
		return "product/product_detail";
	}
	
	
}
