package com.stone.company.websocket;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/**
 * 
 * @author Administrator A convenient base class for WebSocketHandler
 *         implementation that process text messages only. Binary messages are
 *         rejected with CloseStatus.NOT_ACCEPTABLE. All other methods have
 *         empty implementations.
 */
public class WebSocketEndPoint extends TextWebSocketHandler {
	/**
	 * 发送文本消息
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session,
			TextMessage message) throws Exception {
		super.handleTextMessage(session, message);
		// 访问者IP地址
		String userHostName = session.getRemoteAddress().getHostString() + "."
				+ session.getRemoteAddress().getPort();
		// 获得消息
		String msgContent = message.getPayload();
		// 解析key
		String key = null;
		// 解析消息
		String msg = null;
		if (msgContent.startsWith("serveronline")) {
			// 解析key
			key = msgContent.split(":::")[1];
			// 存储ip和key
			WebSocketVariableUtil.ip_key.put(userHostName, key);
			// 存储key和session
			WebSocketVariableUtil.key_session.put(key, session);
		} else if (msgContent.startsWith("clientonline")) {
			// 解析key
			key = msgContent.split(":::")[1];
			// 服务端key
			String serverid = msgContent.split(":::")[2];
			// 存储ip和key
			WebSocketVariableUtil.ip_key.put(userHostName, key);
			// 存储key和session
			WebSocketVariableUtil.key_session.put(key, session);
			// 获取服务器session
			WebSocketSession serverSession = WebSocketVariableUtil.key_session
					.get(serverid);
			// 发送上线消息
			serverSession
					.sendMessage(new TextMessage("online:::" + key + ":::上线了"));
		} else {
			// 解析key
			key = msgContent.split(":::")[1];
			System.out.println(msgContent);
			// 接收方key
			String to = msgContent.split(":::")[2];
			// 解析消息
			msg = msgContent.split(":::")[3];
			// 获取服务器session
			WebSocketSession serverSession = WebSocketVariableUtil.key_session
					.get(to);
			// 发送消息
			serverSession.sendMessage(new TextMessage("sendmsg:::" + key + ":::"
					+ msg));
		}

	}

	/**
	 * Invoked after the WebSocket connection has been closed by either side, or
	 * after a transport error has occurred.
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session,
			CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
	}

	/**
	 * Invoked after WebSocket negotiation has succeeded and the WebSocket
	 * connection is opened and ready for use.
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {
		super.afterConnectionEstablished(session);
		String userHostName = session.getRemoteAddress().getHostString() + "."
				+ session.getRemoteAddress().getPort();
		System.out.println(userHostName + "：连接成功");
	}

	/**
	 * Handle an error from the underlying WebSocket message transport.
	 */
	@Override
	public void handleTransportError(WebSocketSession session,
			Throwable exception) throws Exception {
		super.handleTransportError(session, exception);
	}
	
	public static void main(String[] args) {
		System.out.println("123:12:123".split(":")[0]);
		System.out.println("123:12:123".split(":")[1]);
		System.out.println("123:12:123".split(":")[2]);
	}
}
