package com.itwillbs.clever.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.clever.service.*;
import com.itwillbs.clever.vo.*;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	
	@GetMapping(value = "community")
	public String community(Model model) {
		List communityList = communityService.communityList();
		model.addAttribute("communityList", communityList);
		
		List<HashMap<String, String>> grade = communityService.selectGrade();
		model.addAttribute("grade", grade);
		
		return "community/community_main";
	}
	
	@GetMapping(value = "community_auction")
	public String community_auction(Model model) {
		List communityList = communityService.communityAuctionList();
		model.addAttribute("communityList", communityList);
		return "community/community_main_auction";
	}
	
	@GetMapping(value = "community_form")
	public String community_form(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			model.addAttribute("msg","로그인 후 이용해주세요!");
			model.addAttribute("target","loginForm.me");
			return "success";
		}
		
		return "community/community_form";
	}
	
	@GetMapping(value = "community_form_auction")
	public String community_form_auction(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			model.addAttribute("msg","로그인 후 이용해주세요!");
			model.addAttribute("target","auction_loginForm");
			return "success";
		}
		
		return "community/community_form_auction";
	}
	
	@PostMapping(value = "community_formPro")
	public String community_formPro(@RequestParam Map<String, String> map, HttpSession session,Model model) {
		System.out.println(map);
		String id = (String)session.getAttribute("sId");
		int communityUpload = communityService.insertCommunity(map,id);
		if(communityUpload > 0) {
			model.addAttribute("msg", "등록 성공!");
			
			// 글 작성 시 포인트 100점 적립
			int updateCount = communityService.getMemberPoint(id);
			if(updateCount > 0) {
				if(map.get("community_div").equals("auction")) {
					model.addAttribute("msg", "글 작성 적립금 100점 적립 완료!");
					model.addAttribute("target", "community_auction");
				} else {
					model.addAttribute("msg", "글 작성 적립금 100점 적립 완료!");
					model.addAttribute("target", "community");
				}
			} else {
				model.addAttribute("msg", "포인트 적립 실패!");
				return "fail_back";
			}
			
			return "success";
		} else {
			model.addAttribute("msg", "등록 실패!");
			return "fail_back";
		}
	}
	@GetMapping(value = "community_detail")
	public String community_detail(@RequestParam Map<String, String> map, Model model) {
		int readcountUp = communityService.readcountUp(map.get("community_idx"));
		List communityList = communityService.selectDetail(map.get("community_idx"));
		List<CommunityTinyVO> tinyReplyCommunityList = communityService.getTinyReplyCommunityList(map.get("community_idx"));
		System.out.println(communityList);
		model.addAttribute("communityList", communityList);
		model.addAttribute("tinyReplyCommunityList", tinyReplyCommunityList);
//		return "";
		return "community/community_detail";
	}
	
	@PostMapping(value = "communityTinyReplyWrite")
	public String communityTinyReplyWrite(@RequestParam Map<String, String> map ,Model model) {
		System.out.println(map);
		int insertCount = communityService.insertTinyReplyCommunity(map);
		
		if(insertCount > 0) { // 성공
			return "redirect:/community_detail?community_idx=" + map.get("community_idx");
		} else { // 실패
			model.addAttribute("msg", "댓글 쓰기 실패!");
			return "fail_back";
		}
	}
	
	@PostMapping(value = "communityTinyReReplyWrite")
	public String BoardTinyReReplyWrite(@RequestParam Map<String, String> map ,Model model) {
		System.out.println(map);
			int insertCount = communityService.registTinyReReplyCommunity(map);
//		
		if(insertCount > 0) { // 성공
			
			return "redirect:/community_detail?community_idx=" + map.get("community_idx");
		} else { // 실패
			model.addAttribute("msg", "대댓글 쓰기 실패!");
			return "fail_back";
		}
	}
	
	@GetMapping(value = "communityTinyReplyDelete")
	public String communityTinyReplyDelete(@RequestParam Map<String, String> map ,Model model, @RequestParam int community_idx) {
		int deleteCount = communityService.deleteTinyReplyCommunity(map);
		if(deleteCount > 0) { // 성공
			return "redirect:/community_detail?community_idx=" + community_idx;
		} else { // 실패
			model.addAttribute("msg", "댓글 삭제 실패!");
			return "fail_back";
		}
	}
	
	@GetMapping(value = "community_modify")
	public String community_modify(@RequestParam Map<String, String> map, Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			model.addAttribute("msg","로그인 후 이용해주세요!");
			model.addAttribute("target","loginForm.me");
			return "success";
		}
		List communityList = communityService.selectDetail(map.get("community_idx"));
		model.addAttribute("communityList", communityList);
		return "community/community_modify";
	}
	
	@PostMapping(value = "community_modifyPro")
	public String community_modifyPro(@RequestParam Map<String, String> map, Model model) {
		System.out.println(map);
		int communityModifyCnt = communityService.communityModify(map);
		
		if(communityModifyCnt > 0) {
			model.addAttribute("msg", "수정 성공!");
			model.addAttribute("target", "community_detail?community_idx=" + map.get("community_idx"));
			return "success";
		} else {
			model.addAttribute("msg", "수정 실패!");
			return "fail_back";
		}
	}
	
	@GetMapping(value = "community_delete")
	public String community_delete(@RequestParam Map<String, String> map, Model model) {
		int communityDeleteCnt = communityService.communityDelete(map);
		
		if(communityDeleteCnt > 0) {
			model.addAttribute("msg", "삭제되었습니다.");
			model.addAttribute("target", "community");
			return "success";
		} else {
			model.addAttribute("msg", "삭제 실패!");
			return "fail_back";
		}
	}
	
}
