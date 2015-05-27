package com.stone.company.web.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.stone.company.domain.MailTemplate;
import com.stone.company.domain.User;
import com.stone.company.service.MailTemplateService;
import com.stone.company.util.ConstantsUtil;
import com.stone.company.util.mail.MailSendInfo;

@RequestMapping("/mail")
@Controller
public class MailController {
	@Autowired
	private MailTemplateService mailTemplateService;

	/**
	 * 邮件编辑页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/editpage", produces = { "text/html;charset=utf-8" })
	public ModelAndView editPage(HttpSession session) {
		User user = (User) session.getAttribute(ConstantsUtil._LOGIN_USER);
		ModelAndView mv = new ModelAndView("/mail/editpage");
		try {
			if (null != user) {
				List<MailTemplate> mailTemplates = mailTemplateService
						.queryByUid(user.getId());
				mv.addObject("mailTemplates", mailTemplates);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	/**
	 * 
	 * @param mail
	 * @return
	 */
	@RequestMapping(value = "/sendmail", produces = { "text/plain;charset=utf-8" })
	@ResponseBody
	public String sendMail(MailTemplate mailInfo,
			@RequestParam("type") int type, HttpSession session) {
		User user = (User) session.getAttribute(ConstantsUtil._LOGIN_USER);
		JSONObject json = new JSONObject();
		if (null != user) {
			MailTemplate mailTemplate = new MailTemplate();
			mailTemplate.setContent(mailInfo.getContent());
			mailTemplate.setSubject(mailInfo.getSubject());
			mailTemplate.setTo(mailInfo.getTo());
			mailTemplate.setUid(user.getId());
			if (0 == type) {
				mailTemplate.setId(UUID.randomUUID().toString()
						.replace("-", ""));
				mailTemplateService.insertMailTemplate(mailTemplate);
			} else {
				mailTemplate.setId(mailInfo.getId());
				mailTemplateService.updateMailTemplate(mailTemplate);
			}
			json.put(
					"result",
					MailSendInfo.getInstance(mailInfo.getSubject(),
							mailInfo.getContent(), mailInfo.getTo()));
		} else {
			json.put("result", 1);
		}
		return json.toJSONString();
	}

	/**
	 * 查询邮件
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/findbyid", produces = { "text/plain;charset=utf-8" })
	@ResponseBody
	public String findById(String id) {
		JSONObject json = new JSONObject();
		MailTemplate mailTemplate = mailTemplateService.findById(id);
		json.put("mailTemplate", mailTemplate);
		return json.toJSONString();
	}

	/**
	 * 查询邮件
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delmail", produces = { "text/plain;charset=utf-8" })
	@ResponseBody
	public String deleteMail(String id) {
		JSONObject json = new JSONObject();
		if (mailTemplateService.deleteMailTemplete(id, null)) {
			json.put("result", 0);
			json.put("desc", "成功");
		} else {
			json.put("result", 1);
			json.put("desc", "失败");
		}
		return json.toJSONString();
	}

}
