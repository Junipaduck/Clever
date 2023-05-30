package com.itwillbs.clever.socket;

import java.net.InetSocketAddress;
import java.security.Principal;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.socket.*;
import org.springframework.web.socket.handler.*;

import okhttp3.internal.ws.RealWebSocket.Message;

@Controller
public class WebSocketHandler extends TextWebSocketHandler implements InitializingBean{
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
	
	// 연결되었을 때 - 클라이언트가 연결됐을 떄
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		logger.info("#WebSocketHandler, afterConnectionEstablished");
		sessionList.add(session);
		System.out.println(session);
		String senderId = session.getId();
//		String senderId = getMemberId(session);
		System.out.println(senderId);
		session.getAttributes().put("senderId", senderId);
		
		logger.info(session.getId() + "님이 입장하셨습니다.");
	}
	
	// Handler가 받은 메세지
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		// 세션아이디때문에 추가 - 0530
		String senderId = (String)session.getAttributes().get("sessionId");
		logger.info(senderId);
		
		
		logger.info("#WebSocketHandler, handleMessage");
		// session.getId() : 사용자 아이디
		// message.getPayload() : 메세지 내용
		logger.info(session.getId() + ": " + message.getPayload());
		
		System.out.println(sessionList);
		
//		sessionList.get(0).sendMessage(message);
		
		// 접속된 모든 이용자들에게 메세지를 날림 (브로드캐스팅)
		for(WebSocketSession s : sessionList) {
			System.out.println(s);
			s.sendMessage(new TextMessage(session.getId() + ":" + message.getPayload()));
		}
	}
	
	
	// 연결 끊겼을 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		logger.info("#WebSocketHandler, afterConnectionClosed");

		sessionList.remove(session);
		
		logger.info(session.getId() + "님이 퇴장하셨습니다.");
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
	}
}

