package com.stone.company.websocket;

import java.util.Map;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

/**
 * 
 * @author Administrator An interceptor to copy information from the HTTP
 *         session to the "handshake attributes" map to made available
 *         viaWebSocketSession.getAttributes(). Copies a subset or all HTTP
 *         session attributes and/or the HTTP session id under the key
 *         HTTP_SESSION_ID_ATTR_NAME.
 */
public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor {

	@Override
	/**
	 * Invoked before the handshake is processed.
	 */
	public boolean beforeHandshake(ServerHttpRequest request,
			ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> map) throws Exception {
		return super.beforeHandshake(request, response, wsHandler, map);
	}

	@Override
	/**
	 * Invoked after the handshake is done.
	 */
	public void afterHandshake(ServerHttpRequest request,
			ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		super.afterHandshake(request, response, wsHandler, ex);
	}
}
