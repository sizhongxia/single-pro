package com.single.pro.storage;

public class RealHostReplace {

	public static String host = "http://upyun.team-union.com/";

	public static String getResUrl(String path) {
		return (host + path).replaceAll("//", "/");
	}

}
