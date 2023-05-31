package com.itwillbs.clever.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.itwillbs.clever.common.util.*;
import com.itwillbs.clever.service.*;
import com.itwillbs.clever.vo.*;

@Controller
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	FileUpload FileUpload;
	
	// 굿즈 스토어 목록으로 이동
	@GetMapping(value = "/goodsStore.ad")
	public String goodsStore() {
		return "goods/goods_list";
	}
	
	// 굿즈 등록 페이지 
	@GetMapping(value = "/storeRegister.ad")
	public String storeRegister() {
		return "admin/goods_store_register_form";
	}
	
	@PostMapping(value = "/goodsRegisterPro.ad")
	public String goodsRegisterPro(GoodsVO goods, HttpSession session, Model model, MultipartFile[] file) {
		
//		System.out.println("------------------------------------ goods" + goods);
//		goods.setGoods_file(goods.getFile().getOriginalFilename());
		
		int insertCount = goodsService.insertGoods(goods);
		
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("file_div", "goods");
		paramMap.put("file_num", goodsService.selectMax());
		FileUpload.upload(file, session, paramMap);
		
		String result = "";
		if(insertCount > 0) {
			model.addAttribute("msg", "등록이 완료되었습니다.");
			model.addAttribute("target", "goods_store_list");
			result = "success";
		} else {
			model.addAttribute("msg", "등록이 실패하였습니다.");
			result = "fail_back";
		}
		
		return result;
	}
	
	// 굿즈 등록 수정 페이지 
	@GetMapping(value = "/storeModify.ad")
	public String storeModify() {
		return "admin/goods_store_modify_form";
	}
	
}






















































