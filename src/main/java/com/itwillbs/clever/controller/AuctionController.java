package com.itwillbs.clever.controller;

import java.util.*;

import org.springframework.stereotype.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.itwillbs.clever.vo.*;

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
	
	@PostMapping(value = "auction_upload_pro")
	public String auction_upload_pro(@RequestParam Map<String, String> map, @RequestParam("auction_images") MultipartFile[] images) {
		String[] categorys = map.get("auction_category").split(" > ");
		map.put("auction_Lcategory", categorys[0]);
		map.put("auction_Mcategory", categorys[1]);
		map.put("auction_Scategory", categorys[2]);
		System.out.println(map);
		for (MultipartFile image : images) {
	        // 각 이미지 파일에 대한 처리 수행
	        // 파일을 읽거나 데이터베이스에 저장하는 등의 작업 수행
			System.out.println(image);
	    }
		
		return "";
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
