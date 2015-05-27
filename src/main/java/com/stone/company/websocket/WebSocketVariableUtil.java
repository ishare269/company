package com.stone.company.websocket;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.WebSocketSession;

public class WebSocketVariableUtil {
	//IP
	public static Map<String, String> ip_key = new HashMap<String, String>();
	//
	public static Map<String, WebSocketSession> key_session = new HashMap<String, WebSocketSession>();
}
