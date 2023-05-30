package com.itwillbs.clever.socket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.*;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {
	
	@Autowired
	private WebSocketHandler webSocketHandler;

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(webSocketHandler, "/chatting").setAllowedOrigins("*").withSockJS(); // WebSocket 핸들러와 주소 매핑
    }

    @Bean
    public WebSocketHandler webSocketHandler() {
    	return new WebSocketHandler();
    }

}
