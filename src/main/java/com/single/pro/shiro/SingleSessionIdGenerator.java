package com.single.pro.shiro;

import java.io.Serializable;
import java.util.UUID;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionIdGenerator;

public class SingleSessionIdGenerator implements SessionIdGenerator {
	/**
	 * 自定义SessionID生成
	 */
	@Override
	public Serializable generateId(Session session) {
		return UUID.randomUUID().toString().toLowerCase().replaceAll("-", "");
	}
}