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
import com.itwillbs.clever.vo.ChatMessageVO;
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
		System.out.println("productInfo : " + productInfo);
		
		List<ChatRoomVO> chatList = chattingService.selectChatList(sId);
		model.addAttribute("chatList", chatList);
		
		model.addAttribute("product", product);
		model.addAttribute("productInfo", productInfo);
		model.addAttribute("sellerIdx", sellerIdx);
		model.addAttribute("buyerIdx", buyerIdx);
		
		return "chatting/chatting";
	}
	
	@GetMapping("myChatting")
	public String myChatting(HttpSession session, Model model) throws JsonProcessingException {
		String sId = (String)session.getAttribute("sId");
		List<ChatRoomVO> chatList = chattingService.selectChatList(sId);
		ObjectMapper mapper = new ObjectMapper();
		String chatRoom = mapper.writeValueAsString(chatList);
		
		model.addAttribute("chatRoom", chatRoom);
		model.addAttribute("chatList", chatList);
		System.out.println(chatRoom);
		
		
		return "chatting/chatting";
	}
	
	@ResponseBody
	@PostMapping("roomInfo")
	public String roomInfo(String roomId, String userId) {
		List<ChatMessageVO> chatRoomInfo = chattingService.selectRoomInfo(roomId);
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			String roomInfo = objectMapper.writeValueAsString(chatRoomInfo);
			return roomInfo;
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 채팅방 나가기
	@GetMapping("deleteRoom")
	public String deleteRoom() {
		return null;
	}
	
	
}
