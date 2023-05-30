package com.itwillbs.clever.controller;

import java.io.*;
import java.nio.file.*;
import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.bcrypt.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.itwillbs.clever.service.*;
import com.itwillbs.clever.vo.*;

@Controller
public class AuctionController {

	@Autowired
	private AuctionService auctionService;
	
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping(value = "auction")
	public String auction(Model model) {
		
		List imminentList = auctionService.selectImminent();
		List hotList = auctionService.selectHotList();
		List currentList = auctionService.selectCurrent();
		
		model.addAttribute("imminentList", imminentList);
		model.addAttribute("hotList", hotList);
		model.addAttribute("currentList", currentList);
		
		
		return "auction/auction";
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
					return "redirect:/auction"; // 로그인 성공 시 -> main 페이지로 리다이렉트 이동 
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
	public String auction_list() {
		return "auction/auction_list";
	}
	
	@GetMapping(value = "auction_detail")
	public String auction_detail(Model model, String auction_idx) {
		
		Map detailmap = auctionService.detailList(auction_idx);
		model.addAttribute("detailmap", detailmap);
		
		System.out.println("맵!!!!!!!!" + detailmap);
		
		return "auction/auction_detail";
	}
	
	@GetMapping(value = "auction_upload")
	public String auction_upload(Model model, HttpSession session) {
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인 후 이용해주세요.");
			model.addAttribute("target", "loginForm.me");
			return "success";
		}
		return "auction/auction_upload";
	}
	
	@PostMapping(value = "auction_upload_pro")
	public String auction_upload_pro(@RequestParam Map<String, String> map, @RequestParam("auction_images") MultipartFile[] images, HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("sId");
		// 카테고리 분류
		String[] categorys = map.get("auction_category").split(" > ");
		map.put("auction_Lcategory", categorys[0]);
		map.put("auction_Mcategory", categorys[1]);
		map.put("auction_Scategory", categorys[2]);
		// 카테고리 분류 끝
		//---------- 파일 업로드 관련 작업 시작 -----------------------------------------------------------
		String uploadDir = "/resources/auctionUpload"; //프로젝트상의 가상 업로드 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir); //실제 업로드 경로
		System.out.println("실제 업로드 경로 : " + saveDir);
//		실제 업로드 경로(resources뒤에 띄어쓰기 되어있음) : C:\Users\HANABAE\workspace_sts\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\FoodCode\resourcees\auctionUpload
		try {
			Date date = new Date(); //java.util.Date 클래스 사용하기
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			map.put("auction_file_path", "/" + sdf.format(date));
			
			saveDir = saveDir + map.get("auction_file_path"); //실제 업로드 경로와 서브 디렉토리 경로 결합하여 저장
			
			Path path = Paths.get(saveDir);
			Files.createDirectories(path);
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		MultipartFile mFile = images[0]; //StoreVO 객체에 전달된 MultipartFile 단일파일 꺼내기
		String originalFileName = mFile.getOriginalFilename();
		
		String uuid = UUID.randomUUID().toString(); //파일명 중복 방지를 위한 코드
		for (MultipartFile image : images) {
			// 각 이미지 파일에 대한 처리 수행
			// 파일을 읽거나 데이터베이스에 저장하는 등의 작업 수행
			System.out.println(image);
			try {
				image.transferTo(new File(saveDir,uuid.substring(0, 8) + "_" + mFile.getOriginalFilename()));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("UUID : " + uuid);
		
		map.put("auction_file", uuid.substring(0, 8) + "_" + originalFileName);
		System.out.println("실제 업로드 될 파일명 : " + map.get("auction_file"));
		//---------- 파일 업로드 관련 작업 끝 ------------------------------------------------------------
		map.put("auction_start", map.get("auction_start_date") + " " + map.get("auction_start_time"));
		map.put("auction_end", map.get("auction_end_date") + " " + map.get("auction_end_time"));
		System.out.println(map);
		int insertAuction = auctionService.insertAutcion(map,id);
		if(insertAuction > 0) {
			model.addAttribute("msg", "경매 등록 성공!");
			model.addAttribute("target", "auction");
			return "success";
		} else {
			model.addAttribute("msg", "경매 등록 실패!");
			return "fail_back";
		}
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
