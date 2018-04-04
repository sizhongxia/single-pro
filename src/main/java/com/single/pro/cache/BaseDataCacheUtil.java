package com.single.pro.cache;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.single.pro.entity.BasicCity;
import com.single.pro.entity.DictionaryItem;
import com.single.pro.entity.DictionaryType;
import com.single.pro.entity.RoleApp;
import com.single.pro.entity.System;
import com.single.pro.entity.SystemApp;
import com.single.pro.model.CityModel;
import com.single.pro.model.DictionaryItemModel;
import com.single.pro.service.BasicCityService;
import com.single.pro.service.DictionaryItemService;
import com.single.pro.service.DictionaryTypeService;
import com.single.pro.service.SystemAppService;
import com.single.pro.service.SystemService;
import com.single.pro.shiro.realm.JDBCRealm;
import com.single.pro.storage.RealHostReplace;

import net.oschina.j2cache.CacheObject;

public class BaseDataCacheUtil implements InitializingBean {

	@Autowired
	private SystemService systemService;
	@Autowired
	private SystemAppService systemAppService;
	@Autowired
	private DictionaryTypeService dictionaryTypeService;
	@Autowired
	private DictionaryItemService dictionaryItemService;
	@Autowired
	private BasicCityService basicCityService;

	public System getSystemInfo() {
		System system = getCacheSystemInfo();
		if (system == null) {
			initSystemInfo();
			return getCacheSystemInfo();
		}
		return system;
	}

	public List<SystemApp> getSystemApps() {
		// Wrapper<SystemApp> wrapper = new EntityWrapper<>();
		// wrapper.orderBy("sort_no", true);
		// List<SystemApp> systemApps = systemAppService.selectList(wrapper);
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

	@SuppressWarnings("unchecked")
	public List<DictionaryItemModel> getDictItems(String typeCode) {
		List<DictionaryItemModel> itemModels = new ArrayList<>();
		List<DictionaryItem> items = null;

		CacheObject cacheObject = CacheUtil.get("single:system:dict:type", typeCode);
		if (cacheObject != null) {
			Object obj = cacheObject.getValue();
			if (obj != null) {
				items = (List<DictionaryItem>) obj;
			}
		}

		if (items == null || items.isEmpty()) {
			return itemModels;
		}
		DictionaryItemModel itemModel = null;
		for (DictionaryItem item : items) {
			itemModel = new DictionaryItemModel();
			itemModel.setName(item.getName());
			itemModel.setCode(item.getCode());
			itemModels.add(itemModel);
		}
		return itemModels;
	}

	public String getDictItemName(String code) {
		DictionaryItem item = null;
		CacheObject cacheObject = CacheUtil.get("single:system:dict:item", code);
		if (cacheObject != null) {
			Object obj = cacheObject.getValue();
			if (obj != null) {
				item = (DictionaryItem) obj;
			}
		}
		if (item != null) {
			return item.getName();
		}
		return "";
	}

	public CityModel getCityModel(String code) {
		CacheObject cacheObject = CacheUtil.get("single:system:city", code);
		if (cacheObject != null) {
			Object obj = cacheObject.getValue();
			if (obj != null) {
				return (CityModel) obj;
			}
		}
		return null;
	}

	public String getCityName(String code) {
		CityModel cityModel = getCityModel(code);
		if (cityModel != null) {
			return cityModel.getName();
		}
		return "";
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
		system.setLogoUrl(RealHostReplace.getResUrl(system.getLogoUrl()));
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

	private void loadDictItems() {
		Wrapper<DictionaryType> dictionaryTypeWrapper = new EntityWrapper<>();
		dictionaryTypeWrapper.eq("status", "Y");
		List<DictionaryType> types = dictionaryTypeService.selectList(dictionaryTypeWrapper);
		if (types != null) {
			for (DictionaryType type : types) {
				Wrapper<DictionaryItem> wrapper = new EntityWrapper<>();
				wrapper.eq("status", "Y");
				wrapper.eq("type_id", type.getId());
				wrapper.orderBy("code asc");
				List<DictionaryItem> items = dictionaryItemService.selectList(wrapper);
				if (items != null && !items.isEmpty()) {
					CacheUtil.set("single:system:dict:type", type.getCode(), items);
					for (DictionaryItem item : items) {
						CacheUtil.set("single:system:dict:item", item.getCode(), item);
					}
				}
			}
		}
	}

	private void loadCityDatas() {
		Wrapper<BasicCity> wrapper = new EntityWrapper<>();
		List<BasicCity> cities = basicCityService.selectList(wrapper);
		CityModel cm = null;
		for (BasicCity bc : cities) {
			cm = new CityModel();
			cm.setCode(bc.getCode());
			cm.setName(bc.getName());
			cm.setPinyin(bc.getPinyin());
			cm.setJianpin(bc.getJianpin());
			CacheUtil.set("single:system:city", bc.getCode(), cm);
		}
	}

	// 类初始化时加载执行
	@Override
	public void afterPropertiesSet() throws Exception {
		initSystemInfo();
		initSystemApps();
		loadDictItems();
		loadCityDatas();
	}

}
