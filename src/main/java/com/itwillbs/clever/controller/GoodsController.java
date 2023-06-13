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

import com.google.protobuf.*;
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
	public String goodsRegisterPro(GoodsVO goods
									, @RequestParam("image1") MultipartFile file1
									, @RequestParam("image2") MultipartFile file2
									, @RequestParam("image3") MultipartFile file3
									, @RequestParam("image4") MultipartFile file4
									, @RequestParam("image5") MultipartFile file5
									, @RequestParam("image6") MultipartFile file6
									, @RequestParam("image7") MultipartFile file7
									, @RequestParam("image8") MultipartFile file8
									, @RequestParam("image9") MultipartFile file9
									, @RequestParam("image10") MultipartFile file10
									, @RequestParam("image11") MultipartFile file11
									, @RequestParam("image12") MultipartFile file12
								    , HttpSession session, Model model) {
		
		int insertCount = goodsService.insertGoods(goods);
		
		MultipartFile[] fArr = {file1,file2,file3,file4,file5,file6,file7,file8,file9,file10,file11,file12};
		ArrayList<MultipartFile> file = new ArrayList<MultipartFile>();
		System.out.println(fArr); 
		for(int i = 0; i < fArr.length; i++) {
			if(!fArr[i].getOriginalFilename().equals("")) {
				file.add(fArr[i]);
			}
		}
		System.out.println(file);
		
		
		//---------- 파일 업로드 관련 작업 시작 -----------------------------------------------------------
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("file_div", "goods");
		paramMap.put("file_num", goodsService.selectMax());
		FileUpload.upload(file, session, paramMap);


		
		if(insertCount > 0) {
			model.addAttribute("msg", "굿즈 등록이 완료되었습니다.");
			model.addAttribute("target", "storeList.ad");
			return "success";
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
	public String storeModifyPro(@RequestParam Map<String, String> map
								, @RequestParam("image1") MultipartFile file1
								, @RequestParam("image2") MultipartFile file2
								, @RequestParam("image3") MultipartFile file3
								, @RequestParam("image4") MultipartFile file4
								, @RequestParam("image5") MultipartFile file5
								, @RequestParam("image6") MultipartFile file6
								, @RequestParam("image7") MultipartFile file7
								, @RequestParam("image8") MultipartFile file8
								, @RequestParam("image9") MultipartFile file9
								, @RequestParam("image10") MultipartFile file10
								, @RequestParam("image11") MultipartFile file11
								, @RequestParam("image12") MultipartFile file12
								, HttpSession session
								, Model model) {
		
		MultipartFile[] fArr = {file1,file2,file3,file4,file5,file6,file7,file8,file9,file10,file11,file12};
		ArrayList<MultipartFile> file = new ArrayList<MultipartFile>();
		System.out.println(fArr); 
		for(int i = 0; i < fArr.length; i++) {
			if(!fArr[i].getOriginalFilename().equals("")) {
				file.add(fArr[i]);
			}
		}
		if(!file.isEmpty()) {
			int goods_idx = Integer.parseInt(map.get("goods_idx"));
			int deleteCount = goodsService.deleteGoodsFile(goods_idx);
			System.out.println("이까지 오나?!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			if(deleteCount > 0) {
				Map<String, Object> paramMap = new HashMap<String, Object>();
				paramMap.put("file_div", "goods");
				paramMap.put("file_num", map.get("goods_idx"));
				FileUpload.upload(file, session, paramMap);
			}
		}
		
		int updateCount = goodsService.updateGoods(map);
		
		
		if(updateCount > 0) {
			model.addAttribute("msg", "수정이 완료되었습니다!");
			model.addAttribute("target", "storeList.ad");
			return "success";
		} else {
			model.addAttribute("msg", "굿즈 수정 실패!");
			return "fail_back";
		}
		
	}
	
//	@PostMapping(value = "/deleteGoodsFile")
//	@ResponseBody
//	public String deleteGoodsFile(FileVO file, @RequestParam String file_name, Model model) {
//		System.out.println("파일 넘어 오나요? " + file_name + ", " + file.getFile_name());
//		
//		int deleteCount = goodsService.deleteGoodsFile(file);
//		if(deleteCount > 0) {
//			return "redirect:/storeModify.ad";
//		} else {
//			model.addAttribute("msg", "파일 삭제 실패!");
//			return "fail_back";
//		}
//	}
	
	
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
		
		// 굿즈 상세 정보
		List<HashMap<String, String>> goodsDetail = goodsService.getGoodsDetail(goods_idx);
		model.addAttribute("goodsDetail", goodsDetail);
		
		List<HashMap<String, String>> fileList = goodsService.selectFile();
		model.addAttribute("fileList", fileList);
		
		// 구매자 정보 조회
		MemberVO member = goodsService.getMemberInfo(id);
		model.addAttribute("member", member);
		
		return "goods/goods_pay_form";
	}
	
	
	// 굿즈 결제 처리
	@GetMapping(value = "/buyGoods.ad")
	public String buyGoods(@RequestParam int goods_idx, HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("sId");
		
		GoodsVO goods = goodsService.selectGoodsPrice(goods_idx);
		MemberVO member = goodsService.selectMemberPoint(id);
		model.addAttribute("goods", goods);
		model.addAttribute("member", member);
		
		System.out.println("여기에 가격이 찍히나??" + goods.getGoods_price() + "포인트 : " + member.getMember_point());
		
		int point = member.getMember_point();
		int goods_price = Integer.parseInt(goods.getGoods_price());
		String buy_title = goods.getGoods_name();
		String buy_price = goods.getGoods_price();
		
		
		if(point > goods_price) { // 포인트가 굿즈 가격보다 높을 때 
			int updateCount = goodsService.buyGoods(id, goods_price); // 포인트에서 굿즈 가격 차감
			
			
			if(updateCount > 0) { // 포인트 차감 성공 시 
				
				// 결제 내역  buyGoods 에 insert
				int insertCount = goodsService.insertBuyGoods(id, buy_title, buy_price, goods_idx);
				// 굿즈 재고 차감
				int updateGoods = goodsService.updateStock(goods_idx);
				
				if(insertCount > 0 && updateGoods > 0) { // 결제내역 insert 성공시
					return "goods/goods_pay_pro";
				} else {
					model.addAttribute("msg", "결제 내역 insert 실패!");
					return "fail_back";
				}
				
				
			} else {
				model.addAttribute("msg", "결제 실패!");
				return "fail_back";
			}
			
		} else { // 포인트가 부족할 때 
			model.addAttribute("msg", "포인트가 부족합니다!");
			return "fail_back";
		}
		
		
		
	}
}






















































