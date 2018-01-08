package com.single.pro.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.subject.Subject;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthHandlerInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (handler.getClass().isAssignableFrom(HandlerMethod.class)) {
			RequiresAuthentication requiresAuthentication = (RequiresAuthentication) ((HandlerMethod) handler)
					.getMethodAnnotation(RequiresAuthentication.class);
			if (requiresAuthentication != null) {
				Subject subject = SecurityUtils.getSubject();
				Object user = subject.getPrincipal();
				if (user == null) {
					String param = request.getQueryString();
					String uri = request.getRequestURI();
					if (StringUtils.isNotBlank(param)) {
						uri = uri + "?" + param;
					}
					subject.getSession(true).setAttribute("referer", uri);
					throw new UnauthenticatedException();
				}
				request.setAttribute("user", user);
			}
		}

		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}

}
