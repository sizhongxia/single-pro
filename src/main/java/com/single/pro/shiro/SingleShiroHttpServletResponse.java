package com.single.pro.shiro;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.apache.shiro.web.servlet.ShiroHttpServletResponse;

public class SingleShiroHttpServletResponse extends ShiroHttpServletResponse {

	public SingleShiroHttpServletResponse(HttpServletResponse wrapped, ServletContext context,
			ShiroHttpServletRequest request) {
		super(wrapped, context, request);
	}

	@Override
	public String encodeRedirectURL(String url) {
		return toEncoded(url, "");
	}

	@Override
	protected String toEncoded(String url, String sessionId) {
		if ((url == null) || (sessionId == null))
			return (url);
		String path = url;
		int question = url.indexOf('?');
		if (question >= 0) {
			path = url.substring(0, question);
		}
		int pound = path.indexOf('#');
		if (pound >= 0) {
			path = path.substring(0, pound);
		}
		return path;

	}

}
