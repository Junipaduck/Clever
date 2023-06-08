package com.itwillbs.clever.socket;

import java.util.Collections;
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
import com.itwillbs.clever.controller.ChattingController;
import com.itwillbs.clever.service.ChattingService;
import com.itwillbs.clever.vo.ChatRoomVO;

@Controller
public class WebSocketHandler extends TextWebSocketHandler implements InitializingBean{
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	
	@Autowired
	private ChattingService chattingService;
	
	@Autowired
	private ChattingController chattingController;

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
	    
//	    for(WebSocketSession s : sessions) {
//			System.out.println(s);
//			s.sendMessage(new TextMessage(session.getId() + ":" + message.getPayload()));
//		}
	    
	    JSONObject jo = new JSONObject(message.getPayload());
	    int productIdx = Integer.parseInt(jo.getString("product_idx"));
	    String chatRoomId = jo.getString("chatRoom_id");
	    String messageContent = jo.getString("message_content");
	    String buyerId = jo.getString("buyer_id");
	    String sellerId = jo.getString("seller_id");
	    String senderId = jo.getString("senderId");
	    
//	    List<ChatRoomVO> selectChatRoom = chattingService.selectChatRoom(chatRoomId);
//	    System.out.println("앜" + selectChatRoom);
	    List<ChatRoomVO> selectChatRoom = chattingService.selectChatRoom(senderId, productIdx);
	    System.out.println("앜" + selectChatRoom); 
	    
	    // 채팅방이 존재하지 않으면 새로운 채팅방 생성 
	    if (selectChatRoom.isEmpty()) {
	        chattingService.OpenRoom(chatRoomId, productIdx);
	        System.out.println("채팅방 생성 성공");
	    } 

	    for (WebSocketSession s : sessions) {
	        System.out.println("채팅방 존재함! 메세지 전송!!!!!");
	        s.sendMessage(new TextMessage(senderId + ":" + messageContent));
	        System.out.println("메세지 전송 성공");
	        int result = chattingService.insertMessage(productIdx, chatRoomId, buyerId, sellerId, messageContent, senderId);
	        if (result > 0) {
	            System.out.println("채팅 메세지 저장");
	        }
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

