package com.itwillbs.clever.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class CommunityController {
	
	@GetMapping(value = "community")
	public String community() {
		
		return "community/community_main";
	}
}
