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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.clever.vo.ChatMessageVO;

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
	
	
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	// synchronizedSet : 동기화된 set은 반환해주는 메소드
    // 멀티스레드 환경에서 하나의 컬렉션요소에 여러 스레드가 동시에 접근하면 충돌이 발생할 수 있으므로 동기화를 충돌이 안나도록 진행
	
//	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	// arrayList는 보안에 약할 수 있어서 안씀..
	
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
		
	    logger.info("전달된 메세지 : " + message.getPayload()); 

//	    // JSON형태로 넘어온 데이터를 특정VO필드에 맞게 자동매핑
//	    ObjectMapper objectMapper = new ObjectMapper();
//	    ChatMessage chatMessage = objectMapper.readValue(message.getPayload(), ChatMessage.class);
//	    System.out.println(chatMessage);
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

