package com.single.pro.cache;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.single.pro.entity.BasicCity;
import com.single.pro.entity.DictionaryItem;
import com.single.pro.entity.DictionaryType;
import com.single.pro.entity.ProductKind;
import com.single.pro.entity.ProductType;
import com.single.pro.entity.RoleApp;
import com.single.pro.entity.System;
import com.single.pro.entity.SystemApp;
import com.single.pro.model.CityModel;
import com.single.pro.model.DictionaryItemModel;
import com.single.pro.redis.CacheUtil;
import com.single.pro.service.BasicCityService;
import com.single.pro.service.DictionaryItemService;
import com.single.pro.service.DictionaryTypeService;
import com.single.pro.service.ProductKindService;
import com.single.pro.service.ProductTypeService;
import com.single.pro.service.SystemAppService;
import com.single.pro.service.SystemService;
import com.single.pro.shiro.realm.JDBCRealm;
import com.single.pro.storage.RealHostReplace;
import com.single.pro.util.ShaUtil;

import redis.clients.jedis.JedisPubSub;

public class BaseDataCacheUtil implements InitializingBean {

	private Logger logger = LoggerFactory.getLogger(BaseDataCacheUtil.class);

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
	@Autowired
	private ProductKindService productKindService;
	@Autowired
	private ProductTypeService productTypeService;
	@Autowired
	private CacheUtil cacheUtil;

	public String setPageCsrf(String page) {
		String csrf = ShaUtil.sha1(UUID.randomUUID().toString());
		cacheUtil.setex("single:cache:csrf:" + SecurityUtils.getSubject().getSession(true).getId() + ":" + page,
				60 * 60 * 1, csrf);
		return csrf;
	}

	public String getPageCsrf(String page) {
		return cacheUtil.get("single:cache:csrf:" + SecurityUtils.getSubject().getSession(true).getId() + ":" + page);
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

	public List<DictionaryItemModel> getDictItems(String typeCode) {
		List<DictionaryItemModel> itemModels = new ArrayList<>();
		if (StringUtils.isBlank(typeCode)) {
			return itemModels;
		}
		List<DictionaryItem> items = null;
		String res = cacheUtil.hget("single:cache:system:dict:type", typeCode);
		if (res != null) {
			items = JSON.parseArray(res, DictionaryItem.class);
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
		if (StringUtils.isBlank(code)) {
			return "";
		}
		DictionaryItem item = null;
		String res = cacheUtil.hget("single:cache:system:dict:item", code);
		if (res != null) {
			item = JSON.parseObject(res, DictionaryItem.class);
		}
		if (item != null) {
			return item.getName();
		}
		return "";
	}

	public CityModel getCityModel(String code) {
		if (StringUtils.isBlank(code)) {
			return null;
		}
		String res = cacheUtil.hget("single:cache:system:city", code);
		if (res != null) {
			return JSON.parseObject(res, CityModel.class);
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

	public ProductKind getProductKindById(String id) {
		if (StringUtils.isBlank(id)) {
			return null;
		}
		String res = cacheUtil.hget("single:cache:system:product:kind", id);
		if (res != null) {
			return JSON.parseObject(res, ProductKind.class);
		}
		return null;
	}

	public String getProductKindNameById(String id) {
		ProductKind productKind = getProductKindById(id);
		if (productKind == null) {
			return "";
		}
		return productKind.getName();
	}

	public ProductType getProductTypeById(String id) {
		if (StringUtils.isBlank(id)) {
			return null;
		}
		String res = cacheUtil.hget("single:cache:system:product:type", id);
		if (res != null) {
			return JSON.parseObject(res, ProductType.class);
		}
		return null;
	}

	public String getProductTypeNameById(String id) {
		ProductType productType = getProductTypeById(id);
		if (productType == null) {
			return "";
		}
		return productType.getName();
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

	public void updateCachePublish(String type) {
		cacheUtil.publish("update_single_pro_cache", type);
	}

	// 初始化应用信息
	public System getSystemInfo() {
		System system = null;
		if (!cacheUtil.exists("single:cache:system:info")) {
			Wrapper<System> wrapper = new EntityWrapper<System>();
			system = systemService.selectOne(wrapper);
			if (system == null) {
				throw new RuntimeException("请先配置系统应用基本信息");
			}
			system.setLogoUrl(RealHostReplace.getResUrl(system.getLogoUrl()));
			cacheUtil.set("single:cache:system:info", JSON.toJSONString(system, false));
		} else {
			String res = cacheUtil.get("single:cache:system:info");
			if (res != null) {
				system = JSON.parseObject(res, System.class);
			}
		}
		return system;
	}

	public List<SystemApp> getSystemApps() {
		if (!cacheUtil.exists("single:cache:system:apps")) {
			Wrapper<SystemApp> wrapper = new EntityWrapper<>();
			wrapper.orderBy("sort_no", true);
			List<SystemApp> apps = systemAppService.selectList(wrapper);
			if (apps == null || apps.isEmpty()) {
				throw new RuntimeException("无系统应用");
			}
			cacheUtil.set("single:cache:system:apps", JSON.toJSONString(apps, false));
			return apps;
		} else {
			String res = cacheUtil.get("single:cache:system:apps");
			if (res != null) {
				return JSON.parseArray(res, SystemApp.class);
			}
		}
		return null;
	}

	private void loadDictItems() {
		if (!cacheUtil.exists("single:cache:system:dict:type") || !cacheUtil.exists("single:cache:system:dict:item")) {
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
						cacheUtil.hset("single:cache:system:dict:type", type.getCode(),
								JSON.toJSONString(items, false));
						for (DictionaryItem item : items) {
							cacheUtil.hset("single:cache:system:dict:item", item.getCode(),
									JSON.toJSONString(item, false));
						}
					}
				}
			}
		}
	}

	private void loadCityDatas() {
		if (!cacheUtil.exists("single:cache:system:city")) {
			Wrapper<BasicCity> wrapper = new EntityWrapper<>();
			int page = 1;
			while (true) {
				PageHelper.startPage(page, 1000);
				List<BasicCity> cities = basicCityService.selectList(wrapper);
				PageInfo<BasicCity> pageInfo = new PageInfo<BasicCity>(cities);
				if (pageInfo.getList() == null || pageInfo.getList().isEmpty()) {
					break;
				} else {
					page++;
				}
				CityModel cm = null;
				for (BasicCity bc : pageInfo.getList()) {
					cm = new CityModel();
					cm.setCode(bc.getCode());
					cm.setName(bc.getName());
					cm.setPinyin(bc.getPinyin());
					cm.setJianpin(bc.getJianpin());
					cacheUtil.hset("single:cache:system:city", cm.getCode(), JSON.toJSONString(cm, false));
				}
			}
		}
	}

	public List<ProductKind> getProductKinds() {
		if (!cacheUtil.exists("single:cache:system:product:kind")) {
			Wrapper<ProductKind> wrapper = new EntityWrapper<>();
			wrapper.eq("status", "Y");
			wrapper.orderBy("create_time", true);
			List<ProductKind> productKinds = productKindService.selectList(wrapper);
			if (productKinds != null && productKinds.size() > 0) {
				for (ProductKind productKind : productKinds) {
					cacheUtil.hset("single:cache:system:product:kind", productKind.getId(),
							JSON.toJSONString(productKind, false));
				}
				return productKinds;
			}
		} else {
			Map<String, String> res = cacheUtil.hgetAll("single:cache:system:product:kind");
			List<ProductKind> productKinds = new ArrayList<>();
			if (res != null && !res.isEmpty()) {
				for (Map.Entry<String, String> r : res.entrySet()) {
					productKinds.add(JSON.parseObject(r.getValue(), ProductKind.class));
				}
			}
		}
		return null;
	}

	public List<ProductType> getProductTypes() {
		if (!cacheUtil.exists("single:cache:system:product:type")) {
			Wrapper<ProductType> wrapper = new EntityWrapper<>();
			wrapper.eq("status", "Y");
			wrapper.orderBy("create_time", true);
			List<ProductType> productTypes = productTypeService.selectList(wrapper);
			if (productTypes != null && productTypes.size() > 0) {
				for (ProductType productType : productTypes) {
					cacheUtil.hset("single:cache:system:product:type", productType.getId(),
							JSON.toJSONString(productType, false));
				}
				return productTypes;
			}
		} else {
			Map<String, String> res = cacheUtil.hgetAll("single:cache:system:product:type");
			List<ProductType> productTypes = new ArrayList<>();
			if (res != null && !res.isEmpty()) {
				for (Map.Entry<String, String> r : res.entrySet()) {
					productTypes.add(JSON.parseObject(r.getValue(), ProductType.class));
				}
			}
			return productTypes;
		}
		return null;
	}

	// 类初始化时加载执行
	@Override
	public void afterPropertiesSet() throws Exception {
		initCacheData();
		new Thread(new Runnable() {
			@Override
			public void run() {
				cacheUtil.subscribe(new JedisPubSub() {
					@Override
					public void onMessage(String channel, String message) {
						if ("update_single_pro_cache".equals(channel) && StringUtils.isNotBlank(message))
							reInitCacheData(message);
					}
				}, "update_single_pro_cache");
			}
		}).start();
	}

	private void initCacheData() {
		logger.info("init system info cache data...");
		getSystemInfo();
		logger.info("init system apps cache data...");
		getSystemApps();
		logger.info("init dict cache data...");
		loadDictItems();
		logger.info("init city cache data...");
		loadCityDatas();
		logger.info("init product kind cache data...");
		getProductKinds();
		logger.info("init product type cache data...");
		getProductTypes();
	}

	private void reInitCacheData(String type) {
		if ("system:info".equals(type)) {
			logger.info("clear system info cache data...");
			cacheUtil.del("single:cache:system:info");
			logger.info("init system info cache data...");
			getSystemInfo();
		} else if ("system:apps".equals(type)) {
			logger.info("clear system apps cache data...");
			cacheUtil.del("single:cache:system:apps");
			logger.info("init system apps cache data...");
			getSystemApps();
		} else if ("dict".equals(type)) {
			logger.info("clear dict type cache data...");
			cacheUtil.del("single:cache:system:dict:type");
			logger.info("clear dict item cache data...");
			cacheUtil.del("single:cache:system:dict:item");
			logger.info("init dict cache data...");
			loadDictItems();
		} else if ("city".equals(type)) {
			logger.info("clear city cache data...");
			cacheUtil.del("single:cache:system:city");
			logger.info("init city cache data...");
			loadCityDatas();
		} else if ("product:kind".equals(type)) {
			logger.info("clear product kind cache data...");
			cacheUtil.del("single:cache:system:product:kind");
			logger.info("init product kind cache data...");
			getProductKinds();
		} else if ("product:type".equals(type)) {
			logger.info("clear product type cache data...");
			cacheUtil.del("single:cache:system:product:type");
			logger.info("init product type cache data...");
			getProductTypes();
		} else {
			logger.error("通过类型：" + type + " 未找到缓存信息！");
		}
	}

}
