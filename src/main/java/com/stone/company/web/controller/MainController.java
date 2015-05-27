package com.stone.company.web.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.stone.company.domain.User;
import com.stone.company.util.ConstantsUtil;

@Controller
@RequestMapping(value = "/main")
public class MainController {
	/**
	 * 主页进入
	 * 
	 * @return
	 */
	@RequestMapping(value = "/index", produces = { "text/html;charset=utf-8" })
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main");
		return mv;
	}

	/**
	 * 文件上传
	 * 
	 * @param file
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/upload", produces = { "text/plain;charset=utf-8" })
	@ResponseBody
	public String uploadImg(@RequestParam("file") MultipartFile file,
			HttpSession session, HttpServletRequest request) {
		JSONObject json = new JSONObject();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		try {
			// 获得登录用户
			User user = (User) session.getAttribute(ConstantsUtil._LOGIN_USER);
			if (null == user) {
				json.put("result", 2);
				json.put("desc", "用户未登录");
				return json.toJSONString();
			}
			if (!file.isEmpty()) {
				// 文件名
				String fileName = file.getOriginalFilename();
				// 时间目录
				String dateDir = sdf.format(new Date());
				// 本地测试使用
				String path = request.getSession().getServletContext()
						.getRealPath(File.separator);
				// 上传文件存放目录
				String folderPath = path + "upload" + File.separator
						+ user.getId() + File.separator + dateDir;
				// 上传文件完整路径
				String filePath = folderPath + File.separator + fileName;
				// 选定上传的目录此处为当前目录，没有则创建
				if (!new File(folderPath).isDirectory())
					new File(folderPath).mkdirs();
				// 保存文件
				file.transferTo(new File(filePath));
				// 远程文件路径
				String remotePath = request.getScheme()
						+ "://"
						+ request.getServerName()
						+ (request.getServerPort() == 80 ? "" : ":"
								+ request.getServerPort())
						+ request.getContextPath() + "/" + "upload" + "/"
						+ dateDir + "/" + user.getId() + "/" + fileName;
				json.put("dataUrl", filePath);
				json.put("remoteUrl", remotePath);
				json.put("result", 0);
				json.put("desc", "成功");
			} else {
				json.put("result", 1);
				json.put("desc", "失败");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			json.put("result", -1);
			json.put("desc", "异常");
		}
		return json.toJSONString();
	}
}
