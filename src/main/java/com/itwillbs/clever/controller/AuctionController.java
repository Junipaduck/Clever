package com.itwillbs.clever.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuctionController {

	@GetMapping(value = "auction")
	public String auction() {
		return "auction/auction";
	}
	
	@GetMapping(value = "auction_list")
	public String auction_list() {
		return "auction/auction_list";
	}
	
	@GetMapping(value = "auction_detail")
	public String auction_detail() {
		return "auction/auction_detail";
	}
	
}
