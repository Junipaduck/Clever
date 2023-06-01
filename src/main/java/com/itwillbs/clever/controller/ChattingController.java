package com.itwillbs.clever.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.clever.service.ChattingService;
import com.itwillbs.clever.socket.WebSocketHandler;
import com.itwillbs.clever.vo.ChatListVO;

@Controller
public class ChattingController {
	
	@Autowired
	private ChattingService chattingService;
	
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);

	// 채팅 폼 포워딩
	@GetMapping("chatting")
	public String chatting(HttpSession session, Model model) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null) {
			model.addAttribute("msg","로그인 후 이용해주세요!");
			model.addAttribute("target","loginForm.me");
			return "success";
		}
		
		// 채팅방 조회
		List<ChatListVO> chatList = chattingService.selectChatList(sId);
		model.addAttribute("chatList", chatList);
		System.out.println(chatList);
		
//		// 채팅방 오픈
//		int openCtRoom = chattingService.openRoom(sId);
//		if(openCtRoom > 0) {
//			model.addAttribute("msg","채팅을 시작합니다!");
//			return "chatting/chatting";
//		} else {
//			model.addAttribute("msg","채팅을 시작할 수 없습니다!");
//			return "fail_back";
//		}
		
		return "chatting/chatting";
	}
	
	
}
