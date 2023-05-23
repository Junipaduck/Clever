package com.itwillbs.clever.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuctionController {

	@GetMapping(value = "auction")
	public String auction() {
		return "auction";
	}
	
}
