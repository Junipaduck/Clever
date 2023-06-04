package com.itwillbs.clever.socket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.*;

//@Configuration
//@EnableWebSocket
//public class WebSocketConfig implements WebSocketConfigurer {
//	
//	@Autowired
//	private WebSocketHandler webSocketHandler;
//
//    @Override
//    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
//        registry.addHandler(webSocketHandler, "/chatting").setAllowedOrigins("*").withSockJS(); // WebSocket 핸들러와 주소 매핑
////        registry.addHandler(webSocketHandler, "/chatting").setAllowedOrigins("*").addInterceptors(new HttpSessionHandshakeInterceptor());
//    }
//
//    @Bean
//    public WebSocketHandler webSocketHandler() {
//    	return new WebSocketHandler();
//    }
//
//}

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
	
	@Override
	public void configureMessageBroker(MessageBrokerRegistry config) {
		config.enableSimpleBroker("/topic", "/queue");
		config.setApplicationDestinationPrefixes("/clever");
	}
	
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint("/chatting").addInterceptors().withSockJS();
		registry.addEndpoint("/auction_detail").addInterceptors().withSockJS();
	}
	
	
}



