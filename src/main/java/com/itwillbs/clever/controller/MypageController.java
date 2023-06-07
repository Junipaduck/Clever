package com.itwillbs.clever.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.clever.service.*;
import com.itwillbs.clever.vo.*;

@Controller
public class MypageController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MypageService mypageservice;
	
	@Autowired
	private ProductService productService;
	
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
		
		List<HashMap<String, String>> onSaleproduct = mypageservice.selectOnSaleProduct(sId);
		model.addAttribute("onSaleproduct", onSaleproduct);
		
		List<HashMap<String, String>> fileList = productService.selectFile(); //파일테이블에서 중고상품의 첫번째등록한 이미지만 select
		model.addAttribute("fileList", fileList);
		
		
		return "mypage/my_page";
	}
		
}
