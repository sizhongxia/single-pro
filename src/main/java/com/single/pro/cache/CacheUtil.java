package com.single.pro.cache;

import java.util.Collection;
import java.util.Map;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;

import net.oschina.j2cache.CacheChannel;
import net.oschina.j2cache.CacheObject;
import net.oschina.j2cache.J2Cache;

public class CacheUtil implements InitializingBean, DisposableBean {

	private static CacheChannel cache = null;

	/***
	 * 简单缓存值
	 * 
	 * @param region
	 * @param key
	 * @param value
	 */
	public static void set(String region, String key, Object value) {
		cache.set(region, key, value);
	}

	/***
	 * 批量缓存
	 * 
	 * @param region
	 * @param elements
	 */
	public static void set(String region, Map<String, Object> elements) {
		cache.set(region, elements);
	}

	/***
	 * 获取单个数据
	 * 
	 * @param region
	 * @param key
	 * @return
	 */
	public static CacheObject get(String region, String key) {
		return cache.get(region, key);
	}

	/***
	 * 批量获取数据
	 * 
	 * @param region
	 * @param keys
	 * @return
	 */
	public static Map<String, CacheObject> get(String region, Collection<String> keys) {
		return cache.get(region, keys);
	}

	/***
	 * 检查key是否存在
	 * 
	 * @param region
	 * @param key
	 * @return
	 */
	public static boolean exists(String region, String key) {
		return cache.exists(region, key);
	}

	/**
	 * 移除
	 * 
	 * @param region
	 * @param keys
	 */
	public static void evict(String region, String... keys) {
		cache.evict(region, keys);
	}

	/***
	 * 类初始化时加载执行
	 */
	@Override
	public void afterPropertiesSet() throws Exception {
		cache = J2Cache.getChannel();
	}

	/***
	 * 类销毁时执行
	 */
	@Override
	public void destroy() throws Exception {
		cache.close();
	}

}
