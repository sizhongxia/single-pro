package com.single.pro.web;

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
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.code.kaptcha.Constants;
import com.single.pro.service.UserService;
import com.single.pro.util.Md5Util;

@Controller
@RequestMapping("auth")
public class AuthController extends BaseController {

	@Autowired
	UserService userService;

	public AuthController() {
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response) {

		String referer = request.getParameter("referer");
		if (StringUtils.isBlank(referer)) {
			referer = "/index.do";
		}

		String[] rm = referer.split("[?]");
		if (rm.length > 1) {
			referer = "/operation_timeout.do";
		} else {
			referer = rm[0];
		}

		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated()) {
			return "redirect:" + referer;
		}

		Session session = subject.getSession();
		
		System.out.println(request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY));

		String verifyCode = request.getParameter("verifyCode");
		if (StringUtils.isBlank(verifyCode)) {
			// session.setAttribute("login_fail_msg", "请输入图片验证码");
			return "redirect:/login.do";
		}

//		Object KAPTCHA_verifyCode = session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
//		if (KAPTCHA_verifyCode == null) {
//			session.setAttribute("login_fail_msg", "无效的图片验证码");
//			return "redirect:/login.do";
//		}

//		if (!verifyCode.equalsIgnoreCase(KAPTCHA_verifyCode.toString())) {
//			session.setAttribute("login_fail_msg", "图片验证码输入错误");
//			return "redirect:/login.do";
//		}

		String username = request.getParameter("loginName");
		if (StringUtils.isBlank(username)) {
			session.setAttribute("login_fail_msg", "请输入登录名称");
			return "redirect:/login.do";
		}

		String password = request.getParameter("password");
		if (StringUtils.isBlank(password)) {
			session.setAttribute("login_fail_msg", "请输入登录密码");
			return "redirect:/login.do";
		}

		UsernamePasswordToken token = new UsernamePasswordToken(username, Md5Util.md5(password, username));
		token.setRememberMe(false);

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
		if (StringUtils.isBlank(msg)) {
			msg = "登录成功";
		}
		if (subject.isAuthenticated()) {
			return "redirect:" + referer;
		} else {
			session.setAttribute("login_fail_msg", msg);
			return "redirect:/login.do";
		}
	}
}
