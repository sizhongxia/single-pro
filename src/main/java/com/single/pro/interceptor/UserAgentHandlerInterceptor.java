package com.single.pro.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.single.pro.model.VisitUserAgent;
import com.single.pro.util.RequestUtil;

public class UserAgentHandlerInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(RequestUtil.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.warn("Request Start");
		logger.warn("RequestedSessionId: " + request.getRequestedSessionId());
		logger.warn("RequestURI: " + request.getRequestURI());
		logger.warn("QueryString: " + request.getQueryString());
		VisitUserAgent vua = RequestUtil.initUserAgent(request);
		request.setAttribute("vua", vua);
		logger.warn(vua.getUserAgent());
		return super.preHandle(request, response, handler);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
		logger.warn("Response ContentType: " + response.getContentType());
		logger.warn("Response Status: " + response.getStatus());
		logger.warn("Request End");
	}

}
