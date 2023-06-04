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
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.clever.common.util.FileUpload;
import com.itwillbs.clever.service.ProductService;
import com.itwillbs.clever.vo.DibsVO;
import com.itwillbs.clever.vo.FileVO;
import com.itwillbs.clever.vo.ProductVO;
import com.itwillbs.clever.vo.ReportVO;

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
	public String productDetail(Model model, @RequestParam int product_idx, HttpSession session) {
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
		
		// 찜하기
		String sId = (String)session.getAttribute("sId");
		DibsVO dibs = new DibsVO();
		dibs.setProduct_idx(product_idx);
		dibs.setMember_id(sId);		
		
		System.out.println("1차체크 : " + dibs);
		
		DibsVO dibsCheck = productService.selectDibsCheck(dibs);
		
		if(dibsCheck != null) {
		} else {
			dibsCheck = new DibsVO();
			dibsCheck.setDibs_check("N");
		} model.addAttribute("result", dibsCheck);
		
		System.out.println("찜체크" + dibsCheck);
		
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
	@PostMapping("/productReportPro")
	public String productReportPro(Model model, @RequestParam int product_idx, ReportVO report) {
		 
		int insertCount = productService.insertProductReport(report);
		
		System.out.println("왜안나와!!! " + report.getReport_content());
		
		String result = "";
		if(insertCount > 0) { // 성공
			model.addAttribute("msg", "신고가 완료되었습니다.");
			model.addAttribute("target", "product_list");
			result = "success";
		} else { // 실패
			model.addAttribute("msg", "신고를 실패하였습니다.");
			result = "fail_back";
		}
		return result;
	}
	
	// 중고상품 수정폼으로 포워딩
	@GetMapping("/productModifyForm")
	public String productModifyForm(Model model, @RequestParam int product_idx) {
		// 중고상품 상세보기 select
		List<HashMap<String, String>> productDetail = productService.selectProductDetail(product_idx);
		model.addAttribute("productDetail", productDetail);
		
		// 중고상품 파일이미지 select
		List<HashMap<String, String>> filesList = productService.selectFiles(); // 중고상품 이미지 모두 select
		model.addAttribute("filesList", filesList);
				
		return "product/product_modify_form";
	}
	
	// 중고상품 수정 Pro
	@PostMapping("/productModifyPro")
	public String productModifyPro(Model model, ProductVO product) {
		int updateCount = productService.updateProduct(product);
		
		String result = "";
		if(updateCount > 0) { // 성공
			model.addAttribute("msg", "수정이 완료되었습니다.");
			model.addAttribute("target", "product_detail?product_idx=" + product.getProduct_idx());
			result = "success";
		} else { // 실패
			model.addAttribute("msg", "수정을 실패하였습니다.");
			result = "fail_back";
		}
		return result;
	}
	
	
	//중고수정페이지에서 이미지파일삭제 (아직 안됨ㅠㅠ 쿼리에 하드코딩하면 실행되는데, where 절에 필요한 파라미터를 ajax의 data로 전달받는게 어렵네)
	@PostMapping("/deleteFile")
    @ResponseBody
    public ResponseEntity<String> deleteQuery(FileVO file, @RequestParam String file_name) {
        // delete 구문 실행
        // 적절한 데이터베이스 연동 로직을 수행하여 해당 데이터를 삭제
		System.out.println("잠좀자자!!!!!!!!!!!!!!" + file_name + ", " + file.getFile_name());
		productService.deleteFile(file);
		
        // delete 구문이 성공적으로 실행되었다고 가정하고 성공 응답 반환
        return ResponseEntity.ok("Delete 구문 실행 성공");
    }
	
	
	// 중고상품 삭제하기
	@GetMapping("/deleteProduct")
	public String deleteProduct(ProductVO product, Model model) {
		int deleteCount = productService.deleteProduct(product);
		if(deleteCount > 0) {
			model.addAttribute("msg", "삭제되었습니다.");
			model.addAttribute("target", "product_list");
			return "success";
		} else {			
			model.addAttribute("msg", "실패");
			return "fail_back";
		}
	}	
	
	// 중고상품 구매하기 페이지
	@GetMapping("/payProduct")
	public String buyProduct(Model model, @RequestParam int product_idx) {
		// 중고상품 상세보기 select
		List<HashMap<String, String>> productDetail = productService.selectProductDetail(product_idx);
		model.addAttribute("productDetail", productDetail);
		
		//파일테이블에서 중고상품의 첫번째등록한 이미지만 select
		List<HashMap<String, String>> fileList = productService.selectFile(); 
		model.addAttribute("fileList", fileList);
		
		return "product/product_pay_form";
	}
	
	
} //끝



















