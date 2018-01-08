package com.single.pro.util;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

public final class SpringBeanUtil {

	// 获取web容器上下文
	private static WebApplicationContext wac = ContextLoader.getCurrentWebApplicationContext();

	public static Object getBeanByName(String beanId) throws Exception {
		if (StringUtils.isBlank(beanId)) {
			throw new Exception("beanId is null");
		}
		return wac.getBean(beanId);

	}
	@SuppressWarnings("unchecked")
	public static <T> T getBeanByType(Class<?> clazz) {
		if (clazz == null) {
			return null;
		}
		return (T) wac.getBean(clazz);
	}
}
