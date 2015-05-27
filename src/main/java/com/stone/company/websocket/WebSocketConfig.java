package com.stone.company.websocket;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

// Spring中使用@configuration注解进行bean声明
@Configuration
@EnableWebMvc
@EnableWebSocket
/**
 * 
 * @author Administrator
 * Defines callback methods to configure the WebSocket request handling via @EnableWebSocket.
 */
public class WebSocketConfig implements WebSocketConfigurer {

	@Override
	/**
	 * Register WebSocketHandlers including SockJS fallback options if desired.
	 * WebSocketHandlerRegistry:Provides methods for configuring WebSocketHandler request mappings.
	 */
	public void registerWebSocketHandlers(
			WebSocketHandlerRegistry handlerRegistry) {
		// Add more handlers that will share the same configuration
		// (interceptors, SockJS config, etc)
		handlerRegistry.addHandler(webSocketHandler(), "/websocket")
		// Configure interceptors for the handshake request.
				.addInterceptors(new HandshakeInterceptor());

		handlerRegistry.addHandler(webSocketHandler(), "/sockjs/websocket")
				.addInterceptors(new HandshakeInterceptor()).withSockJS();

	}

	@Bean
	public WebSocketHandler webSocketHandler() {
		return new WebSocketEndPoint();
	}

}
