package com.itwillbs.clever.controller;

import java.io.*;
import java.nio.file.*;
import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.itwillbs.clever.common.util.*;
import com.itwillbs.clever.service.*;
import com.itwillbs.clever.vo.*;

import retrofit2.http.*;

@Controller
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	FileUpload FileUpload;
	
	// 굿즈 스토어 목록으로 이동
	@GetMapping(value = "/goodsStore.ad")
	public String goodsStore(Model model) {
		
		List<HashMap<String, String>> goodsList = goodsService.getGoodsList();
		model.addAttribute("goodsList", goodsList);
		
		List<HashMap<String, String>> fileList = goodsService.selectFile();
		model.addAttribute("fileList", fileList);
		System.out.println("파일 확인 ------------------------" + fileList);
		
		
		return "goods/goods_list";
	}
	
	// 굿즈 등록 페이지 
	@GetMapping(value = "/storeRegister.ad")
	public String storeRegister() {
		return "admin/goods_store_register_form";
	}
	
	// 굿즈 등록
	@PostMapping(value = "/goodsRegisterPro.ad")
	public String goodsRegisterPro(GoodsVO goods, HttpSession session, Model model, MultipartFile[] file) {
		
		int insertCount = goodsService.insertGoods(goods);
		
		//---------- 파일 업로드 관련 작업 시작 -----------------------------------------------------------
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("file_div", "goods");
		paramMap.put("file_num", goodsService.selectMax());
		
		FileUpload.upload(file, session, paramMap);
		
		if(insertCount > 0) {
			model.addAttribute("msg", "굿즈 등록이 완료되었습니다.");
			return "redirect:/storeList.ad";
		} else {
			model.addAttribute("msg", "굿즈 등록 실패!");
			return "fail_back";
		}
		
	}
	
	// 굿즈 등록 수정 페이지 
	@GetMapping(value = "/storeModify.ad")
	public String storeModify(@RequestParam int goods_idx, Model model) {
		
		HashMap<String, String> goods = goodsService.getGoods(goods_idx);
		model.addAttribute("goods", goods);
		
		// 파일 셀렉트
		List<HashMap<String, String>> filesList = goodsService.selectGoodsFiles();
		model.addAttribute("filesList", filesList);
		
		return "admin/goods_store_modify_form";
	}
	
	@PostMapping(value = "/storeModifyPro.ad")
	public String storeModifyPro(GoodsVO goods, HttpSession session, Model model) {
		
		
//		for(int i=0; i<file.length; i++) {
//			System.out.println("file 배열 for문" + file[i]);
//		}
		
		int updateCount = goodsService.updateGoods(goods);
		
		
		if(updateCount > 0) {
			return "redirect:/storeList.ad";
		} else {
			model.addAttribute("msg", "굿즈 수정 실패!");
			return "fail_back";
		}
		
	}
	
	@PostMapping(value = "/deleteGoodsFile")
	@ResponseBody
	public String deleteGoodsFile(FileVO file, @RequestParam String file_name, Model model) {
		System.out.println("파일 넘어 오나요? " + file_name + ", " + file.getFile_name());
		
		int deleteCount = goodsService.deleteGoodsFile(file);
		if(deleteCount > 0) {
			return "redirect:/storeModify.ad";
		} else {
			model.addAttribute("msg", "파일 삭제 실패!");
			return "fail_back";
		}
	}
	
	
	// 현재 판매 중인 굿즈 목록 조회
	@GetMapping(value = "/storeList.ad")
	public String storeList(Model model) {
		
		List<HashMap<String, String>> goodsList = goodsService.getGoodsList();
		model.addAttribute("goodsList", goodsList);
		
		List<HashMap<String, String>> fileList = goodsService.selectFile();
		model.addAttribute("fileList", fileList);
		System.out.println("파일 확인 ------------------------" + fileList);
		
		return "admin/goods_store_list";
	}
	
	// 굿즈 상세보기
	@GetMapping(value = "/goodsDetail.ad")
	public String goodsDetail(@RequestParam int goods_idx, Model model) {
		
		List<HashMap<String, String>> goodsDetail = goodsService.getGoodsDetail(goods_idx);
		model.addAttribute("goodsDetail", goodsDetail);
		
		// 첫번째 이미지만 셀렉트
		List<HashMap<String, String>> fileList = goodsService.selectFile();
		model.addAttribute("fileList", fileList);
		
		// 전체 셀렉트
		List<HashMap<String, String>> filesList = goodsService.selectFiles();
		model.addAttribute("filesList", filesList);
		
		return "goods/goods_detail";
	}
	
	// 굿즈 결제 페이지 
	@GetMapping(value = "/payGoods")
	public String payGoods(@RequestParam int goods_idx, HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("sId");
		
		List<HashMap<String, String>> goodsDetail = goodsService.getGoodsDetail(goods_idx);
		model.addAttribute("goodsDetail", goodsDetail);
		
		List<HashMap<String, String>> fileList = goodsService.selectFile();
		model.addAttribute("fileList", fileList);
		
		MemberVO member = goodsService.getMemberInfo(id);
		model.addAttribute("member", member);
		
		return "goods/goods_pay_form";
	}
	
}






















































