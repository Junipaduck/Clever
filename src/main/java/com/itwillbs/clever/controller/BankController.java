package com.itwillbs.clever.controller;

import java.util.*;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.clever.service.*;
import com.itwillbs.clever.vo.*;

@Controller
public class BankController {
	@Autowired
	private BankApiService apiService;
	
	@Autowired
	private BankService bankService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private AdminService adminService;
	
	private static final Logger logger = LoggerFactory.getLogger(BankController.class);
	
	// 사용자 인증 요청에 대한 응답 처리 및 엑세스 토큰 발급 요청 후 결과 처리
	@GetMapping("/callback")
	public String responseAuthCode(
			@RequestParam Map<String, String> authResponse, HttpSession session, Model model) {
//		logger.info(authResponse.toString());
		
		// 인증 실패 시(인증 정보 존재하지 않을 경우) 오류 메세지 출력 및 인증창 닫기
		if(authResponse == null || authResponse.get("code") == null) {
			model.addAttribute("msg", "인증 오류 발생! 다시 인증하세요!");
			model.addAttribute("isClose", true); // 창 닫기 명령
			return "fail_back";
		}
		
		// 토큰 발급 요청(REST 방식 = REST API 활용)
		// BankApiService - requestToken() 메서드를 호출하여 엑세스 토큰 발급 요청
		// => 파라미터 : 사용자 인증을 통해 전달받은 정보(Map 객체)
		// => 리턴타입 : 응답되는 엑세스토큰 관련 정보를 관리할 ResponseTokenVO 타입
		ResponseTokenVO responseToken = apiService.requestToken(authResponse);
		logger.info("★★★★★ Access Token : " + responseToken.toString());
		
		// 토큰 발급 실패 시 오류 메세지 출력 및 인증창 닫기
		if(responseToken.getAccess_token() == null) {
			model.addAttribute("msg", "토큰 발급 오류 발생! 다시 인증하세요!");
			model.addAttribute("isClose", true); // 창 닫기 명령
			return "fail_back";
		}
		
		// BankService - writeToken() 메서드를 호출하여
		// 토큰 관련 정보를 fintech3.account 테이블에 저장
		// => 파라미터 : 아이디, 토큰 정보가 저장된 ResponseTokenVO 객체
		// => 리턴타입 : int(insertCount)
		int insertCount = bankService.writeToken((String)session.getAttribute("sId"), responseToken);
		
		// 토큰 발급 실패 시 오류 메세지 출력 및 인증창 닫기
		if(insertCount == 0) {
			model.addAttribute("msg", "토큰 발급 오류 발생! 다시 인증하세요!");
			model.addAttribute("isClose", true); // 창 닫기 명령
			return "fail_back";
		}
		
		// 세션 객체에 엑세스토큰(access_token)과 사용자번호(user_seq_no) 저장
		session.setAttribute("access_token", responseToken.getAccess_token());
		session.setAttribute("user_seq_no", responseToken.getUser_seq_no());
		
		
		//계좌 인증 후 결과창 관리자&유저 분리 0609 강지훈
		String sId = (String)session.getAttribute("sId");
		
		if(sId == "admin") {
			// model 객체에 target 속성으로 리다이렉트할 페이지 저장(bank_userInfo)
			model.addAttribute("target", "bank_userInfo");
		} else {
			model.addAttribute("target", "bank_memberInfo");
		}
		
		// 성공 처리를 위한 success.jsp 페이지로 포워딩
		// => isClose 속성값을 true 로 전달
		model.addAttribute("isClose", true);
		return "success";
	}
	
	// 사용자 정보 조회 - 관리자
	@GetMapping("/bank_userInfo")
	public String requestUserInfo(HttpSession session, Model model) {
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
		
			return "bank/bank_user_info";
	}
	
	@GetMapping("/product_bank_userInfo")
	public String requestUserInfo(HttpSession session, Model model, @RequestParam int product_price) {
		System.out.println("돈넘어오나!!!!!!!!!!!!!!!!!" + product_price);
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
		
			return "product/bank_user_info"; // "bank/bank_account_detail" 에서 잠깐 변경함
	}
	
	// 계좌 상세정보 조회(2.3.1. 잔액조회 API) - 관리자
	@PostMapping("bank_accountDetail")
	public String getAccountDetail(@RequestParam Map<String, String> map, 
			HttpSession session, 
			Model model, 
			MemberVO member) {
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
		System.out.println("account : " + account);
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
		
		// 0613배하나 (2줄추가)
		String sId = (String) session.getAttribute("sId");
		MemberVO getMemberId = memberService.selectMember(sId);

		// 0614 양선정 추가
		HashMap<String, String> admin = adminService.getAdminInfo();
		model.addAttribute("admin", admin);
		
		// AccountDetailVO 객체 저장
		model.addAttribute("account", account);
		System.out.println("0614- 여기!!!!!!!!!!!!!!!!!!!!!");
		model.addAttribute("account_num_masked", map.get("account_num_masked"));
		model.addAttribute("user_name", map.get("user_name"));
		model.addAttribute("member", getMemberId);
		System.out.println("나오난아ㅏㅏㅇ아ㅏ아아ㅏ아!!!!!!!!!!!!!!!!!" + map.get("account_num_masked"));
		return "bank/bank_account_detail";
		
		
	}
	// 계좌 상세정보 조회(2.3.1. 잔액조회 API)
	@PostMapping("product_bank_accountDetail")
	public String getAccountDetail(@RequestParam Map<String, String> map, 
									HttpSession session, 
									Model model, 
									MemberVO member, 
									@RequestParam int product_idx, 
									@RequestParam int product_price) {
		System.out.println("0613확인!!!!!!!!!!!!!!!!!!!!!!!!" + product_price);
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
		
		// 0613배하나 (2줄추가)
		String sId = (String) session.getAttribute("sId");
		MemberVO getMemberId = memberService.selectMember(sId);
		
		// AccountDetailVO 객체 저장
		model.addAttribute("account", account);
		model.addAttribute("account_num_masked", map.get("account_num_masked"));
		model.addAttribute("user_name", map.get("user_name"));
		model.addAttribute("member", getMemberId);
		
		List<HashMap<String, String>> productDetail = productService.selectProductDetail(product_idx);
		model.addAttribute("productDetail", productDetail);
		List<HashMap<String, String>> fileList = productService.selectFile(); //파일테이블에서 중고상품의 첫번째등록한 이미지만 select
		model.addAttribute("fileList", fileList);
//		 productService.selectMemberInfo(sId);
//		model.addAttribute("selectMemberInfo", productService.selectMemberInfo(sId));
		
		return "product/member_bank_account_detail"; // "bank/bank_account_detail" 에서 잠깐 변경함
	}
	
	
	// 2.5.1. 출금이체 - 관리자
	// 핀테크 이용번호(fintech_use_num) 전달받기 - Map
	@PostMapping("bank_withdraw")
	public String withdraw(@RequestParam Map<String, String> map, 
			HttpSession session, 
			Model model) {
		// 세션 객체의 엑세스토큰을 Map 객체에 추가
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
		String sId = (String)session.getAttribute("sId");
		
		return "bank/withdraw_result";
	}
	// 2.5.1. 출금이체
	// 핀테크 이용번호(fintech_use_num) 전달받기 - Map
	@PostMapping("product_bank_withdraw")
	public String withdraw(@RequestParam Map<String, String> map, 
							HttpSession session, 
							Model model, 
							@RequestParam int product_idx, 
							@RequestParam int product_price) {
		System.out.println("0613확인!!!!!!!!!!!!!!!!!!!!!!!!" + product_idx);
		// 세션 객체의 엑세스토큰을 Map 객체에 추가
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
		String sId = (String)session.getAttribute("sId");
		AccountDetailVO account = apiService.requestAccountDetail(map);
		model.addAttribute("account", account);
		model.addAttribute("account_num_masked", map.get("account_num_masked"));
		model.addAttribute("user_name", map.get("user_name"));
//		model.addAttribute("member", getMemberId);
		model.addAttribute("selectMemberInfo", productService.selectMemberInfo(sId));
		return "product/withdraw_result"; // "bank/bank_account_detail" 에서 잠깐 변경함
	}
	
	// 2.5.1. 경매 출금이체
	// 핀테크 이용번호(fintech_use_num) 전달받기 - Map
	@PostMapping("auction_bank_withdraw")
	public String auctionWithdraw(@RequestParam Map<String, String> map, 
							HttpSession session, 
							Model model, 
							@RequestParam int auction_idx, 
							@RequestParam int auction_final_price) {
		System.out.println("경매 출금 이체 확인 " + auction_idx + " & " + auction_final_price);
		// 세션 객체의 엑세스토큰을 Map 객체에 추가
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
		String sId = (String)session.getAttribute("sId");
		
		return "mypage/withdraw_result";
	}
	
	// 2.5.2. 입금이체 - 관리자
	// 입금 정보 전달받기 - Map
	@PostMapping("bank_deposit")
	public String deposit(@RequestParam Map<String, String> map, 
			HttpSession session, 
			Model model) {
		// 세션 객체의 엑세스토큰을 Map 객체에 추가
		map.put("access_token", (String)session.getAttribute("access_token"));
		logger.info("★★★★★★ 입금 요청 정보 : " + map);
		
		// BankApiService - deposit() 메서드 호출하여 출금이체 요청
		// 파라미터 : Map 객체   리턴타입 : AccountDepositResponseListVO(result)
		AccountDepositListResponseVO result = apiService.deposit(map);
		logger.info("★★★★★★ 입금 요청 처리 결과 : " + result);
		
		// Model 객체에 AccountDepositResponseListVO 객체 저장(속성명 : result)
		model.addAttribute("result", result);
		
		
		
		// 만약, 응답코드(rsp_code) 가 "A0000" 이 아니면, 처리 실패이므로
		// 응답메세지(rsp_message) 를 화면에 출력 후 이전페이지로 돌아가기
		if(!result.getRsp_code().equals("A0000")) {
			model.addAttribute("msg", result.getRsp_message());
			return "fail_back";
		} 
			return "bank/deposit_result";
	}
	// 2.5.2. 입금이체
	// 입금 정보 전달받기 - Map
	@PostMapping("product_bank_deposit")
	public String deposit(@RequestParam Map<String, String> map, 
							HttpSession session, 
							Model model, 
							@RequestParam int product_idx, 
							@RequestParam int product_price) {
		// 세션 객체의 엑세스토큰을 Map 객체에 추가
		map.put("access_token", (String)session.getAttribute("access_token"));
		logger.info("★★★★★★ 입금 요청 정보 : " + map);
		
		// BankApiService - deposit() 메서드 호출하여 출금이체 요청
		// 파라미터 : Map 객체   리턴타입 : AccountDepositResponseListVO(result)
		AccountDepositListResponseVO result = apiService.deposit(map);
		logger.info("★★★★★★ 입금 요청 처리 결과 : " + result);
		
		// Model 객체에 AccountDepositResponseListVO 객체 저장(속성명 : result)
		model.addAttribute("result", result);
		
		
		
		// 만약, 응답코드(rsp_code) 가 "A0000" 이 아니면, 처리 실패이므로
		// 응답메세지(rsp_message) 를 화면에 출력 후 이전페이지로 돌아가기
		if(!result.getRsp_code().equals("A0000")) {
			model.addAttribute("msg", result.getRsp_message());
			return "fail_back";
		} else {
			String sId = (String)session.getAttribute("sId");
			int updateCnt = productService.updateSaleStatus(product_idx);
			int updateMemAdMoney = productService.updateMemAdMoney(sId, product_price);
			int updateMoney = productService.buyerWithdraw(sId, product_price);
			int updateAdMoney = productService.depositAdMoney(sId, product_price);
//			List<HashMap<String, String>> selectByInfo = productService.selectByInfo(product_idx);
			
			Map<String, String> selectByInfo = productService.selectByInfo(product_idx);
			
			int insertBuyProduct = productService.insertBuyProduct(selectByInfo, sId);
			
			return "product/product_deposit_result"; // "bank/bank_account_detail" 에서 잠깐 변경함
		}
	}
	 
	// 2.5.2. 경매 입금이체
	// 입금 정보 전달받기 - Map
	@PostMapping("auction_bank_deposit")
	public String auctionDeposit(@RequestParam Map<String, String> map, 
							HttpSession session, 
							Model model, 
							@RequestParam int auction_idx, 
							@RequestParam int auction_final_price) {
		System.out.println("제발 입금 이체 확인 " + auction_idx + " & " + auction_final_price);
		
		// 세션 객체의 엑세스토큰을 Map 객체에 추가
		map.put("access_token", (String)session.getAttribute("access_token"));
		logger.info("★★★★★★ 입금 요청 정보 : " + map);
		
		// BankApiService - deposit() 메서드 호출하여 출금이체 요청
		// 파라미터 : Map 객체   리턴타입 : AccountDepositResponseListVO(result)
		AccountDepositListResponseVO result = apiService.deposit(map);
		logger.info("★★★★★★ 입금 요청 처리 결과 : " + result);
		
		// Model 객체에 AccountDepositResponseListVO 객체 저장(속성명 : result)
		model.addAttribute("result", result);
		
		
		
		// 만약, 응답코드(rsp_code) 가 "A0000" 이 아니면, 처리 실패이므로
		// 응답메세지(rsp_message) 를 화면에 출력 후 이전페이지로 돌아가기
		if(!result.getRsp_code().equals("A0000")) {
			model.addAttribute("msg", result.getRsp_message());
			return "fail_back";
		} else {
			String sId = (String)session.getAttribute("sId");
			int updateCnt = mypageService.updateAuctionStatus(auction_idx);
			int updateMemAdMoney = mypageService.updateMemAdMoney(sId, auction_final_price);
			int updateMoney = mypageService.buyerWithdraw(sId, auction_final_price);
			int updateAdMoney = mypageService.depositAdMoney(sId, auction_final_price);
			
			
			return "mypage/auction_deposit_result"; // "bank/bank_account_detail" 에서 잠깐 변경함
		}
	}
	
	@GetMapping("/buyConfirm")
	public String payConfirm(HttpSession session
							, Model model
//							, @RequestParam int buy_price
							,@RequestParam Map<String, String> map
								) {
		String buy_price = map.get("buy_price");
		String buy_seller = map.get("buy_seller");
		String product_idx = map.get("product_idx");
//		System.out.println("아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ buy_price : " + buy_price + "      판매자아이디 : " + buy_seller );
		int updateAdMoney = productService.withdrawAdMoney(buy_price, buy_seller);
		int updateMoney = productService.buyerDeposit(buy_price, buy_seller);
		int updateStatus = productService.updateStatus(product_idx);
		String sId = (String)session.getAttribute("sId");
		int updateBuyerPoint = productService.updateBuyerPoint(sId); 
		
		return "redirect:/myPage.me";
	}
	
	@GetMapping("/buyAuctionConfirm")
	public String buyAuctionConfirm(HttpSession session, Model model ,@RequestParam Map<String, String> map) {
		String auction_final_price = map.get("auction_final_price");
		String member_id = map.get("member_id");
		int updateAdMoney = mypageService.withdrawAdMoney(auction_final_price, member_id);
		int updateMoney = mypageService.buyerDeposit(auction_final_price, member_id);
//		int updateCnt = mypageService.updateAuctionStatus(auction_idx);
		
		return "redirect:/myPage.me";
	}
	
} //컨트롤러끝 














