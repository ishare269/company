package com.stone.company.web.controller.weixin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.stone.company.util.HttpRequestUtil;
import com.stone.company.util.PropsFileOperateUtil;

/**
 * 微信
 * 
 * @author Stone
 * 
 */
@RequestMapping("/weixin")
@Controller
public class WeixinController {

	/**
	 * 获取凭证
	 * 
	 * @return
	 */
	@RequestMapping(value = "/getToken", produces = { "text/plain;charset=utf-8" })
	@ResponseBody
	public String getToken() {
		JSONObject json = new JSONObject();
		// 是否第一次请求
		String firstRequest = PropsFileOperateUtil.getValue("first_req", "yes");
		String token = null;
		System.out.println("=================firstRequest:" + firstRequest);
		if ("yes".equals(firstRequest)) {
			token = realTimeGetToken();
		} else {
			long lastReqTime = Long.parseLong(PropsFileOperateUtil.getValue(
					"last_req_time", "0"));
			long expiresIn = Long.parseLong(PropsFileOperateUtil.getValue(
					"expires_in", "7200"));
			long curTime = (long) (System.currentTimeMillis() / 1000);
			if (curTime - lastReqTime > expiresIn) {
				token = realTimeGetToken();
			} else {
				token = PropsFileOperateUtil.getValue("access_token", "");
				PropsFileOperateUtil.setValue("last_req_time", ""
						+ (long) (System.currentTimeMillis() / 1000));
				PropsFileOperateUtil.setValue("first_req", "no");
			}
		}
		json.put("token", token);
		return json.toJSONString();
	}

	/**
	 * 实时获得TOKEN
	 * 
	 * @return
	 */
	public String realTimeGetToken() {
		JSONObject json = new JSONObject();
		String appid = PropsFileOperateUtil.getValue("appid", null);
		String appsecret = PropsFileOperateUtil.getValue("appsecret", null);
		StringBuffer getTokenUrl = new StringBuffer(
				"https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential");
		getTokenUrl.append("&appid=");
		getTokenUrl.append(appid);
		getTokenUrl.append("&secret=");
		getTokenUrl.append(appsecret);
		json = JSON.parseObject(new HttpRequestUtil().getRequestUrl(getTokenUrl
				.toString()));
		String token = json.getString("access_token");
		System.out.println("=================access_token:" + token);
		PropsFileOperateUtil.setValue("access_token", token);
		PropsFileOperateUtil.setValue("last_req_time",
				"" + (long) (System.currentTimeMillis() / 1000));
		PropsFileOperateUtil.setValue("first_req", "no");
		return token;
	}

	/**
	 * 创建菜单
	 * 
	 * @return
	 */
	@RequestMapping(value = "/createmenu", produces = { "text/plain;charset=utf-8" })
	@ResponseBody
	public String createMenu() {
		JSONObject json = new JSONObject();
		String menuStr = "{\"button\":[{\"type\":\"click\",\"name\":\"今日歌曲\",\"key\":\"V1001_TODAY_MUSIC\"},{\"name\":\"菜单\",\"sub_button\":[{\"type\":\"view\",\"name\":\"搜索\",\"url\":\"http://www.soso.com/\"},{\"type\":\"view\",\"name\":\"视频\",\"url\":\"http://v.qq.com/\"},{\"type\":\"click\",\"name\":\"赞一下我们\",\"key\":\"V1001_GOOD\"}]}]}";
		String token = realTimeGetToken();
		StringBuffer createMenuUrl = new StringBuffer();
		createMenuUrl.append("https://api.weixin.qq.com/cgi-bin/menu/create");
		createMenuUrl.append("?access_token=");
		createMenuUrl.append(token);
		json = JSON.parseObject(new HttpRequestUtil().postStrRequestUrl(
				createMenuUrl.toString(), menuStr));
		return json.toJSONString();
	}
	
	public static void main(String[] args) {
		System.out.println(new WeixinController().createMenu());
	}
}
