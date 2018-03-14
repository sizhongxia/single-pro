package com.single.pro.cache;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.support.PropertiesLoaderUtils;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.single.pro.entity.RoleApp;
import com.single.pro.entity.System;
import com.single.pro.entity.SystemApp;
import com.single.pro.service.SystemAppService;
import com.single.pro.service.SystemService;
import com.single.pro.shiro.realm.JDBCRealm;

public class BaseDataCacheUtil implements InitializingBean {

	@Autowired
	private SystemService systemService;
	@Autowired
	private SystemAppService systemAppService;

	private static String UPLOAD_SAVE_PATH = "";
	private static String UPLOAD_REQ_PATH = "";

	public String getUploadSavePath() {
		if (StringUtils.isBlank(UPLOAD_SAVE_PATH)) {
			try {
				loadUploadProperties();
			} catch (IOException e) {
				throw new RuntimeException("load upload.properties faile!!!");
			}
		}
		return UPLOAD_SAVE_PATH;
	}

	public String getUploadReqPath() {
		if (StringUtils.isBlank(UPLOAD_REQ_PATH)) {
			try {
				loadUploadProperties();
			} catch (IOException e) {
				throw new RuntimeException("load upload.properties faile!!!");
			}
		}
		return UPLOAD_REQ_PATH;
	}

	public System getSystemInfo() {
		System system = getCacheSystemInfo();
		if (system == null) {
			initSystemInfo();
			return getCacheSystemInfo();
		}
		return system;
	}

	public List<SystemApp> getSystemApps() {
		List<SystemApp> systemApps = getCacheSystemApps();
		if (systemApps == null) {
			initSystemApps();
			return getCacheSystemApps();
		}
		return systemApps;
	}

	public SystemApp getSystemAppById(String id) {
		List<SystemApp> systemApps = getSystemApps();
		if (systemApps == null) {
			return null;
		}
		for (SystemApp systemApp : systemApps) {
			if (systemApp.getId().equals(id)) {
				return systemApp;
			}
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<SystemApp> getUserApps() {
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		Object obj = session.getAttribute(JDBCRealm.USER_ROLE_APP_AUTH_KEY);
		List<SystemApp> apps = new ArrayList<>();
		if (obj != null) {
			List<RoleApp> roleApps = (List<RoleApp>) obj;
			for (RoleApp app : roleApps) {
				SystemApp systemApp = getSystemAppById(app.getAppId());
				if (systemApp != null) {
					apps.add(systemApp);
				}
			}
		}

		apps.sort(new Comparator<SystemApp>() {
			@Override
			public int compare(SystemApp o1, SystemApp o2) {
				return o1.getSortNo() - o2.getSortNo();
			}
		});

		return apps;
	}

	public boolean checkUserApps(String appId) {
		List<SystemApp> roleApps = getUserApps();
		for (SystemApp app : roleApps) {
			if (app.getId().equals(appId)) {
				return true;
			}
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	public boolean checkUserMenus(String menuId) {
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		Object obj = session.getAttribute(JDBCRealm.USER_ROLE_MENU_AUTH_KEY);
		if (obj != null) {
			Set<String> menuIds = (Set<String>) obj;
			return menuIds.contains(menuId);
		}
		return false;
	}

	private System getCacheSystemInfo() {
		Object obj = CacheUtil.get("single:system", "info").getValue();
		if (obj != null) {
			return (System) obj;
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	private List<SystemApp> getCacheSystemApps() {
		Object obj = CacheUtil.get("single:system", "apps").getValue();
		if (obj != null) {
			return (List<SystemApp>) obj;
		}
		return null;
	}

	// 初始化应用信息
	private void initSystemInfo() {
		Wrapper<System> wrapper = new EntityWrapper<System>();
		System system = systemService.selectOne(wrapper);
		if (system == null) {
			throw new RuntimeException("请先配置系统应用基本信息");
		}
		system.setLogoUrl(UPLOAD_REQ_PATH + system.getLogoUrl());
		CacheUtil.set("single:system", "info", system);
	}

	private void initSystemApps() {
		Wrapper<SystemApp> wrapper = new EntityWrapper<>();
		wrapper.orderBy("sort_no", true);
		List<SystemApp> apps = systemAppService.selectList(wrapper);
		if (apps == null || apps.isEmpty()) {
			throw new RuntimeException("无系统应用");
		}
		CacheUtil.set("single:system", "apps", apps);
	}

	private void loadUploadProperties() throws IOException {
		Properties props = PropertiesLoaderUtils.loadAllProperties("upload.properties");
		UPLOAD_SAVE_PATH = props.getProperty("save_path");
		UPLOAD_REQ_PATH = props.getProperty("req_path");
	}

	// 类初始化时加载执行
	@Override
	public void afterPropertiesSet() throws Exception {
		loadUploadProperties();
		
		initSystemInfo();
		initSystemApps();
	}

}
