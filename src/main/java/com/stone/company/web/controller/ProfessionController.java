package com.stone.company.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.stone.company.domain.Profession;
import com.stone.company.domain.User;
import com.stone.company.service.ProfessionService;
import com.stone.company.util.ConstantsUtil;

/**
 * 行业
 * 
 * @author Stone
 * 
 */
@Controller
@RequestMapping("/profession")
public class ProfessionController {

	@Autowired
	private ProfessionService professionService;

	/**
	 * 行业主页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/index", produces = { "text/html;charset=utf-8" })
	public ModelAndView indexPage(
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "limit", defaultValue = "10") int limit) {
		ModelAndView mv = new ModelAndView("/profession/index");
		return mv;
	}

	/**
	 * 添加工作
	 * 
	 * @return
	 */
	@RequestMapping(value = "/addjobpage")
	public ModelAndView addjobPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/profession/addjob");
		return mv;
	}

	/**
	 * 我的职位
	 * 
	 * @return
	 */
	@RequestMapping(value = "/myjob", produces = { "text/html;charset=utf-8" })
	public ModelAndView myjobPage(HttpSession session) {
		ModelAndView mv = new ModelAndView("/profession/myjob");
		User user = (User) session.getAttribute(ConstantsUtil._LOGIN_USER);
		mv.addObject("uid", user);
		return mv;
	}

	/**
	 * 新增
	 * 
	 * @return
	 */
	@RequestMapping(value = "/ajaxadd", produces = { "text/plain;charset=utf-8" })
	@ResponseBody
	public String ajaxAddProfession(Profession profession, HttpSession session) {
		JSONObject json = new JSONObject();
		try {
			User user = (User) session.getAttribute(ConstantsUtil._LOGIN_USER);
			if (null == user) {
				json.put("result", 2);
				json.put("desc", "用户未登录");
				return json.toJSONString();
			}
			if (null == profession) {
				json.put("result", 1);
				return json.toJSONString();
			}
			// 设置用户编号
			profession.setUid(user.getId());
			if (professionService.insertProfession(profession)) {
				json.put("result", 0);
			}
		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", -1);
		}
		return json.toJSONString();
	}

	/**
	 * 修改
	 * 
	 * @return
	 */
	@RequestMapping(value = "/ajaxupdate", produces = { "text/plain;charset=utf-8" })
	@ResponseBody
	public String ajaxUpdateProfession(Profession profession) {
		JSONObject json = new JSONObject();
		json.put("result", 1);
		try {
			if (null == profession) {
				return json.toJSONString();
			}
			if (professionService.updateProfession(profession)) {
				json.put("result", 0);
			}
		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", -1);
		}
		return json.toJSONString();
	}

	/**
	 * 根据职业编号查询
	 * 
	 * @return
	 */
	@RequestMapping(value = "/ajaxfind", produces = { "text/plain;charset=utf-8" })
	@ResponseBody
	public String ajaxFindProfession(@RequestParam(value = "id") long id) {
		JSONObject json = new JSONObject();
		json.put("result", 1);
		try {
			Profession profession = professionService.findProfessionById(id);
			if (null != profession) {
				json.put("profession", profession);
				json.put("result", 0);
			}
		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", -1);
		}
		return json.toJSONString();
	}

	/**
	 * 查询全部
	 * 
	 * @return
	 */
	@RequestMapping(value = "/ajaxqueryall", produces = { "text/plain;charset=utf-8" })
	@ResponseBody
	public String ajaxQueryAll(
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "limit", defaultValue = "10") int limit) {
		JSONObject json = new JSONObject();
		json.put("result", 1);
		try {
			List<Profession> professions = professionService
					.queryAll(new PageBounds(page, limit));
			PageList<Profession> pageList = (PageList<Profession>) professions;
			json.put("professions", professions);
			json.put("totalCount", pageList.getPaginator().getTotalCount());
			json.put("totalPages", pageList.getPaginator().getTotalPages());
		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", -1);
		}
		return json.toJSONString();
	}

	/**
	 * 查询我的职业
	 * 
	 * @return
	 */
	@RequestMapping(value = "/ajaxmyjob", produces = { "text/plain;charset=utf-8" })
	@ResponseBody
	public String queryMyjob(
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "limit", defaultValue = "10") int limit,
			HttpSession session) {
		JSONObject json = new JSONObject();
		PageBounds pageBounds = new PageBounds(page, limit);
		try {
			User user = (User) session.getAttribute(ConstantsUtil._LOGIN_USER);
			List<Profession> professions = professionService
					.queryProfessionByUid(user.getId(), pageBounds);
			PageList<Profession> pageList = (PageList<Profession>) professions;
			json.put("professions", professions);
			json.put("totalPages", pageList.getPaginator().getTotalPages());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSON.toJSONStringWithDateFormat(json, "yyyy-MM-dd");
	}

}
