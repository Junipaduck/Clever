package com.itwillbs.clever.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {

	// 중고거래 - 구매내역 페이지 포워딩
	@GetMapping("/shPurchaseList.my")
	public String shPurchaseList() {
		return "mypage/secondhand_purchase_list";
	}
}
