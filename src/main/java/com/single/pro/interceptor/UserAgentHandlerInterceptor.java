package com.single.pro.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alibaba.fastjson.JSON;
import com.single.pro.model.VisitUserAgent;
import com.single.pro.util.RequestUtil;

public class UserAgentHandlerInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(RequestUtil.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//		logger.info("RequestedSessionId: " + request.getRequestedSessionId());
//		logger.info("RequestURI: " + request.getRequestURI());
//		Map<String, String[]> requestData = request.getParameterMap();
//		if (requestData != null && !requestData.isEmpty()) {
//			String queryString = JSON.toJSON(requestData).toString();
//			logger.info("QueryString: " + queryString.toString());
//		}
//		VisitUserAgent vua = RequestUtil.initUserAgent(request);
//		request.setAttribute("vua", vua);
//		logger.info(vua.getUserAgent());
		return super.preHandle(request, response, handler);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
//		logger.info("Response ContentType: " + response.getContentType());
//		logger.info("Response Status: " + response.getStatus());
	}

}
