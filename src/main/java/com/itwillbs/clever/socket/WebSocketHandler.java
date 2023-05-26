package com.itwillbs.clever.socket;

import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.*;
import org.springframework.web.socket.handler.*;

public class WebSocketHandler extends TextWebSocketHandler{
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);

//	private List<WebSocketSession> users;
//	private Map<String, Object> userMap;
//	
//	public WebSocketHandler() {
//		users = new ArrayList<WebSocketSession>();
//		userMap = new HashMap<String, Object>();
//	}
//	
//	// 소켓 연결
//	@Override
//	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		System.out.println("chatting - WebSocket : 연결 성공");
//		users.add(session);
//	}
//	
//	
//	// 채팅 메세지 수신 후 실행 메서드
//	@Override
//	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		
//		System.out.println("chatting - WebSocket : 메세지 수신");
//		System.out.println("메세지 : " + message.getPayload());
//		
//		JSONObject object = new JSONObject(message.getPayload());
//		String type = object.getString("type");
//		
//		if(type != null && type.equals("register")) {
//			// 등록 요청 메세지
//			String user = object.getString("userId");
//			// 아이디랑 session 매핑
//			userMap.put(user, session);
//		} else {
//			// 채팅 메세지 : 상대방 아이디 포함해서 메세지 보내짐
//			// Map에서 상대방 아이디에 해당하는 WebSocket 꺼내와서 메세지 전송
//			String target = object.getString("target");
//			WebSocketSession ws = (WebSocketSession)userMap.get(target);
//			String msg = object.getString("message");
//			if(ws != null) {
//				ws.sendMessage(new TextMessage(msg));
//			}
//		}
//		
//	}
//	
//	// 연결 해제 후 실행 메서드
//	@Override
//	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
//		System.out.println("TextWebSocketHandler : 연결 종료!");
//		users.remove(session);
//	}
	
	
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		logger.info("#WebSocketHandler, afterConnectionEstablished");
		sessionList.add(session);
		
		logger.info(session.getId() + "님이 입장하셨습니다.");
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		logger.info("#WebSocketHandler, handleMessage");
		logger.info(session.getId() + ": " + message);
		
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(session.getPrincipal().getName() + ":" + message.getPayload()));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		logger.info("#WebSocketHandler, afterConnectionClosed");

		sessionList.remove(session);
		
		logger.info(session.getId() + "님이 퇴장하셨습니다.");
	}
	
	
}

