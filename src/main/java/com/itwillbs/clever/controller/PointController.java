package com.itwillbs.clever.controller;

import java.util.*;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.clever.service.*;
import com.itwillbs.clever.vo.*;

@Controller
public class PointController {
	
	@Autowired
	private BankService bankService;
	
	@Autowired
	private BankApiClient apiService;
	
	
	// appdata.properties 의 값 자동 주입
	@Value("${baseUrl}")
	private String baseUrl;
	
	@Value("${client_id}")
	private String client_id;
	
	@Value("${client_secret}")
	private String client_secret;
	
	@Value("${client_bank_code}")
	private String client_bank_code;
	
	@Value("${client_account_num}")
	private String client_account_num;
	
	private static final Logger logger = LoggerFactory.getLogger(PointController.class);

	
	@GetMapping(value = "/pointCharge")
	public String pointCharge(HttpSession session, Model model) {
		
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
		
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인 후 이용해주세요.");
			model.addAttribute("target", "loginForm.me");
			return "success";
		} else {
			return "pay/point_charge_form";
		}
		
	}
	
	@PostMapping(value = "/point_bank_accountDetail")
	public String pointAccountDetail(@RequestParam Map<String, String> map, HttpSession session, Model model) {
		// 미로그인 또는 엑세스토큰 없을 경우 "fail_back" 페이지를 통해
		// "권한이 없습니다!" 출력 후 이전페이지로 돌아가기
		if(session.getAttribute("sId") == null || session.getAttribute("access_token") == null) {
			model.addAttribute("msg", "권한이 없습니다!");
			return "fail_back";
		}
		
		// 세션에 저장된 엑세스 토큰 및 사용자 번호 변수에 저장
		String access_token = (String)session.getAttribute("access_token");
		String user_seq_no =  (String)session.getAttribute("user_seq_no");
		
		// 세션 객체의 엑세스 토큰을 Map 객체에 추가
		map.put("access_token", (String)session.getAttribute("access_token"));
		logger.info("★★★★★★ member_bank_accountDetail : " + map);
		
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
		
		return "pay/point_charge_detail";
	}
	
	@PostMapping("point_withdraw")
	public String pointWithdraw(
			@RequestParam Map<String, String> map, HttpSession session, Model model) {
		// 세션 객체의 엑세스토큰을 Map 객체에 추가
		
		String id = (String)session.getAttribute("sId");		
		map.put("access_token", (String)session.getAttribute("access_token"));
		logger.info("★★★★★★ 출금 요청 정보 : " + map);
		
		// BankApiService - withdraw() 메서드 호출하여 출금이체 요청
		// 파라미터 : Map 객체   리턴타입 : AccountWithdrawResponseVO(result)
		AccountWithdrawResponseVO result = apiService.withdraw(map);
		logger.info("★★★★★★ 출금 요청 처리 결과 : " + result);
		
		// Model 객체에 AccountWithdrawResponseVO 객체 저장(속성명 : result)
		model.addAttribute("result", result);
		
		// 만약, 응답코드(rsp_code) 가 "A0000" 이 아니면, 처리 실패이므로
		// 응답메세지(rsp_message) 를 화면에 출력 후 이전페이지로 돌아가기
		if(!result.getRsp_code().equals("A0000")) {
			model.addAttribute("msg", result.getRsp_message());
			return "fail_back";
		}
		
		System.out.println("포인트 테스트~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		
		int updateCount = bankService.updateMemberPoint(id);
		if(updateCount > 0) {
			model.addAttribute("msg", "포인트 적립 성공!");
			model.addAttribute("target", "pointCharge");
			return "success";
		}
		
		return "bank/withdraw_result";
	}
	
}











































