package com.itwillbs.clever.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.clever.service.CustomerCenterService;

@Controller
public class CustomerCenterController {
	
	@Autowired
	private CustomerCenterService customerCenterService;
	
	// 자주묻는질문
	@GetMapping("/FAQ")
	public String FAQ(@RequestParam Map<String, String> map, Model model) {
		List FAQcategory = customerCenterService.FAQcategory(map.get("param"));
		model.addAttribute("FAQcategory", FAQcategory);
		return "customer_center/FAQ";
	}
	
	// 자주묻는질문 상세페이지
	@GetMapping("/FAQdetail")
	public String FAQdetail(@RequestParam Map<String, String> map, Model model, @RequestParam int FAQ_idx) {
		List FAQlist = customerCenterService.FAQlist(FAQ_idx);
		model.addAttribute("FAQlist", FAQlist);
		return "customer_center/FAQ_detail";
	}
	
	// 자주묻는질문 관리자용 글작성폼으로 포워딩
	@GetMapping("/FAQwriteForm")
	public String FAQwriteForm() {
		return "customer_center/FAQ_write_form";
	}
	
	// 자주묻는질문 관리자용 글작성 Pro
	@PostMapping("/FAQwritePro")
	public String FAQwritePro(@RequestParam Map<String, String> map, Model model) {
		map.put("FAQ_category", map.get("FAQ_category"));
		map.put("FAQ_subject", map.get("FAQ_subject"));
		map.put("FAQ_content", map.get("FAQ_content"));
		int insertCount = customerCenterService.insertFAQ(map);
		if(insertCount < 0 ) {
			model.addAttribute("msg", "글 등록 실패");
			return "fail_back";
		} else {
			model.addAttribute("msg", "글 등록 성공");
			model.addAttribute("target", "FAQ");
			return "success";
		}
	}
	
	
} // 컨트롤러 끝
