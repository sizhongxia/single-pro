package com.single.pro.cache;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.single.pro.entity.Application;
import com.single.pro.entity.Menu;
import com.single.pro.service.ApplicationService;
import com.single.pro.service.MenuService;

public class BaseDataCacheUtil implements InitializingBean {

	@Autowired
	private MenuService menuService;
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

	// 初始化菜单信息
	@SuppressWarnings("unchecked")
	private void initMenuData() {
		Menu entity = new Menu();
		entity.setStatus("Y");
		Wrapper<Menu> wrapper = new EntityWrapper<Menu>(entity);
		wrapper.orderBy("sort_number", true);
		List<Menu> menus = menuService.selectList(wrapper);
		List<Map<String, Object>> roots = new ArrayList<>();
		for (Menu menu : menus) {
			if (menu.getParentId() == null || menu.getParentId() < 1) {
				roots.add(menuObj2Map(menu, true));
			}
		}
		for (Map<String, Object> root : roots) {
			for (Menu menu : menus) {
				if (new Integer(root.get("id").toString()).equals(menu.getParentId())) {
					List<Map<String, Object>> childs = (List<Map<String, Object>>) root.get("childs");
					childs.add(menuObj2Map(menu, false));
				}
			}
		}
		for (Map<String, Object> root : roots) {
			List<Map<String, Object>> childs = (List<Map<String, Object>>) root.get("childs");
			if (childs == null || childs.isEmpty()) {
				root.put("hadChilds", false);
			} else {
				root.put("url", "javascript:;");
				root.put("hadChilds", true);
			}
		}
		CacheUtil.set("single:system", "menu", roots);
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
		initMenuData();
		initApplicationData();
	}

	// 菜单对象转Map
	private Map<String, Object> menuObj2Map(Menu menu, boolean isRoot) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", menu.getId());
		map.put("title", menu.getTitle());
		map.put("icon", menu.getIcon());
		map.put("url", menu.getUrl());
		if (menu.getUrl() == null || StringUtils.isEmpty(menu.getUrl())) {
			map.put("url", "no_config_url");
		}
		if (isRoot) {
			map.put("childs", new ArrayList<Map<String, Object>>());
		}
		return map;
	}

}
