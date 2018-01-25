package com.j2cache;

import net.oschina.j2cache.CacheChannel;
import net.oschina.j2cache.J2Cache;

public class TestJ2Cache {
//	public static void main(String[] args) {
//		CacheChannel cache = J2Cache.getChannel();
//
//		// 缓存操作
//		cache.set("default", "1", "Hello J2Cache");
//		System.out.println(cache.get("default", "1"));
//		// cache.evict("default", "1");
//		System.out.println(cache.get("default", "1"));
//		System.out.println(cache.get("default", "2"));
//
//		cache.close();
//	}
	
	public static void main(String[] args) {
		CacheChannel cache = J2Cache.getChannel();
		// cache.set("default", "1", "Hello J2Cache");

		new Thread(new Runnable() {
			@Override
			public void run() {
				while(true) {
					// 缓存操作
					System.out.println(cache.get("default", "1"));
					try {
						Thread.sleep(2000);cache.close();
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}).start();
		
	}
}
