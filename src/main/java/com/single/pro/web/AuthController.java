package com.single.pro.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.single.pro.util.Md5Util;

@Controller
@RequestMapping("auth")
public class AuthController extends BaseController {

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public Map<String, Object> login(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();

		String loginame = request.getParameter("loginame");
		if (StringUtils.isBlank(loginame)) {
			res.put("statusCode", -1);
			res.put("errMsg", "请输入登录名");
			return res;
		}

		String password = request.getParameter("password");
		if (StringUtils.isBlank(password)) {
			res.put("statusCode", -1);
			res.put("errMsg", "请输入密码");
			return res;
		}

		UsernamePasswordToken token = new UsernamePasswordToken(loginame, Md5Util.md5(password));
		token.setRememberMe(false);

		Subject subject = SecurityUtils.getSubject();
		String msg = "";
		try {
			subject.login(token);
		} catch (IncorrectCredentialsException e) {
			msg = "登录密码错误.";
		} catch (LockedAccountException e) {
			msg = "帐号已被锁定.";
		} catch (DisabledAccountException e) {
			msg = "帐号已被禁用.";
		} catch (UnknownAccountException e) {
			msg = "帐号不存在.";
		} catch (UnauthorizedException e) {
			msg = "您没有得到相应的授权.";
		} catch (Exception e) {
			msg = "请稍后重试.";
		}
		if (subject.isAuthenticated()) {
			res.put("statusCode", 200);
		} else {
			res.put("statusCode", -1);
			res.put("errMsg", msg);
		}

		return res;
	}
}
