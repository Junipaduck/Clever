package com.itwillbs.clever.controller;

import java.io.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import com.itwillbs.clever.common.util.*;
import com.itwillbs.clever.service.*;
import com.itwillbs.clever.vo.*;

import retrofit2.http.*;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MailSendService mailService;
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private CustomerCenterService customerCenterService;
	
	@Autowired
	private AuctionService auctionService;
	
	@Autowired
	FileUpload fileUpload;
	
	@Value("${client_id}")
	private String client_id;
	
	@GetMapping(value = "/adminMain.ad")
	public String adminMain(HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("sId");
		
		// 관리자 페이지 접근 제한 설정! 로그인 하지 않았거나 아이디가 admin이 아닐 시 접근 불가. 
		if(id == null || !id.equals("admin")) {
			model.addAttribute("msg", "접근 권한이 없습니다!");
			return "fail_back";
		}
	
// 관리자 메인 페이지 차트------------------------------------------------------------------------------------------------------------------------------------------------------
		
		// 가입 회원 수 계산 
		int memberCount = adminService.getMemberCount();
		model.addAttribute("memberCount", memberCount);
		
		// 등록 상품 수 계산
		int productCount = adminService.getProductCount();
		model.addAttribute("productCount", productCount);
		
		// 등록 경매 상품 수 계산
		int auctionCount = adminService.getAuctionCount();
		model.addAttribute("auctionCount", auctionCount);
		
		// 신고 수 계산 
		int reportCount = adminService.getReportCount();
		model.addAttribute("reportCount", reportCount);
		
		// 일대일문의 조회
		List<HashMap<String, String>> askList = adminService.getAskList();
		model.addAttribute("askList", askList);
		
		// 중고 상품 차트 계산 
		List<HashMap<String, String>> productList = adminService.getProductList();
		model.addAttribute("productList", productList);
		
		Map<String, Object> map = new HashMap<>();
		map.put("productList", productList);
		
		// 경매 상품 차트 계산 
		List<HashMap<String, String>> auctionList = adminService.getAuctionChartList();
		model.addAttribute("auctionList", auctionList);
		
		// 포인트 충전 입출금 내역
		List<HashMap<String, String>> pointList = adminService.getPointList();
		model.addAttribute("pointList", pointList);
		
		// 회원 입금 내역
		List<HashMap<String, String>> memberAccountList = adminService.getMemberAccountList();
		model.addAttribute("memberAccountList", memberAccountList);
		
//		return new ModelAndView("admin/admin_main", "map", map);
		return "admin/admin_main";
	}
	
	// 회원 목록 조회 
	@GetMapping(value = "/adminMember.ad")
	public String memberList(HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("sId");
		
		// 관리자 페이지 접근 제한 설정! 로그인 하지 않았거나 아이디가 admin이 아닐 시 접근 불가. 
		if(id == null || !id.equals("admin")) {
			model.addAttribute("msg", "접근 권한이 없습니다!");
			return "fail_back";
		}
		
		List<HashMap<String, String>> memberList = adminService.selectMember();
		model.addAttribute("memberList", memberList);
		
		return "admin/admin_member";
	}
	
	// 회원 등급 조회 0613 강지훈추가
	@GetMapping(value = "/adminMemberGrade.ad")
	public String memberGradeList(HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("sId");
		
		// 관리자 페이지 접근 제한 설정! 로그인 하지 않았거나 아이디가 admin이 아닐 시 접근 불가. 
		if(id == null || !id.equals("admin")) {
			model.addAttribute("msg", "접근 권한이 없습니다!");
			return "fail_back";
		}
		
		List<HashMap<String, String>> memberList = adminService.selectMember();
		model.addAttribute("memberList", memberList);
		
		List<HashMap<String, String>> memberGradeList  = adminService.selectMemberGrade();
		model.addAttribute("memberGradeList", memberGradeList);
		
		List<HashMap<String, String>> countList = adminService.selectCountList();
		model.addAttribute("countList", countList);
		
		return "admin/admin_member_grade";
	}
	
	// 경매 목록 조회
	@GetMapping(value = "/adminAuction.ad")
	public String autionList(HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("sId");
		
		// 관리자 페이지 접근 제한 설정! 로그인 하지 않았거나 아이디가 admin이 아닐 시 접근 불가. 
		if(id == null || !id.equals("admin")) {
			model.addAttribute("msg", "접근 권한이 없습니다!");
			return "fail_back";
		}
		
		// 경매 목록 조회
		List<HashMap<String, String>> auctionList = adminService.getAuctionList();
		model.addAttribute("auctionList", auctionList);
		
		// 사진 조회
		
		List<HashMap<String, String>> fileList = adminService.selectAuctionFile();
		model.addAttribute("fileList", fileList);
		
		return "admin/auction_list";
	}
	
	// 경매 등록 승인 페이지
	@GetMapping(value = "/auctionAuth.ad")
	public String auctionAuth(HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("sId");
		
		// 관리자 페이지 접근 제한 설정! 로그인 하지 않았거나 아이디가 admin이 아닐 시 접근 불가. 
		if(id == null || !id.equals("admin")) {
			model.addAttribute("msg", "접근 권한이 없습니다!");
			return "fail_back";
		}
		
		List<HashMap<String, String>> auctionAuthList = adminService.getAuctionAuthList();
		model.addAttribute("auctionAuthList", auctionAuthList);
		
		// 사진 조회
		List<HashMap<String, String>> fileList = adminService.selectAuctionFile();
		model.addAttribute("fileList", fileList);
		
		return "admin/auction_auth_list";
	}
	
	@GetMapping(value = "auctionAuthPro.ad")
	public String auctionAuthPro(@RequestParam int auction_idx, HttpServletResponse response, Model model, HttpSession session) {
		
		String id = (String)session.getAttribute("sId");
		
		// 관리자 페이지 접근 제한 설정! 로그인 하지 않았거나 아이디가 admin이 아닐 시 접근 불가. 
		if(id == null || !id.equals("admin")) {
			model.addAttribute("msg", "접근 권한이 없습니다!");
			return "fail_back";
		}
		
		int isAuthSuccess = adminService.auctionAuth(auction_idx);
		
		if(isAuthSuccess > 0) {
			return "redirect:/auctionAuth.ad";
		} else {
			model.addAttribute("msg", "승인 실패! 다시 확인해주세요");
			return "fail_back";
		}
		
	}
	
	
	// 신고 목록 조회 
	@GetMapping(value = "/adminReport.ad")
	public String reportList(Model model, HttpSession session) {
		
		String id = (String)session.getAttribute("sId");
		
		// 관리자 페이지 접근 제한 설정! 로그인 하지 않았거나 아이디가 admin이 아닐 시 접근 불가. 
		if(id == null || !id.equals("admin")) {
			model.addAttribute("msg", "접근 권한이 없습니다!");
			return "fail_back";
		}
		
		List<HashMap<String, String>> reportList = adminService.getReportList();
		model.addAttribute("reportList", reportList);
		
		return "admin/report_list";
	}
	

	
	//신고 처리 결과 페이지 
	@GetMapping(value = "/adminReportPro.ad")
	public String reportProPage(Model model, HttpSession session) {
		
		String id = (String)session.getAttribute("sId");
		
		// 관리자 페이지 접근 제한 설정! 로그인 하지 않았거나 아이디가 admin이 아닐 시 접근 불가. 
		if(id == null || !id.equals("admin")) {
			model.addAttribute("msg", "접근 권한이 없습니다!");
			return "fail_back";
		}
		
		List<HashMap<String, String>> rList = adminService.getReportProList();
		model.addAttribute("rList", rList);
		
		return "admin/report_pro";
	}
	
	// 신고 처리 로직
	@GetMapping(value = "/reportPro.ad")
	public String reportPro(@RequestParam int product_idx, Model model, HttpSession session) {
		
		String id = (String)session.getAttribute("sId");
		
		// 관리자 페이지 접근 제한 설정! 로그인 하지 않았거나 아이디가 admin이 아닐 시 접근 불가. 
		if(id == null || !id.equals("admin")) {
			model.addAttribute("msg", "접근 권한이 없습니다!");
			return "fail_back";
		}
		
		int deleteCount = adminService.reportPro(product_idx);
		
		if(deleteCount > 0) {
			return "redirect:/adminReportPro.ad";
		} else {
			model.addAttribute("msg", "상품 삭제 실패! 확인 요망!");
			return "fail_back";
		}
		
	}
	
	// 고객센터 매핑
	@GetMapping(value = "/CustomerCenter.ad")
	public String customerCenter() {
		return "customer_center/center_main";
	}
	
	// 인증 -------------------------------------------------------------------------------------------
	
	// 이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴");
		System.out.println("------------------이메일이메일: " + email);
		
		return mailService.joinEmail(email);
	}
	
	// 휴대폰 인증
	@GetMapping(value = "/phoneCheck")
	@ResponseBody
	public String sendSMS(@RequestParam String phone) {
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
		adminService.certifiedPhoneNumber(phone, randomNumber);
		return Integer.toString(randomNumber);
	}
	
	// 관리자 정보 페이지 이동 (계좌관리, 관리자 정보 관리 용)
	@GetMapping(value = "/adminInfo.ad")
	public String adminInfo(Model model, HttpSession session) {
		
		String id = (String)session.getAttribute("sId");
		
		// 관리자 페이지 접근 제한 설정! 로그인 하지 않았거나 아이디가 admin이 아닐 시 접근 불가. 
		if(id == null || !id.equals("admin")) {
			model.addAttribute("msg", "접근 권한이 없습니다!");
			return "fail_back";
		}
		
		HashMap<String, String> adminInfo = adminService.getAdminInfo();
		
		model.addAttribute("adminInfo", adminInfo);
		
		// 클라이언트 id 저장
		model.addAttribute("client_id", client_id);
		
		return "admin/admin_info";
	}
	
	// 1:1 문의 목록 조회
	@GetMapping(value = "/adminAskedList.ad")
	public String adminAskList(Model model, HttpSession session) {
		
		String id = (String)session.getAttribute("sId");
		
		// 관리자 페이지 접근 제한 설정! 로그인 하지 않았거나 아이디가 admin이 아닐 시 접근 불가. 
		if(id == null || !id.equals("admin")) {
			model.addAttribute("msg", "접근 권한이 없습니다!");
			return "fail_back";
		}
		
		List<HashMap<String, String>> askList = adminService.getAskList();
		model.addAttribute("askList", askList);
		return "admin/admin_ask_list";
	}
	
	@PostMapping("adminAskedFormPro.ad")
	public String askedPro(@RequestParam Map<String, String> map, Model model, @RequestParam int asked_idx, HttpSession session) {
		
		String id = (String)session.getAttribute("sId");
		
		// 관리자 페이지 접근 제한 설정! 로그인 하지 않았거나 아이디가 admin이 아닐 시 접근 불가. 
		if(id == null || !id.equals("admin")) {
			model.addAttribute("msg", "접근 권한이 없습니다!");
			return "fail_back";
		}
		
		map.put("ans_content", map.get("editordata"));
		map.put("asked_idx", map.get("asked_idx"));
		
		int insertCount = customerCenterService.insertAskedAns(map);
		if(insertCount < 0 ) {
			model.addAttribute("msg", "답변 등록 실패");
			return "fail_back";
		} else {
			customerCenterService.updateAskedAns(map);
			model.addAttribute("msg", "답변 등록 성공");
			model.addAttribute("target", "adminAskedList.ad");
			return "success";
		}
	}
	
	@GetMapping(value = "/adminLogout.ad")
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping(value = "/adminPointAccount.ad")
	public String adminPointAccount(HttpSession session, Model model) {
		
		// 포인트 충전 입출금 내역
		List<HashMap<String, String>> pointList = adminService.selectPointList();
		model.addAttribute("pointList", pointList);
		
		// 관리자 잔액 조회
		HashMap<String, String> adminInfo = adminService.getAdminInfo();
		model.addAttribute("adminInfo", adminInfo);
		
		return "admin/admin_point_account";
	}
	
	@GetMapping(value = "/adminMemberAccount.ad")
	public String adminMemberAccount(HttpSession session, Model model) {
		
		// 개인 회원 입출금 내역
		List<HashMap<String, String>> memberAccountList = adminService.getMemberAccountList();
		model.addAttribute("memberAccountList", memberAccountList);
		
		return "admin/admin_member_account";
		
	}
	

}



















































