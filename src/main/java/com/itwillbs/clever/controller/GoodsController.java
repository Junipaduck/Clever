package com.itwillbs.clever.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class GoodsController {
	
	// 굿즈 스토어 목록으로 이동
	@GetMapping(value = "/goodsStore.ad")
	public String goodsStore() {
		return "goods/goods_list";
	}
	
}






















































