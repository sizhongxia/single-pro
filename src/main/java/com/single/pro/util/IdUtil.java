package com.single.pro.util;

import java.util.UUID;

public class IdUtil {
	public static String id() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	public static void main(String[] args) {
		System.out.println(id());
		System.out.println(id());
		System.out.println(id().length());
	}
}
