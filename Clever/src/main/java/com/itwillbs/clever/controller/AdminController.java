package com.itwillbs.clever.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class AdminController {
	
	
	@GetMapping(value = "/adminMain.ad")
	public String adminMain() {
		return "admin/admin_main";
	}
	
	// 회원 목록 조회 
	@GetMapping(value = "/adminMember.ad")
	public String memberList() {
		return "admin/admin_member";
	}
	
	// 굿즈 등록 페이지 
	@GetMapping(value = "/storeRegister.ad")
	public String storeRegister() {
		return "admin/store_register_form";
	}
	
	// 굿즈 등록 수정 페이지 
	@GetMapping(value = "/storeModify.ad")
	public String storeModify() {
		return "admin/store_modify_form";
	}
	
	// 현재 판매 중인 굿즈 목록 조회
	@GetMapping(value = "/storeList.ad")
	public String storeList() {
		return "admin/store_list";
	}
	
	// 경매 목록 조회
	@GetMapping(value = "/adminAuction.ad")
	public String autionList() {
		return "admin/auction_list";
	}
	
	// 신고 목록 조회 
	@GetMapping(value = "/adminReport.ad")
	public String reportList() {
		return "admin/report_list";
	}
	
	//신고 처리 결과 페이지 
	@GetMapping(value = "/adminReportPro.ad")
	public String reportPro() {
		return "admin/report_pro";
	}
}



















































