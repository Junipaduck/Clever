package com.itwillbs.clever.controller;

import java.io.*;
import java.nio.file.*;
import java.text.*;
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
	public String goodsStore(Model model) {
		
		List<HashMap<String, String>> goodsList = goodsService.getGoodsList();
		model.addAttribute("goodsList", goodsList);
		
		return "goods/goods_list";
	}
	
	// 굿즈 등록 페이지 
	@GetMapping(value = "/storeRegister.ad")
	public String storeRegister() {
		return "admin/goods_store_register_form";
	}
	
	// 굿즈 등록
	@PostMapping(value = "/goodsRegisterPro.ad")
	public String goodsRegisterPro(GoodsVO goods, HttpSession session, Model model) {
	   	// 파일 업로드 경로 설정  
    	String uploadDir = "resources/upload"; // sts에서 저장되는 경로(이 곳에 실제로 파일이 업로드 되지는 않음) 
    	String saveDir = session.getServletContext().getRealPath(uploadDir); // 실제 파일이 저장되는 경로 
    	
    	// 날짜별로 업로드 폴더 생성
    	try {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			goods.setGoods_file_path("/" + sdf.format(date));
			
			// 기본 업로드 경로와 서브 디렉토리 경로를 결합하여 저장 
			saveDir = saveDir + goods.getGoods_file_path();
			
			// Paths 클래스의 get() 메서드 호출하여 실제 경로를 관리하는 Path 타입 객체 리턴 받기 (파라미터: 실제 업로드 경로) 
			Path path = Paths.get(saveDir);
			
			// Files 클래스의 메서드를 호출하여 Path 객체가 관리하는 경로가 없으면 생성 
			Files.createDirectories(path);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	MultipartFile mFile = goods.getFile(); // 단일 파일 
    	String originalFileName = mFile.getOriginalFilename(); // 원본 파일 명 
    	
    	// 파일명 중복 방지를 위한 랜던 ID값 생성 
    	String uuid = UUID.randomUUID().toString();
    	
    	// 생성된  UUID 값을 원본 파일명과 결합하기. subString으로 길이 줄이기 
    	// 랜덤 uuid - 하이픈 앞 글자수가 8개 이므로 인덱스 범위가 0, 8 
    	goods.setGoods_file(uuid.substring(0, 8) + "_" + originalFileName);
    	System.out.println("실제 업로드 될 파일명 : " + goods.getGoods_file());
    	
    	// 굿즈 등록 코드 시작
    	int insertCount = goodsService.insertGoods(goods);
    	
    	if(insertCount > 0) {
       		try {
    				mFile.transferTo(new File(saveDir, goods.getGoods_file()));
    			} catch (IllegalStateException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			} catch (IOException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
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
		
		return "admin/goods_store_modify_form";
	}
	
	@PostMapping(value = "/storeModifyPro.ad")
	public String storeModifyPro() {
		return "redirect:/storeList.ad";
	}
	
	// 현재 판매 중인 굿즈 목록 조회
	@GetMapping(value = "/storeList.ad")
	public String storeList(Model model) {
		
		List<HashMap<String, String>> goodsList = goodsService.getGoodsList();
		model.addAttribute("goodsList", goodsList);
		
		return "admin/goods_store_list";
	}
	
	
}






















































