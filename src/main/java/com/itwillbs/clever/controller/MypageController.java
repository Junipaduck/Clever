package com.itwillbs.clever.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.clever.service.*;
import com.itwillbs.clever.vo.*;

@Controller
public class MypageController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private AuctionService auctionService;
	
	@Autowired
	private BankApiService apiService;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Value("${client_id}")
	private String client_id;
	
	// 마이페이지 포워딩
	@GetMapping("/myPage.me")
	public String myPage(HttpSession session, Model model) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null) {
			model.addAttribute("msg", "로그인 후 이용해주세요.");
			model.addAttribute("target", "loginForm.me");
			return "success";
		}
		
		MemberVO member = memberService.selectMember(sId);
		model.addAttribute("member", member);
		
		// 중고거래 판매 내역
		List<HashMap<String, String>> productSellList = mypageService.selectProductSellList(sId);
		model.addAttribute("productSellList", productSellList);

		// 중고거래 판매 날짜(sell 테이블)
		List<HashMap<String, String>> productSellDate = mypageService.selectProductSellDate(sId);
		model.addAttribute("productSellDate", productSellDate);
		
		// 중고거래 구매 내역
		List<HashMap<String, String>> productBuyList = mypageService.selectProductBuyList(sId);
		model.addAttribute("productBuyList", productBuyList);
		
		// 중고거래 파일 이미지
		List<HashMap<String, String>> fileList = productService.selectFile(); //파일테이블에서 중고상품의 첫번째등록한 이미지만 select
		model.addAttribute("fileList", fileList);
		
		// 중고거래 찜 내역
		List<HashMap<String, String>> productdibsList = mypageService.selectProductDibsList(sId);
		model.addAttribute("productdibsList", productdibsList);
		
		// 경매 등록 내역
		List<HashMap<String, String>> auctionList = mypageService.selectAuctionList(sId); 
		model.addAttribute("auctionList", auctionList);
		
		// 경매 낙찰 내역
		List<HashMap<String, String>> auctionBidList = mypageService.selectAuctionBidList(sId); 
		model.addAttribute("auctionBidList", auctionBidList);
		
		// 경매 파일 이미지
		List<HashMap<String, String>> auctionfileList = mypageService.selectAuctionFile(); //파일테이블에서 경매 찜 목록의 첫번째등록한 이미지만 select
		model.addAttribute("auctionfileList", auctionfileList);
		
		// 경매 찜 내역
		List<HashMap<String, String>> auctionDibsList = mypageService.selectAutionDibsList(sId);
		model.addAttribute("auctionDibsList", auctionDibsList);
		
		// 굿즈 구매 내역
		List<HashMap<String, String>> goodsList = mypageService.selectGoodsList(sId);
		model.addAttribute("goodsList", goodsList);

		// 중고거래 파일 이미지
		List<HashMap<String, String>> goodsFile = mypageService.selectGoodsFile(); //파일테이블에서 중고상품의 첫번째등록한 이미지만 select
		model.addAttribute("goodsFile", goodsFile);
			
		// 신고 당한 내역
		List<HashMap<String, String>> reportList = mypageService.selectReportList(sId);
		model.addAttribute("reportList", reportList);
		
		// 회원 등급 조회
		List<HashMap<String, String>> memberGrade = mypageService.selectMemberGrade(sId);
		model.addAttribute("memberGrade", memberGrade);
		
		// 후기 조회
		List<HashMap<String, String>> reviewCheck = mypageService.selectReviewCheck(sId);
		model.addAttribute("reviewCheck", reviewCheck);
		
		
		return "mypage/my_page";
	}
		
	// 회원정보 포워딩
	@GetMapping("/memberModify.me")
	public String customerModify(HttpSession session, Model model) {
		
		String sId = (String)session.getAttribute("sId");
		
		HashMap<String, String> member = memberService.selectModifyMember(sId);
		model.addAttribute("member", member);
		System.out.println(member);
		
		// 클라이언트 id 저장 
		model.addAttribute("client_id", client_id);
		
		return "mypage/memberModify";
	}
	
	//회원정보 수정
	@PostMapping(value = "/memberModifyPro.me")
    public String customerModifyPro(HttpSession session, Model model, @RequestParam String modifypasswd ,MemberVO member) {
		System.out.println("memberModifyPro.me");
		String sId = (String)session.getAttribute("sId");
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        System.out.println("member 변수 확인 " + member);
        String passwd = memberService.getModifyPasswd(sId);
					
		if(passwordEncoder.matches(member.getMember_passwd(), passwd)) {
			if(!modifypasswd.equals("")) {
				modifypasswd = passwordEncoder.encode(modifypasswd);  // 변경된 비밀번호를 암호화해서 변수에 저장
        		}
			int updateCount = memberService.updateMember(sId, member, modifypasswd);
			if(updateCount > 0) { // 정보 수정이 되었을 때
	    		model.addAttribute("msg", "회원 정보 수정 완료!");
	    		model.addAttribute("target","myPage.me");
	    		return "success";
			} else { // 정보 수정이 되지 않았을 때
				model.addAttribute("msg", "회원 정보 수정 실패!");
				return "fail_back";
			}
		} else { // 변경할 비밀번호가 비밀번호 확인과 동일 하지 않음 
    		model.addAttribute("msg", "변경할 비밀번호가 동일하지 않습니다!");
    		return "fail_back";
    	}
	}
	
	// 후기 페이지 매핑
	@GetMapping("/review.me")
	public String review(HttpSession session, Model model) {
		
		return "mypage/review_write";
	}
	
	// 후기 작성
	@PostMapping(value = "/reviewPro")
	 public String reviewPro(HttpSession session, Model model, @RequestParam Map<String, String> map, @RequestParam String review_content) {
		
		String sId = (String)session.getAttribute("sId");
		
		map.put("review_id", sId);
		map.put("review_seller", map.get("review_seller"));
		
		map.put("review_content", review_content); //내용
		
		int insertCount = mypageService.insertReview(map);
		if(insertCount < 0 ) {
			model.addAttribute("msg", "리뷰 등록 실패");
			return "fail_back";
		} else {
			model.addAttribute("msg", "리뷰 등록 성공");
			model.addAttribute("target", "myPage.me");
			return "success";
		}
	}
	
	// 마이페이지 유저 계좌 정보 조회 
	@GetMapping("/bank_memberInfo")
	public String requestmemberInfo(HttpSession session, Model model) {
		// 세션에 저장된 엑세스 토큰 및 사용자 번호 변수에 저장
		String access_token = (String)session.getAttribute("access_token");
		String user_seq_no =  (String)session.getAttribute("user_seq_no");
		System.out.println("access_token : " + access_token);
		System.out.println("user_seq_no : " + user_seq_no);
		
		// access_token 이 null 일 경우 "계좌 인증 필수" 메세지 출력 후 이전페이지로 돌아가기
		if(access_token == null) {
			model.addAttribute("msg", "계좌 인증 필수!");
			return "fail_back";
		}
		
		// 사용자 정보 조회(REST API 요청)		
		// BankApiService - requestUserInfo() 메서드 호출
		// => 파라미터 : 엑세스토큰, 사용자번호   리턴타입 : ResponseUserInfoVO(userInfo)
		ResponseUserInfoVO userInfo = apiService.requestUserInfo(access_token, user_seq_no);
		System.out.println(userInfo);
		
		// Model 객체에 ResponseUserInfoVO 객체 저장
		model.addAttribute("userInfo", userInfo);
		
		return "mypage/bank_memberInfo";
	}
	
	// 마이페이지 유저 계좌 상세정보 조회(잔액조회 API) 
	@PostMapping("Member_accountDetail")
	public String MemberAccountDetail(
			@RequestParam Map<String, String> map, HttpSession session, Model model) {
		// 미로그인 또는 엑세스토큰 없을 경우 "fail_back" 페이지를 통해
		// "권한이 없습니다!" 출력 후 이전페이지로 돌아가기
		if(session.getAttribute("sId") == null || session.getAttribute("access_token") == null) {
			model.addAttribute("msg", "권한이 없습니다!");
			return "fail_back";
		}
		
		// 세션 객체의 엑세스 토큰을 Map 객체에 추가
		map.put("access_token", (String)session.getAttribute("access_token"));
		logger.info("★★★★★★ bank_accountDetail : " + map);
		
		// BankApiService - requestAccountDetail() 메서드를 호출하여
		// 계좌 상세정보 조회 요청
		// => 파라미터 : Map 객체   리턴타입 : AccountDetailVO(account)
		AccountDetailVO account = apiService.requestAccountDetail(map);
		
		// 응답코드(rsp_code)가 "A0000" 가 아니면 에러 상황이므로 에러 처리
		// => "정보 조회 실패!" 출력 후 이전페이지로 돌아가기(fail_bank)
		// => 출력메세지에 응답메세지(rsp_message) 도 함께 출력
		if(account == null) {
			model.addAttribute("msg", "정보 조회 실패");
			return "fail_back";
		} else if(!account.getRsp_code().equals("A0000")) {
			model.addAttribute("msg", "정보 조회 실패 - " + account.getRsp_message());
			return "fail_back";
		}
		
		System.out.println(account);
		
		// AccountDetailVO 객체 저장
		model.addAttribute("account", account);
		model.addAttribute("account_num_masked", map.get("account_num_masked"));
		model.addAttribute("user_name", map.get("user_name"));
		
		return "mypage/member_account_detail";
		
	}   
	
	// 마이페이지 중고거래 찜 취소
	@GetMapping("/P_DibsCancel")
	public String pDibsCancel(HttpSession session, Model model, @RequestParam int type_num) {
		
		String sId = (String)session.getAttribute("sId");
		
		int result = -1;
		
		result = mypageService.deletePDibs(sId, type_num);
		if(result > 0) {
			model.addAttribute("msg", "찜 취소");
			model.addAttribute("target", "myPage.me");
			return "success";
		} else {
			model.addAttribute("msg", "찜 취소 실패");
			return "fail_back";
		} 
	}
	
	// 마이페이지 중고거래 찜 취소
	@GetMapping("/A_DibsCancel")
	public String aDibsCancel(HttpSession session, Model model, @RequestParam int type_num) {
		
		String sId = (String)session.getAttribute("sId");
		
		int result = -1;
		
		result = mypageService.deleteADibs(sId, type_num);
		if(result > 0) {
			model.addAttribute("msg", "찜 취소");
			model.addAttribute("target", "myPage.me");
			return "success";
		} else {
			model.addAttribute("msg", "찜 취소 실패");
			return "fail_back";
		} 
	}
	
}
