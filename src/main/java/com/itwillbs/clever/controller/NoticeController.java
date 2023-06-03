package com.itwillbs.clever.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.clever.service.*;
import com.itwillbs.clever.vo.*;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@GetMapping(value = "/noticeMain.ad")
	public String noticeMain(Model model) {
		
		List<HashMap<String, String>> noticeList = noticeService.getNoticeList();
		model.addAttribute("noticeList", noticeList);
		
		return "notice/notice_main";
	}
	
	// 관리자 페이지 공지사항 리스트
	@GetMapping(value = "/adminNoticeList.ad")
	public String adminNoticeList(Model model) {
		
		List<HashMap<String, String>> adminNoticeList = noticeService.getNoticeList();
		model.addAttribute("adminNoticeList", adminNoticeList);
		
		return "admin/admin_notice_list";
	}
	
	
	
	// 공지사항 작성 폼 이동
	@GetMapping(value = "/noticeForm.ad")
	public String noticeForm() {
		
		return "notice/notice_form";
	}
	
	// 공지사항 작성
	@PostMapping(value = "/noticeFormPro.ad")
	public String noticeFormPro(NoticeVO notice, Model model) {
		
		int insertCount = noticeService.registerNotice(notice);
		
		if(insertCount > 0) {
			return "redirect:/adminNoticeList.ad";
		} else {
			model.addAttribute("msg", "공지사항 등록 실패!");
			return "fail_back";
		}
		
	}
}


















































