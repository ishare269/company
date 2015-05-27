package com.stone.company.websocket;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/server")
public class ServerControler {
	@RequestMapping(value = "/msgpage")
	public ModelAndView msgpage() {
		return new ModelAndView("/websocket/server");
	}
}
