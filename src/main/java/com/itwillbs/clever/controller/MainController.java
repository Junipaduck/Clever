package com.itwillbs.clever.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.clever.service.*;
import com.itwillbs.clever.vo.MemberVO;
import com.itwillbs.clever.vo.ProductVO;

@Controller
public class MainController {
	
	@Autowired ProductService productService;
	
	@GetMapping(value = "/")
	public String main(Map<String, String> map, Model model,HttpSession session, MemberVO member, ProductVO product) {
		//0614 보아 시작!!!!!!!!!!!!
		List<HashMap<String, String>> selectDibsProduct = productService.selectDibsProduct();
		System.out.println("selectDibsProduct" + selectDibsProduct);
		model.addAttribute("selectDibsProduct", selectDibsProduct);
//			System.out.println(selectDibsProduct.get("product_idx"));
		
		List<HashMap<String, String>> fileList = productService.selectFile();
		model.addAttribute("fileList", fileList);
		//0614 보아 끝!!!!!!!!!!!!
		
		// 0614배하나
		String sId = (String)session.getAttribute("sId");
		
		List<HashMap<String, String>> productList = productService.selectProduct(); //중고상품 최신업로드 순으로 select리스트
//		List<HashMap<String, String>> fileList = productService.selectFile(); //파일테이블에서 중고상품의 첫번째등록한 이미지만 select
		String selectMemberInterest = productService.selectMemberInterest(sId, member); // member가 회원가입할때 넣었던 member_interest컬럼 select
		List<HashMap<String, String>> selectIntCtgr = productService.selectIntCtgr(selectMemberInterest, product); // sId의 interest에 맞는 카테고리의 상품들 select
		System.out.println("sId의 관심카테고리는 ? : " + selectMemberInterest);
		System.out.println(selectIntCtgr);
		
		model.addAttribute("productList", productList);
//		model.addAttribute("fileList", fileList);
		model.addAttribute("selectMemberInterest", selectMemberInterest);
		model.addAttribute("selectIntCtgr", selectIntCtgr);
		// //0614배하나
		
		return "index";
	}
	
	@GetMapping(value = "1대1문의")
	public String 문의() {
		return "1대1문의";
	}
	
	@GetMapping(value = "거래내역(구매)")
	public String 구매() {
		return "거래내역(구매)";
	}
	
	@GetMapping(value = "거래내역(정산)")
	public String 정산() {
		return "거래내역(정산)";
	}
	
	@GetMapping(value = "거래내역(판매)")
	public String 판매() {
		return "거래내역(판매)";
	}
	
	@GetMapping(value = "결제페이지")
	public String 결제페이지() {
		return "결제페이지";
	}
	
	@GetMapping(value = "고객센터")
	public String 고객센터() {
		return "고객센터";
	}
	
	@GetMapping(value = "공지사항")
	public String 공지사항() {
		return "공지사항";
	}
	
	@GetMapping(value = "내상점")
	public String 내상점() {
		return "내 상점";
	}
	
	@GetMapping(value = "내상점제재내역")
	public String 내상점제재내역() {
		return "내 상점 제재내역";
	}
	
	@GetMapping(value = "문의하기")
	public String 문의하기() {
		return "문의하기";
	}
	
	@GetMapping(value = "상세페이지")
	public String 상세페이지() {
		return "상세페이지";
	}
	
	@GetMapping(value = "상품관리")
	public String 상품관리() {
		return "상품관리";
	}
	
	@GetMapping(value = "상품등록")
	public String 상품등록() {
		return "상품등록";
	}
	
	@GetMapping(value = "운영정책")
	public String 운영정책() {
		return "운영정책";
	}
	
	@GetMapping(value = "자주묻는질문")
	public String 자주묻는질문() {
		return "자주묻는질문";
	}
	
	@GetMapping(value = "카테고리리스트")
	public String 카테고리리스트() {
		return "카테고리리스트";
	}
	
	
}
