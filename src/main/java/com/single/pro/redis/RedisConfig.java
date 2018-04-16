package com.single.pro.redis;

import java.io.Serializable;

/**
 * Redis配置文件
 * 
 * @author sizho
 *
 */
public class RedisConfig implements Serializable {
	private static final long serialVersionUID = 1L;

	private String host;
	private int port;
	// Redis配置的验证密码
	private String auth;
	// 超时时间
	private int timeout;
	// 最大连接数
	private int maxTotal;
	// 最大空闲连接数
	private int maxIdle;
	// 最小连接数
	private int minIdle;
	// 最大等待时间ms
	private long maxWaitMillis;
	// 是否提前进行验证操作。如果为true，则得到的jedis实例均是可用的
	private boolean testOnBorrow;

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public int getPort() {
		return port;
	}

	public void setPort(int port) {
		this.port = port;
	}

	public int getTimeout() {
		return timeout;
	}

	public void setTimeout(int timeout) {
		this.timeout = timeout;
	}

	public int getMaxTotal() {
		return maxTotal;
	}

	public void setMaxTotal(int maxTotal) {
		this.maxTotal = maxTotal;
	}

	public int getMaxIdle() {
		return maxIdle;
	}

	public void setMaxIdle(int maxIdle) {
		this.maxIdle = maxIdle;
	}

	public int getMinIdle() {
		return minIdle;
	}

	public void setMinIdle(int minIdle) {
		this.minIdle = minIdle;
	}

	public long getMaxWaitMillis() {
		return maxWaitMillis;
	}

	public void setMaxWaitMillis(long maxWaitMillis) {
		this.maxWaitMillis = maxWaitMillis;
	}

	public boolean isTestOnBorrow() {
		return testOnBorrow;
	}

	public void setTestOnBorrow(boolean testOnBorrow) {
		this.testOnBorrow = testOnBorrow;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

}
