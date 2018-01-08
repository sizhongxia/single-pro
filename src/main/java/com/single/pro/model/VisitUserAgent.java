package com.single.pro.model;

public class VisitUserAgent {
	private String userAgent;
	private String operatingSystem;
	private String browser;
	private String browserType;
	private String majorVersion;
	private String minorVersion;
	private String browserVersion;

	public String getUserAgent() {
		return userAgent;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}

	public String getOperatingSystem() {
		return operatingSystem;
	}

	public void setOperatingSystem(String operatingSystem) {
		this.operatingSystem = operatingSystem;
	}

	public String getBrowser() {
		return browser;
	}

	public void setBrowser(String browser) {
		this.browser = browser;
	}

	public String getBrowserType() {
		return browserType;
	}

	public void setBrowserType(String browserType) {
		this.browserType = browserType;
	}

	public String getMajorVersion() {
		return majorVersion;
	}

	public void setMajorVersion(String majorVersion) {
		this.majorVersion = majorVersion;
	}

	public String getMinorVersion() {
		return minorVersion;
	}

	public void setMinorVersion(String minorVersion) {
		this.minorVersion = minorVersion;
	}

	public String getBrowserVersion() {
		return browserVersion;
	}

	public void setBrowserVersion(String browserVersion) {
		this.browserVersion = browserVersion;
	}

	@Override
	public String toString() {
		return "VisitUserAgent [userAgent=" + userAgent + ", operatingSystem=" + operatingSystem + ", browser="
				+ browser + ", browserType=" + browserType + ", majorVersion=" + majorVersion + ", minorVersion="
				+ minorVersion + ", browserVersion=" + browserVersion + "]";
	}

}
