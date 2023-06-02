package com.itwillbs.clever.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class NoticeController {

	@GetMapping(value = "/noticeMain.ad")
	public String noticeMain() {
		return "notice/notice_main";
	}
	
	
	// 공지사항 작성 폼 이동
	@GetMapping(value = "/noticeForm.ad")
	public String noticeForm() {
		
		return "notice/notice_form";
	}
}


















































