package com.stone.company.websocket;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/client")
public class ClientControler {
	@RequestMapping(value = "/msgpage")
	public ModelAndView msgpage() {
		System.out.println("111111111");
		return new ModelAndView("/websocket/client");
	}
	
	@RequestMapping(value = "/posthttp",produces={"text/plain;charset=utf-8"})
	@ResponseBody
	public String posthttp(String str){
		System.out.println("=============="+str);
		return str;
	}
}
