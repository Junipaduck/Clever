package com.itwillbs.clever.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainController {
	
	@GetMapping(value = "/")
	public String main() {
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
	
	@GetMapping(value = "chatting")
	public String chatting() {
		return "chatting/chatting";
	}
	
}
