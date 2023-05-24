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
	
	@GetMapping(value = "auction_upload")
	public String auction_upload() {
		return "auction/auction_upload";
	}
	
	@GetMapping(value = "auction_management")
	public String auction_management() {
		return "auction/auction_management";
	}
	
	@GetMapping(value = "auction_sell")
	public String auction_sell() {
		return "auction/auction_sell";
	}
	
	@GetMapping(value = "auction_buy")
	public String auction_buy() {
		return "auction/auction_buy";
	}
	
}
