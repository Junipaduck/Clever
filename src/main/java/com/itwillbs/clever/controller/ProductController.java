package com.itwillbs.clever.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.clever.common.util.FileUpload;
import com.itwillbs.clever.service.ProductService;
import com.itwillbs.clever.vo.ProductVO;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	// file테이블 업로드 관련 서비스 호출
	@Autowired
	FileUpload FileUpload;
	
	// 상품 리스트 
	@GetMapping("/product_list")
	public String productList(Model model) {
		List<HashMap<String, String>> productList = productService.selectProduct(); //중고상품 select리스트
		model.addAttribute("productList", productList);

		List<HashMap<String, String>> fileList = productService.selectFile(); //파일테이블에서 중고상품의 첫번째등록한 이미지만 select
		model.addAttribute("fileList", fileList);
		
//		System.out.println("product 담기냐 : " + productList);
//		System.out.println("file 담기냐 : " + fileList);
		
		
		return "product/product_list";
	}
	
	// 상품 상세보기
	@GetMapping("/product_detail")
	public String productDetail(Model model, @RequestParam int product_idx) {
		// 중고상품 상세보기 select
		List<HashMap<String, String>> productDetail = productService.selectProductDetail(product_idx);
		model.addAttribute("productDetail", productDetail);
		
		// 중고상품 파일이미지 select
		List<HashMap<String, String>> filesList = productService.selectFiles(); // 중고상품 이미지 모두 select
		model.addAttribute("filesList", filesList);
		
		// 중고상품 같은카테고리의 연관상품 select
		List<HashMap<String, Object>> productSameCategory = productService.selectProductSameCategory(product_idx);
		model.addAttribute("productSameCategory", productSameCategory);
		
		List<HashMap<String, String>> fileList = productService.selectFile(); //파일테이블에서 중고상품의 첫번째등록한 이미지만 select
		model.addAttribute("fileList", fileList);
		
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
//	@PostMapping("/productUploadPro")
//	public String productUproadPro(ProductVO product, HttpSession session, Model model) {
//		System.out.println(product);
//		
//		int insertCount = productService.insertProduct(product);
//		
//		if(insertCount > 0) {
//			model.addAttribute("msg", "등록이 완료되었습니다.");
//			model.addAttribute("target", "product_list");
//			return "success";
//		} else {
//			model.addAttribute("msg", "등록이 실패하였습니다.");
//			return "fail_back";
//		}
//	}
	
	
	// 중고 상품 등록 INSERT 
	@PostMapping("/productUploadPro")
	public String productUproadPro(ProductVO product, HttpSession session, Model model, MultipartFile[] file) {
		int insertCount = productService.insertProduct(product); //중고상품 insert 후 리턴받아온 int값
		
		//---------- 파일 업로드 관련 작업 시작 -----------------------------------------------------------
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("file_div", "product");
		paramMap.put("file_num", productService.selectMax());
		FileUpload.upload(file, session, paramMap);
		//---------- 파일 업로드 관련 작업 끝 ------------------------------------------------------------
		
		String result = "";
		if(insertCount > 0) { // 성공
			model.addAttribute("msg", "등록이 완료되었습니다.");
			model.addAttribute("target", "product_list");
			result = "success";
		} else { // 실패
			model.addAttribute("msg", "등록이 실패하였습니다.");
			result = "fail_back";
		}
		return result;
	}

	
	// 판매자 신고 폼으로 포워딩
	@GetMapping("/productReport")
	public String productReport() {
		return "product/product_report";
	}
	
	// 판매자 신고하기 (report 테이블에 insert)
//	@PostMapping("/productReportPro")
//	public String productReportPro(Model model, @RequestParam int product_idx) {
//		
//		int insertCount = productService.insertProductReport(product_idx);
//		
//		String result = "";
//		if(insertCount > 0) { // 성공
//			model.addAttribute("msg", "신고가 완료되었습니다.");
//			model.addAttribute("target", "product_list");
//			result = "success";
//		} else { // 실패
//			model.addAttribute("msg", "신고를 실패하였습니다.");
//			result = "fail_back";
//		}
//		return result;
//	}
	
	
	
} //끝



















