package com.itwillbs.clever.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.clever.service.*;
import com.itwillbs.clever.vo.*;

import retrofit2.http.*;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	
	@GetMapping(value = "/adminMain.ad")
	public String adminMain(HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("sId");
		
		// 관리자 페이지 접근 제한 설정! 로그인 하지 않았거나 아이디가 admin이 아닐 시 접근 불가. 
		if(id == null || !id.equals("admin")) {
			model.addAttribute("msg", "접근 권한이 없습니다!");
			return "fail_back";
		}
//------------------------------------------------------------------------------------------------------------------------------------------------------
		// 관리자 메인 페이지 차트 
		
		// 가입 회원 수 계산 
		int memberCount = adminService.selectMemberCount();
		model.addAttribute("memberCount", memberCount);
		
		return "admin/admin_main";
	}
	
	// 회원 목록 조회 
	@GetMapping(value = "/adminMember.ad")
	public String memberList(HttpSession httpSession, Model model) {
		
//		List<MemberVO> memberList = adminService.selectMember();
//		model.addAttribute("memberList", memberList);
		List<HashMap<String, String>> memberList = adminService.selectMember();
		model.addAttribute("memberList", memberList);
		
		return "admin/admin_member";
	}
	
//	@GetMapping(value = "/memberAuthForm.ad")
//	public String memberAuthForm() {
//		return "member/member_auth_form";
//	}
	
	
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
	
	// 고객센터 매핑
	@GetMapping(value = "/CustomerCenter.ad")
	public String customerCenter() {
		return "customer_center/center_main";
	}
}



















































