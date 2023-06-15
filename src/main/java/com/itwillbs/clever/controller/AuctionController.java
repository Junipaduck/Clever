package com.itwillbs.clever.controller;

import java.io.*;
import java.nio.file.*;
import java.text.*;
import java.time.*;
import java.time.format.*;
import java.util.*;

import javax.servlet.http.*;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.bcrypt.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.google.gson.JsonArray;
import com.itwillbs.clever.common.util.*;
import com.itwillbs.clever.service.*;
import com.itwillbs.clever.vo.*;

import reactor.core.publisher.*;

@Controller
public class AuctionController {

	@Autowired
	private AuctionService auctionService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AuctionLogService auctionLogService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	FileUpload upload;
	
	@GetMapping(value = "auction")
	public String auction(Model model) {
		List imminentList = auctionService.selectImminent();
		List hotList = auctionService.selectHotList();
		List currentList = auctionService.selectCurrent();
		List fileList = auctionService.selectFiles();
		
//		for(int i = 0; i < imminentList.size() - 1; i++) {
//			imminentList.get(i).
//		}
//		
			
		model.addAttribute("imminentList", imminentList);
		System.out.println(imminentList);
		model.addAttribute("hotList", hotList);
		model.addAttribute("currentList", currentList);
		model.addAttribute("fileList", fileList);
		System.out.println(fileList);
		
		return "auction/auction";
	}
	
	// 로그아웃 기능
		@GetMapping(value = "auction_logout")
		public String logout(HttpSession session) {
			session.invalidate(); // 세션 초기화 
			return "redirect:/auction"; // 로그아웃 후 메인화면으로 리다이렉트 이동 
		}
	
	@GetMapping(value = "auction_loginForm")
	public String auction_loginForm() {
		return "auction/auction_login_form";
	}
	
	@PostMapping(value = "auction_loginPro")
	public String LoginPro(MemberVO member, HttpSession session, Model model) {
			
			System.out.println("아이디 : " + member.getMember_id() + ", 패스워드 : " + member.getMember_passwd());
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String passwd = memberService.getPasswd(member);
			if(encoder.matches(member.getMember_passwd(), passwd)) {
				member.setMember_passwd(passwd);
				boolean isSuccess = memberService.isSuccessMember(member);
				System.out.println(isSuccess);
				if(isSuccess) {
					//로그인 성공 시 세션 객체에 아이디 저장 
					session.setAttribute("sId", member.getMember_id());
					return "redirect://auction"; // 로그인 성공 시 -> main 페이지로 리다이렉트 이동 
				} else {
					model.addAttribute("msg","로그인 실패!");
					return "fail_back";
				}	
			} else {
				model.addAttribute("msg","로그인 실패!");
				return "fail_back";
			}
			
		}
	
	@GetMapping(value = "auction_list")
	public String auction_list(@RequestParam Map<String, String> map, Model model) {
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + map.get("status"));
		List productList = auctionService.getProductList(map.get("param"),map.get("status"));
		List fileList = auctionService.selectFiles();
		String bigCategory = auctionService.getBigCategory(map.get("param"));
		List bigCategorys = auctionService.getBigCategorys();
		List midCategorys = auctionService.getMidCategorys(map.get("param"));
		System.out.println(midCategorys);
		List smallCategorys = auctionService.getSmallCategorys(map.get("param"));
		System.out.println("???????" + smallCategorys);
		if(bigCategory == null) {
			List midCategory = auctionService.getMidCategory(map.get("param"));
			System.out.println("midCategory : " + midCategory);
			if(midCategory.size() < 1) {
				List smallCategory = auctionService.getSmallCategory(map.get("param"));
				System.out.println("smallCategory : " + smallCategory);
				model.addAttribute("smallCategory", smallCategory);
			} else {
				model.addAttribute("midCategory", midCategory);
			}
		} else {
			System.out.println("bigCategory : " + bigCategory);
			model.addAttribute("bigCategory", bigCategory);
		}
		
		
		
		model.addAttribute("fileList", fileList);
		model.addAttribute("bigCategorys", bigCategorys);
		model.addAttribute("midCategorys", midCategorys);
		model.addAttribute("smallCategorys", smallCategorys);
		model.addAttribute("productList", productList);
		model.addAttribute("categoryParam", map.get("param"));
		
		return "auction/auction_list";
	}
	
	
	
	@GetMapping(value = "auction_detail")
	public String auction_detail(HttpSession session, Model model, @RequestParam int auction_idx, @RequestParam String param) {
		Date nowDate = new Date();
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			model.addAttribute("msg","로그인 후 이용해주세요!");
			model.addAttribute("target","auction_loginForm");
			return "success";
		}
		String member_id = auctionService.depositList(sId, auction_idx);
		System.out.println(member_id + "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
		List<LogRoomVO> logList = auctionLogService.selectLogList(auction_idx);
		
		int logRoomIdx = 0;
		if (!logList.isEmpty()) {
			logRoomIdx = logList.get(0).getLogRoom_idx();
		}
		
		List fileList = auctionService.selectFilesIdx(auction_idx);
		List fileList2 = auctionService.selectFiles();
		String bigCategory = auctionService.getBigCategory(param);
		List bigCategorys = auctionService.getBigCategorys();
		List midCategorys = auctionService.getMidCategorys(param);
		System.out.println(midCategorys);
		List smallCategorys = auctionService.getSmallCategorys(param);
		System.out.println("???????" + smallCategorys);
		if(bigCategory == null) {
			List midCategory = auctionService.getMidCategory(param);
			System.out.println("midCategory : " + midCategory);
			if(midCategory.size() < 1) {
				List smallCategory = auctionService.getSmallCategory(param);
				System.out.println("smallCategory : " + smallCategory);
				model.addAttribute("smallCategory", smallCategory);
			} else {
				model.addAttribute("midCategory", midCategory);
			}
		} else {
			System.out.println("bigCategory : " + bigCategory);
			model.addAttribute("bigCategory", bigCategory);
		}
		List relationList = auctionService.getRelationList(param);
		
		model.addAttribute("relationList", relationList);
		model.addAttribute("bigCategorys", bigCategorys);
		model.addAttribute("midCategorys", midCategorys);
		model.addAttribute("smallCategorys", smallCategorys);
		model.addAttribute("categoryParam", param);
		model.addAttribute("member_id", member_id);
		model.addAttribute("nowDate", nowDate);
		
		model.addAttribute("fileList", fileList);
		model.addAttribute("fileList2", fileList2);
		System.out.println(fileList);
		model.addAttribute("logList", logList);
		model.addAttribute("logRoomIdx", logRoomIdx);
		System.out.println("chatList!!!!!!!!!!!!!!! : " + logList);
		System.out.println("logRoomIdx!!!!!!!!!!!!!!!! : " + logRoomIdx);
		int readCount = auctionService.readCountUp(auction_idx);
		int dibsCount = auctionService.dibsCount(auction_idx);
		Map detailmap = auctionService.detailList(auction_idx);
		List<String> sellerAutions = auctionService.sellerAutions((String)detailmap.get("member_id"));
		int sellerInfoCount = auctionService.sellerInfoCount((String)detailmap.get("member_id"));
		model.addAttribute("sellerAutions", sellerAutions);
		model.addAttribute("sellerInfoCount", sellerInfoCount);
		
		String[] strArr = detailmap.get("auction_date").toString().split("T");
		detailmap.put("date", strArr[0]);
		detailmap.put("dibsCount", dibsCount);
		model.addAttribute("detailmap", detailmap);
		
		HashMap<String, String> priceMap = new HashMap<String, String>();
		
		int MessageCount = auctionLogService.selectAuctionMessage(auction_idx, sId);
		
		if(MessageCount>=1) {
			priceMap = auctionLogService.seletAuctionPrice(auction_idx, sId);
		} else {
			priceMap.put("message_content", "0");
		}
		
		model.addAttribute("selectAuctionPrice", priceMap);
		
		
		// 찜하기
		DibsVO dibs = new DibsVO();
		dibs.setDibs_type("product");
		dibs.setType_num(auction_idx);
		dibs.setMember_id(sId);		
		
		DibsVO dibsCheck = productService.selectDibsCheck(dibs);
		
		if(dibsCheck != null) {
		} else {
			dibsCheck = new DibsVO();
			dibsCheck.setDibs_check(0);
		} 
		model.addAttribute("result", dibsCheck);
		
		return "auction/auction_detail";
	}
	
	@GetMapping(value = "auction_detail_modify")
	public String auction_detail_modify(@RequestParam int auction_idx, Model model) {
		Map detailmap = auctionService.detailList(auction_idx);
		System.out.println(detailmap);
		String[] strs = detailmap.get("auction_start").toString().split("T");
		String[] strs2 = detailmap.get("auction_end").toString().split("T");
		
		detailmap.put("auction_start_date", strs[0]); 		
		detailmap.put("auction_start_time", strs[1]); 		
		detailmap.put("auction_end_date", strs2[0]); 		
		detailmap.put("auction_end_time", strs2[1]);
		
		
		model.addAttribute("detailmap", detailmap);
		
		return "auction/auction_detail_modify";
	}
	
	@PostMapping(value = "auction_detail_modifyPro")
	public String auction_detail_modifyPro(@RequestParam Map<String, String> map
											, Model model
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
											, HttpSession session) {
		
		MultipartFile[] fArr = {file1,file2,file3,file4,file5,file6,file7,file8,file9,file10,file11,file12};
		ArrayList<MultipartFile> file = new ArrayList<MultipartFile>();
		System.out.println(fArr); 
		for(int i = 0; i < fArr.length; i++) {
			if(!fArr[i].getOriginalFilename().equals("")) {
				file.add(fArr[i]);
			}
		}
		if(!file.isEmpty()) {
			int auction_idx = Integer.parseInt(map.get("auction_idx")) ;
			int deleteCnt = auctionService.deleteAutionFile(auction_idx);
			System.out.println("이까지 오나?!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			if(deleteCnt > 0) {
				System.out.println("이까지 오나?");
				Map<String, Object> paramMap = new HashMap<String, Object>();
				paramMap.put("file_div", "auction");
				paramMap.put("file_num", map.get("auction_idx"));
				upload.upload(file, session, paramMap);
			}
		}
		System.out.println("자 드가자~!" + map);
		// 카테고리 분류
		String[] categorys = map.get("auction_category").split(" > ");
		map.put("auction_Lcategory", categorys[0]);
		map.put("auction_Mcategory", categorys[1]);
		map.put("auction_Scategory", categorys[2]);
		// 카테고리 분류 끝
		// 경매 시작일 및 경매 종료일 코드 입력
		map.put("auction_start", map.get("auction_start_date") + " " + map.get("auction_start_time"));
		map.put("auction_end", map.get("auction_end_date") + " " + map.get("auction_end_time"));
		int modifyCnt = auctionService.detailModify(map);
		
		if(modifyCnt > 0) {
			model.addAttribute("msg", "수정 성공!");
			model.addAttribute("target", "auction");
			return "success";
		} else {
			model.addAttribute("msg", "수정 실패!");
			return "fail_back";
		}
	}
	
	
	
	@GetMapping(value = "auction_upload")
	public String auction_upload(Model model, HttpSession session) {
//		System.out.println(map);
		String sId = (String)session.getAttribute("sId");
		Map<String, String> member = auctionService.getMember(sId);
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인 후 이용해주세요.");
			model.addAttribute("target", "auction_loginForm");
			return "success";
		}
		String memberAccountAuth = productService.selectMemberAccountAuth(sId);
		if(memberAccountAuth.equals("Y")) {
			System.out.println("계좌인증완료된 회원입니다!!!!!!!!!");
			model.addAttribute("member", member);
			return "auction/auction_upload";
		} else {
			model.addAttribute("msg", "계좌인증을 완료해주세요.");
			model.addAttribute("target", "myPage.me");
			return "success";
		}
		
		
	}
	
	@PostMapping(value = "auction_upload_pro")
	public String auction_upload_pro(@RequestParam Map<String, String> map
//									, @RequestParam("auction_images") MultipartFile[] file
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
		MultipartFile[] fArr = {file1,file2,file3,file4,file5,file6,file7,file8,file9,file10,file11,file12};
		ArrayList<MultipartFile> file = new ArrayList<MultipartFile>();
		System.out.println(fArr); 
		for(int i = 0; i < fArr.length; i++) {
			if(!fArr[i].getOriginalFilename().equals("")) {
				file.add(fArr[i]);
			}
		}
		System.out.println(file);
	
		
		String id = (String)session.getAttribute("sId");
		// 카테고리 분류
		String[] categorys = map.get("auction_category").split(" > ");
		map.put("auction_Lcategory", categorys[0]);
		map.put("auction_Mcategory", categorys[1]);
		map.put("auction_Scategory", categorys[2]);
		// 카테고리 분류 끝
		// 경매 시작일 및 경매 종료일 코드 입력
		map.put("auction_start", map.get("auction_start_date") + " " + map.get("auction_start_time"));
		map.put("auction_end", map.get("auction_end_date") + " " + map.get("auction_end_time"));
		System.out.println(map);
		int insertAuction = auctionService.insertAutcion(map,id);
		// 종료
		
		//---------- 파일 업로드 관련 작업 시작 -----------------------------------------------------------
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("file_div", "auction");
		paramMap.put("file_num", auctionService.selectMax());
		upload.upload(file, session, paramMap);
		//---------- 파일 업로드 관련 작업 끝 ------------------------------------------------------------
		
		if(insertAuction > 0) {
			model.addAttribute("msg", "경매 등록 성공!");
			model.addAttribute("target", "auction");
			return "success";
		} else {
			model.addAttribute("msg", "경매 등록 실패!");
			return "fail_back";
		}
//		return "";
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
	
	@GetMapping(value = "auction_delete")
	public String auction_delete(@RequestParam int auction_idx, Model model) {
		int deleteCnt = auctionService.deleteAution(auction_idx);
		int deleteFileCnt = auctionService.deleteAutionFile(auction_idx);
		
		if(deleteCnt > 0) {
			model.addAttribute("msg", "게시글 삭제 성공!");
			model.addAttribute("target", "auction");
			return "success";
		} else {
			model.addAttribute("msg", "게시글 삭제에 실패했습니다.");
			return "fail_back";
		}
	}
	
	
	@GetMapping(value = "auction_searchPro")
	public String auction_searchPro(@RequestParam Map<String, String> map,Model model) {
		
		List auction_product_search = auctionService.selectProductSearch(map.get("auction_search"));
		List fileList = auctionService.selectFiles();
		List auction_member_search = auctionService.selectMemberSearch(map.get("auction_search"));
		
		model.addAttribute("auction_search", map.get("auction_search"));
		model.addAttribute("auction_product_search", auction_product_search);
		model.addAttribute("auction_member_search", auction_member_search);
		model.addAttribute("fileList", fileList);
		return "auction/auction_search";
	}
	
	@ResponseBody
	@GetMapping("auction_confirmed")
	public String auction_confirmed(int auction_idx, HttpSession session) {
//		System.out.println("여기들어나!!!!!!!!!!!!!!!");
//		System.out.println("에이이이이젲제제에에엑스 : " + auction_idx );
		List<HashMap<String, String>> list =  auctionLogService.auctionConfirmed(auction_idx);
		
		auctionService.updateConfirmed((String)list.get(0).get("buyer_id") , auction_idx);
		
		System.out.println("쿼리 다녀온 친구 !!!!!!!!!! : " + list);
		
		JSONArray jsonArr = new JSONArray(list);
		
		return jsonArr.toString();
	}
	
	@GetMapping("deposit")
	public String deposit(HttpSession session, @RequestParam int auction_idx, Model model, @RequestParam String param) {
		String id = (String)session.getAttribute("sId");
		int getMemberPoint = auctionService.getMemberPoint(id);
		int depositCnt = 0;
		if(getMemberPoint >= 3000) {
			int pointWithDraw = auctionService.pointWithDraw(id);
			if(pointWithDraw > 0) {
				depositCnt = auctionService.depositInsert(id,auction_idx);
			} 
		} else {
			model.addAttribute("msg", "포인트를 확인해주세요!");
			return "fail_back";
		}
		
		if(depositCnt > 0) {
			model.addAttribute("msg", "보증금 등록 성공!");
			model.addAttribute("target", "auction_detail?auction_idx=" + auction_idx + "&param=" + param);
			return "success";
		} else {
			model.addAttribute("msg", "보증금 등록 실패!");
			return "fail_back";
		}
	}
	
	@GetMapping("depositReturn")
	public String depositReturn(HttpSession session, @RequestParam int auction_idx, Model model) {
//		String id = (String)session.getAttribute("sId");
		String buyer = auctionService.buyer(auction_idx);
		List<HashMap<String, String>> memberList = auctionService.getMemberList(buyer, auction_idx);
		if(!memberList.isEmpty()) {
			for(int i = 0; i < memberList.size(); i++) {
				auctionService.memberPointReturn(memberList.get(i).get("member_id"));
			}
			int deleteMemberCnt = auctionService.deleteMember(buyer, auction_idx);
		}
		
		return "redirect://auction";
	}
	
	@ResponseBody
	@GetMapping("auction_dateAdd")
	public void auction_dateAdd(int auction_idx, HttpSession session) {
		String id = (String)session.getAttribute("sId");
		auctionService.updateDateAdd(id, auction_idx);
	}
	
	@ResponseBody
	@GetMapping("auction_statusUpdate")
	public void auction_statusUpdate(@RequestParam int auction_idx) {
		auctionService.statusUpdate(auction_idx);
	}
	
	@ResponseBody
	@GetMapping("auctionStatus")
	public String auctionStatus(@RequestParam String param, @RequestParam String status) {
		List<HashMap<String, String>> productList = auctionService.getProductList(param, status);
		JSONArray jsonArr = new JSONArray(productList);
		
		return jsonArr.toString();
	}
	
	
}
