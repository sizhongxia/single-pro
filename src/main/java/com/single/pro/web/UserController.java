package com.single.pro.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.single.pro.entity.SystemUser;
import com.single.pro.service.SystemUserService;
import com.single.pro.util.Md5Util;

@Controller
@RequestMapping("user")
public class UserController extends BaseController {

	@Autowired
	SystemUserService systemUserService;

	@RequiresAuthentication
	@RequestMapping(value = { "/changePwd" }, method = { RequestMethod.GET })
	public ModelAndView changePwd(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/changePwd");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/updatePwd" }, method = { RequestMethod.POST })
	public Map<String, Object> updatePwd(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		String opassword = request.getParameter("opassword");
		if (StringUtils.isBlank(opassword)) {
			res.put("statusCode", -1);
			res.put("errMsg", "请输入原始密码");
			return res;
		}
		String password = request.getParameter("password");
		if (StringUtils.isBlank(password)) {
			res.put("statusCode", -1);
			res.put("errMsg", "请输入新密码");
			return res;
		}
		String password2 = request.getParameter("password2");
		if (!password.equals(password2)) {
			res.put("statusCode", -1);
			res.put("errMsg", "两次密码输入不一致");
			return res;
		}

		String pwd = Md5Util.md5(opassword);

		Subject subject = SecurityUtils.getSubject();
		SystemUser user = (SystemUser) subject.getPrincipal();

		user = systemUserService.selectById(user.getId());
		if (!user.getPassword().equals(pwd)) {
			res.put("statusCode", -1);
			res.put("errMsg", "无效的原密码");
			return res;
		}

		String newPwd = Md5Util.md5(password);
		if (newPwd.equals(pwd)) {
			res.put("statusCode", 0);
			return res;
		}

		user.setPassword(Md5Util.md5(password));

		if (!systemUserService.updateById(user)) {
			res.put("statusCode", -1);
			res.put("errMsg", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		return res;
	}

}
