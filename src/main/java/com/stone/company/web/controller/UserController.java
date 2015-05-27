package com.stone.company.web.controller;

import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.stone.company.domain.User;
import com.stone.company.domain.ValidateMail;
import com.stone.company.service.UserService;
import com.stone.company.service.ValidateMailService;
import com.stone.company.util.ConstantsUtil;
import com.stone.company.util.mail.MailSendInfo;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private ValidateMailService validateMailService;

	/**
	 * 用户登录
	 * 
	 * @param uname
	 * @param upwd
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/login", produces = { "text/plain;charset=utf-8" })
	@ResponseBody
	public String login(String uname, String upwd, HttpSession session) {
		JSONObject json = new JSONObject();
		User user = userService.login(uname, upwd);
		if (user != null) {
			json.put("result", 0);
			json.put("desc", "成功");
			session.setAttribute(ConstantsUtil._LOGIN_USER, user);
		} else {
			json.put("result", 1);
			json.put("desc", "用户名和密码错误！");
		}
		return json.toJSONString();
	}

	@RequestMapping(value = "/loginpage")
	public ModelAndView loginPage() {
		System.out.println("===============login===============");
		return new ModelAndView("/user/loginpage");
	}

	@RequestMapping(value = "/exit")
	public ModelAndView exit(HttpSession session) {
		session.invalidate();
		System.out.println("===============exit===============");
		return new ModelAndView("redirect:/user/loginpage");
	}

	@RequestMapping(value = "/regpage")
	public ModelAndView registerPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/user/regpage");
		return mv;
	}

	/**
	 * 用户注册
	 * 
	 * @return
	 */
	@RequestMapping(value = "/register", produces = { "text/plain;charset=utf-8" })
	@ResponseBody
	public String register(User user, HttpServletRequest request) {
		JSONObject json = new JSONObject();
		if (null == user) {
			json.put("result", 1);
			json.put("result", "失败");
			return json.toJSONString();
		}
		User getUser = userService.findUserByUsername(user.getUsername());
		if (null != getUser) {
			json.put("result", 2);
			json.put("desc", "用户已被使用");
			return json.toJSONString();
		}

		try {
			if (user.getUsername().indexOf("@") < 1) {

			} else {// 邮箱注册
				// 删除邮箱存在的信息
				validateMailService.deleteValidateMail(user.getUsername());
				String valicode = UUID.randomUUID().toString().replace("-", "");
				ValidateMail validateMail = new ValidateMail();
				validateMail.setMail(user.getUsername());
				validateMail.setPassword(user.getPassword());
				validateMail.setValicode(valicode);
				StringBuffer content = new StringBuffer();
				String serverName = request.getScheme()
						+ "://"
						+ request.getServerName()
						+ ":"
						+ (request.getServerPort() == 80 ? "" : request
								.getServerPort()) + request.getContextPath()
						+ "/";
				String requestUrl = serverName + "user/mailactivate?mail="
						+ user.getUsername() + "&valicode=" + valicode;
				content.append("<a href=\"");
				content.append(requestUrl);
				content.append("\">单击激活账号</a>，如果链接无法调整，请复制下面链接到浏览器地址栏中：<br/>"
						+ requestUrl);
				Map<String, Integer> mailSendMap = MailSendInfo.getInstance(
						"注册激活邮件", content.toString(), user.getUsername());
				boolean regStatus = false;
				// 邮件发送成功
				if (0 == mailSendMap.get(user.getUsername())) {
					// 插入邮箱验证信息
					regStatus = validateMailService
							.insertValidateMail(validateMail);
				}
				if (regStatus) {
					json.put("result", 0);
					json.put("desc", "成功");
				} else {
					json.put("result", 1);
					json.put("desc", "失败");
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json.toJSONString();
	}

	/**
	 * 邮箱激活
	 * 
	 * @return
	 */
	@RequestMapping(value = "/mailactivate")
	public ModelAndView mailActivate(ValidateMail validateMail,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/user/valimailpage");
		if (null == validateMail) {
			mv.addObject("result", 1);
			return mv;
		}
		ValidateMail validate = validateMailService.findByMail(validateMail
				.getMail());
		if (null != validate
				&& validateMail.getValicode().equals(validate.getValicode())) {
			User user = new User();
			user.setUsername(validate.getMail());
			user.setPassword(validate.getPassword());
			user.setMail(validate.getMail());
			validateMailService.deleteValidateMail(validate.getMail());
			try {
				if (userService.addUser(user)) {
					session.setAttribute(ConstantsUtil._LOGIN_USER, user);
					mv.setViewName("/mail/editpage");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return mv;
	}

	/**
	 * QQ授权登录
	 * 
	 * @return
	 */
	@RequestMapping(value = "/qqlogin", produces = { "text/plain;charset=utf-8" })
	@ResponseBody
	public String qqLogin(User user, HttpSession session) {
		JSONObject json = new JSONObject();
		if (null == user) {
			json.put("result", -1);
			json.put("desc", "异常");
			return json.toJSONString();
		}
		boolean status = false;
		try {
			User isRegUser = userService.isRegister(0, user.getOpenid());
			if (null == isRegUser) {
				status = userService.addUser(user);
				System.out.println("===================insert qq授权登录："
						+ ((status == true) ? "成功" : "失败"));
				user = userService.isRegister(0, user.getOpenid());
			} else {
				user.setId(isRegUser.getId());
				status = userService.updateUser(user);
				System.out.println("===================update qq授权登录："
						+ ((status == true) ? "成功" : "失败"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (status) {
			json.put("result", 0);
			json.put("desc", "成功");
			session.setAttribute(ConstantsUtil._LOGIN_USER, user);
		} else {
			json.put("result", 1);
			json.put("desc", "失败");
		}
		return json.toJSONString();
	}

	/**
	 * QQ授权回调
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/getqqoauthdata")
	public ModelAndView getQQOAuthData(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/user/callback");
		return mv;
	}

	/**
	 * 登出
	 * 
	 * @param session
	 */
	@RequestMapping(value = "/loginout", produces = { "text/plain;charset=utf-8" })
	@ResponseBody
	public String loginout(HttpSession session) {
		JSONObject json = new JSONObject();
		session.invalidate();
		System.out.println("user loginout");
		json.put("result", 0);
		return json.toJSONString();
	}

}
