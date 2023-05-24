package com.itwillbs.clever.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.clever.service.ProductService;
import com.itwillbs.clever.vo.ProductVO;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
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
	
	// 상품 등록하기
	@GetMapping("/product_upload")
	public String productUpload(HttpSession session, Model model) {
		
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인 후 이용해주세요.");
			model.addAttribute("target", "loginForm.me");
			return "success";
		}
		return "product/product_upload";
	}
	
	// 상품 관리하기
	@GetMapping("/product_management")
	public String productManagement() {
		return "product/product_management";
	}
	
	// 상품 구입 내역
	@GetMapping("/product_buy")
	public String productBuy() {
		return "product/product_buy";
	}
	
	// 상품 판매 내역
	@GetMapping("/product_sell")
	public String productSell() {
		return "product/product_sell";
	}
	
	// 중고 상품 등록 INSERT (썸네일)
	@PostMapping("/productUploadPro")
	public String productUproadPro(ProductVO product, HttpSession session, Model model) {
		System.out.println(product);
		
		int insertCount = productService.insertProduct(product);
		
		if(insertCount > 0) {
			model.addAttribute("msg", "등록이 완료되었습니다.");
			model.addAttribute("target", "product_list");
			return "success";
		} else {
			model.addAttribute("msg", "등록이 실패하였습니다.");
			return "fail_back";
		}
	}
	
	
	
	
} //끝



















