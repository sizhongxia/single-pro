package com.single.pro.cache;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.single.pro.entity.Application;
import com.single.pro.service.ApplicationService;

public class BaseDataCacheUtil implements InitializingBean {

	@Autowired
	private ApplicationService applicationService;

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getMenuList() {
		Object obj = CacheUtil.get("single:system", "menu").getValue();
		if (obj == null) {
			throw new RuntimeException("初始化系统菜单失败！！！");
		}
		return (List<Map<String, Object>>) obj;
	}

	public Application getApplication() {
		Object obj = CacheUtil.get("single:system", "application").getValue();
		if (obj == null) {
			throw new RuntimeException("初始化系统基本信息失败！！！");
		}
		return (Application) obj;
	}


	// 初始化应用信息
	private void initApplicationData() {
		Application entity = new Application();
		entity.setStatus("Y");
		Wrapper<Application> wrapper = new EntityWrapper<Application>(entity);
		CacheUtil.set("single:system", "application", applicationService.selectOne(wrapper));
	}

	// 类初始化时加载执行
	@Override
	public void afterPropertiesSet() throws Exception {
		initApplicationData();
	}

}
