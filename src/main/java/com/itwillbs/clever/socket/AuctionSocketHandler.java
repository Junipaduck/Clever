package com.itwillbs.clever.socket;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.clever.controller.AuctionController;
import com.itwillbs.clever.controller.ChattingController;
import com.itwillbs.clever.service.AuctionLogService;
import com.itwillbs.clever.service.AuctionService;
import com.itwillbs.clever.service.ChattingService;
import com.itwillbs.clever.vo.ChatRoomVO;
import com.itwillbs.clever.vo.LogRoomVO;

@Controller
public class AuctionSocketHandler extends TextWebSocketHandler implements InitializingBean{
	private static final Logger logger = LoggerFactory.getLogger(AuctionSocketHandler.class);
	
	@Autowired
	private AuctionLogService auctionLogService;
	
	@Autowired
	private AuctionService auctionService;
	
	private final ObjectMapper objectMapper = new ObjectMapper();
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	// synchronizedSet : 동기화된 set은 반환해주는 메소드
    // 멀티스레드 환경에서 하나의 컬렉션요소에 여러 스레드가 동시에 접근하면 충돌이 발생할 수 있으므로 동기화를 충돌이 안나도록 진행
	
//	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	// arrayList는 안전하지 않아 안씀..
	
	// 연결되었을 때 - 클라이언트가 연결됐을 떄
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		logger.info(session.getId() + "님이 연결되었습니다.");
		sessions.add(session);
		
	}
	
//	// Handler가 받은 메세지
//	@Override
//	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		
//		// 세션아이디때문에 추가 - 0530
//		String senderId = (String)session.getAttributes().get("sessionId");
//		logger.info(senderId);
//		
//		
//		logger.info("#WebSocketHandler, handleMessage");
//		// session.getId() : 사용자 아이디
//		// message.getPayload() : 메세지 내용
//		logger.info(session.getId() + ": " + message.getPayload());
//		
//		System.out.println(sessionList);
//		
////		sessionList.get(0).sendMessage(message);
//		
//		// 접속된 모든 이용자들에게 메세지를 날림 (브로드캐스팅)
//		for(WebSocketSession s : sessionList) {
//			System.out.println(s);
//			s.sendMessage(new TextMessage(session.getId() + ":" + message.getPayload()));
//		}
//	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
		String msg = message.getPayload();
	    logger.info("전달된 메세지 : " + msg);
	    System.out.println("전달된 메세지 : " + msg);

//	    for(WebSocketSession s : sessions) {
//			System.out.println(s);
//			s.sendMessage(new TextMessage(session.getId() + ":" + message.getPayload()));
//		}
	    
	    JSONObject jo = new JSONObject(message.getPayload());
	    int auctionIdx = (Integer.parseInt(jo.getString("auction_idx"))); //경매 상품 인덱스
	    int logRoomIdx = (Integer.parseInt(jo.getString("logRoom_idx")));
	    String messageContent = jo.getString("message_content"); //입력한 가격
	    String chatId = jo.getString("chat_id"); //해당 메시지를 보낸 아이디
	    System.out.println("productIdx : " + auctionIdx);
	    System.out.println("chatRoomIdx : " + logRoomIdx);
	    System.out.println("messageContent : " + messageContent);
	    
	    List<LogRoomVO> selectChatList = auctionLogService.selectLogList(auctionIdx);
	    
	    HashMap<String, String> selectAuctionList = auctionService.selectAcution(auctionIdx);
	    
	    // chat_idx(채팅방 번호) 가 0이면 (= 채팅방이 존재하지 않으면) 새로운 채팅방 생성 
	    if (logRoomIdx == 0 && selectChatList.isEmpty()) {
	    	auctionLogService.OpenRoom(logRoomIdx, auctionIdx);

	        System.out.println("채팅방 생성 성공");
	    } 
	    
	    for (WebSocketSession s : sessions) {
	        System.out.println("채팅방 존재함! 메세지 전송!!!!!");
	        s.sendMessage(new TextMessage(jo.getString("chat_id") + ":" + messageContent + ":" + jo.getString("auction_idx")));
	    }
	    
	    int selectCount = auctionLogService.selectAuctionMessage(auctionIdx, chatId);
	    int dbPrice = Integer.parseInt(selectAuctionList.get("immediately_price"));
	    int messagePrice = Integer.parseInt(messageContent.replace(",", ""));
	    
	    System.out.println("★★★★★★★★★★★★★★" + selectCount);
	    
	    if(selectCount>=1) {
	    	auctionLogService.updateMessage(auctionIdx, chatId, messageContent);
	    } else {
	    	int result = auctionLogService.insertMessage(auctionIdx, logRoomIdx, chatId, messageContent);
	    }
	    
	    auctionService.updatePrice(auctionIdx, Integer.parseInt(messageContent.replace(",", "")));
	    
	    if(dbPrice <= messagePrice) {
	    	auctionService.updateDate(auctionIdx, chatId);
	    }
	    
	    
//	    chatMessage.setCreateDate(new Date(System.currentTimeMillis()));
//	    logger.info(chatMessage);
//
//	    // 전달 받은 채팅메세지를 db에 삽입
//	    int result = chatService.insertMessage(chatMessage);
//	    if(result > 0) {
//	        // 같은방에 접속중인 클라이언트에게 전달받은 메세지를 보내기
//	        for(WebSocketSession s : sessions) {
//	            //반복을 진행중인 websocketSession안에 담겨있는 방번호
//	            int chatRoomNo = (Integer)s.getAttributes().get("chatRoomNo");
//
//	            //메세지에 담겨있는 채팅방 번호와 chatRoomNo가 같은지 비교
//	            if(chatMessage.getChatRoomNo() == chatRoomNo) {
//	                //같은 방 클라이언트에게 JSON형식으로 메세지를 보냄
//
//	                // s.sendMessage(new TextMessage( message.getPayload()));
//	                s.sendMessage(new TextMessage( new Gson().toJson(chatMessage )));
//	            }
//	        }
//
//	    }
	}
	
	// 연결 끊겼을 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		sessions.remove(session);
		logger.info(session.getId() + "님이 나갔습니다.");
		
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
	}
}

