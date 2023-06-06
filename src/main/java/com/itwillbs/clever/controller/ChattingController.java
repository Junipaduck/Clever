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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.clever.service.ChattingService;
import com.itwillbs.clever.socket.WebSocketHandler;
import com.itwillbs.clever.vo.ChatRoomVO;
import com.itwillbs.clever.vo.ProductVO;

@Controller
public class ChattingController {
	
	@Autowired
	private ChattingService chattingService;
	
	@Autowired
	private WebSocketHandler webSocketHandler;
	
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);

	// 채팅 폼 포워딩
	@GetMapping("chatting")
	public String chatting(HttpSession session, Model model, @RequestParam int product_idx) throws JsonProcessingException {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null) {
			model.addAttribute("msg","로그인 후 이용해주세요!");
			model.addAttribute("target","loginForm.me");
			return "success";
		}
		
		// 채팅방 조회
		List<ProductVO> product = chattingService.selectProduct(product_idx);
		ObjectMapper mapper = new ObjectMapper();
		String productInfo = mapper.writeValueAsString(product);
		String sellerId = product.get(0).getMember_id();
		
		String sellerIdx = chattingService.selectUser(sellerId);
		String buyerIdx = chattingService.selectUser(sId);
		System.out.println("sellerIdx : " + sellerIdx + ", buyerIdx : " + buyerIdx);
		
		model.addAttribute("productInfo", productInfo);
		model.addAttribute("sellerIdx", sellerIdx);
		model.addAttribute("buyerIdx", buyerIdx);
		
		return "chatting/chatting";
	}
	
	@GetMapping("myChatting")
	public String myChatting(HttpSession session) {
		List<ChatRoomVO> chatList = chattingService.selectChatList(null);
		return "chatting/chatting";
	}
	
	
}
