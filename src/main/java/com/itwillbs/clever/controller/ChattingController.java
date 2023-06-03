package com.itwillbs.clever.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.clever.service.ChattingService;
import com.itwillbs.clever.socket.WebSocketHandler;
import com.itwillbs.clever.vo.ChatRoomVO;

@Controller
public class ChattingController {
	
	@Autowired
	private ChattingService chattingService;
	
	@Autowired
	private WebSocketHandler webSocketHandler;
	
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);

	// 채팅 폼 포워딩
	@GetMapping("chatting")
	public String chatting(HttpSession session, Model model, @RequestParam int product_idx) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null) {
			model.addAttribute("msg","로그인 후 이용해주세요!");
			model.addAttribute("target","loginForm.me");
			return "success";
		}
		
		// 채팅방 조회
		List<ChatRoomVO> chatList = chattingService.selectChatList(product_idx, sId);
		int chatRoomIdx = 0;
		if (!chatList.isEmpty()) {
			chatRoomIdx = chatList.get(0).getChatRoom_idx();
		}
		
		model.addAttribute("chatList", chatList);
		model.addAttribute("chatRoomIdx", chatRoomIdx);
		System.out.println("chatList : " + chatList);
		System.out.println("chatRoomIdx : " + chatRoomIdx);
		
		
		return "chatting/chatting";
	}
	
	
}
