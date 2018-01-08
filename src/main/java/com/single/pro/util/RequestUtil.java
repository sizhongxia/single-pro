package com.single.pro.util;

import javax.servlet.http.HttpServletRequest;

import com.single.pro.model.VisitUserAgent;

import nl.bitwalker.useragentutils.Browser;
import nl.bitwalker.useragentutils.BrowserType;
import nl.bitwalker.useragentutils.OperatingSystem;
import nl.bitwalker.useragentutils.UserAgent;
import nl.bitwalker.useragentutils.Version;

public class RequestUtil {

	public static boolean isAjaxRequest(HttpServletRequest request) {
		String requestedWith = request.getHeader("x-requested-with");
		return requestedWith != null && requestedWith.equalsIgnoreCase("XMLHttpRequest");
	}

	public static VisitUserAgent initUserAgent(HttpServletRequest request) {
		VisitUserAgent vua = new VisitUserAgent();
		String userAgent = request.getHeader("User-Agent");
		vua.setUserAgent(userAgent);
		
		UserAgent agent = UserAgent.parseUserAgentString(userAgent);
		OperatingSystem operatingSystem = agent.getOperatingSystem();
		if (operatingSystem != null) {
			vua.setOperatingSystem(operatingSystem.getName());
		} else {
			vua.setOperatingSystem("Unknown");
		}
		Browser browser = agent.getBrowser();
		if (browser != null) {
			vua.setBrowser(browser.getName());
		} else {
			vua.setBrowser("Unknown");
		}

		BrowserType browserType = browser.getBrowserType();
		if (browserType != null) {
			vua.setBrowserType(browserType.getName());
		} else {
			vua.setBrowserType("Unknown");
		}
		Version version = agent.getBrowserVersion();
		if (version != null) {
			vua.setMajorVersion(version.getMajorVersion());
			vua.setMinorVersion(version.getMinorVersion());
			vua.setBrowserVersion(version.getVersion());
		} else {
			vua.setMajorVersion("Unknown");
			vua.setMinorVersion("Unknown");
			vua.setBrowserVersion("Unknown");
		}
		return vua;
	}

}
