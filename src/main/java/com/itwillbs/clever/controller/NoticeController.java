package com.itwillbs.clever.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class NoticeController {

	@GetMapping(value = "/noticeMain.ad")
	public String noticeMain() {
		return "notice/notice_main";
	}
	
}


















































