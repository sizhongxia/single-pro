package com.single.pro.holder;

public class CustomerContextHolder {
	private static final ThreadLocal<String> contextHolder = new ThreadLocal<String>();

	public static void setCustomerType(String type) {
		contextHolder.set(type);
	}

	public static String getCustomerType() {
		return contextHolder.get();
	}

	public static void clearCustomerType() {
		contextHolder.remove();
	}
}
