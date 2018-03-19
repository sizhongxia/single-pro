package com.single.pro.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.single.pro.cache.BaseDataCacheUtil;
import com.single.pro.cache.CacheUtil;
import com.single.pro.entity.System;
import com.single.pro.entity.SystemApp;
import com.single.pro.entity.SystemAuthword;
import com.single.pro.entity.SystemMenu;
import com.single.pro.service.SystemAppService;
import com.single.pro.service.SystemAuthwordService;
import com.single.pro.service.SystemMenuService;
import com.single.pro.service.SystemService;
import com.single.pro.util.IdUtil;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-02-28
 */
@Controller
@RequestMapping("/system")
public class SystemController extends BaseController {

	@Autowired
	private SystemService systemService;
	@Autowired
	private SystemMenuService systemMenuService;
	@Autowired
	private SystemAppService systemAppService;
	@Autowired
	private BaseDataCacheUtil baseDataCacheUtil;
	@Autowired
	private SystemAuthwordService systemAuthwordService;

	/***
	 * 系统基本配置
	 * 
	 * @param request
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value = "/config")
	public ModelAndView config(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("system/config");
		Wrapper<System> wrapper = new EntityWrapper<>();
		System system = systemService.selectOne(wrapper);
		if (system == null) {
			system = new System();
		}

		if (StringUtils.isNotBlank(system.getLogoUrl()) && !system.getLogoUrl().startsWith("http")) {
			system.setLogoUrl(baseDataCacheUtil.getUploadReqPath() + system.getLogoUrl());
		}

		mav.addObject("system", system);
		return mav;
	}

	/***
	 * 更新系统基本信息
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/config/update")
	public Map<String, Object> configUpdate(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			res.put("message", "无效的参数");
			return res;
		}

		System config = systemService.selectById(id);
		if (config == null) {
			res.put("message", "无效的参数");
			return res;
		}

		config.setTitle(request.getParameter("title"));
		// config.setSubtitle(request.getParameter("subtitle"));
		config.setWebsite(request.getParameter("website"));
		String logoUrl = request.getParameter("logoUrl");
		String reqLogoUrl = logoUrl;
		logoUrl = logoUrl.replaceAll(baseDataCacheUtil.getUploadReqPath(), "");
		config.setLogoUrl(logoUrl);
		config.setCopyright(request.getParameter("copyright"));

		if (!systemService.updateById(config)) {
			res.put("message", "未知错误");
			return res;
		}

		// 更新缓存信息
		config.setLogoUrl(reqLogoUrl);
		CacheUtil.set("single:system", "info", config);

		res.put("statusCode", 200);
		res.put("message", "更新成功");

		return res;
	}

	/***
	 * 获取当前用户授权的所有应用
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/apps")
	public Map<String, Object> apps(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		res.put("statusCode", 200);
		res.put("data", baseDataCacheUtil.getUserApps());
		return res;
	}

	// 所有应用选择
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/app/allSelect")
	public List<Map<String, Object>> appAllSelect(HttpServletRequest request, HttpServletResponse response) {
		Wrapper<SystemApp> wrapper = new EntityWrapper<>();
		wrapper.orderBy("sort_no", true);
		List<SystemApp> systemApps = systemAppService.selectList(wrapper);
		if (systemApps == null || systemApps.isEmpty()) {
			return new ArrayList<>();
		}
		List<Map<String, Object>> appList = new ArrayList<>();
		Map<String, Object> item = null;

		for (SystemApp systemApp : systemApps) {
			item = new HashMap<>();
			item.put("id", systemApp.getId());
			item.put("name", systemApp.getName());
			item.put("icon", systemApp.getIcon());
			item.put("sortNo", systemApp.getSortNo());
			item.put("state", "open");
			appList.add(item);
		}

		return appList;
	}

	/***
	 * 系统应用表单
	 * 
	 * @param request
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value = "/app/form")
	public ModelAndView appForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("system/app/form");
		return mav;
	}

	/***
	 * 系统应用详情
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/app/detail")
	public SystemApp appDetail(HttpServletRequest request) {
		SystemApp app = null;

		String id = request.getParameter("id");

		app = systemAppService.selectById(id);
		if (app == null) {
			app = new SystemApp();
		}
		return app;
	}

	/***
	 * 保存系统应用
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/app/save")
	public Map<String, Object> appSave(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		SystemApp app = new SystemApp();
		app.setId(IdUtil.id());
		app.setName(request.getParameter("name"));
		app.setIcon(request.getParameter("icon"));
		app.setSortNo(new Integer(request.getParameter("sortNo")));

		if (!systemAppService.insert(app)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "保存成功");
		return res;
	}

	/***
	 * 更新系统应用
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/app/update")
	public Map<String, Object> appUpdate(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			res.put("message", "无效的参数");
			return res;
		}

		SystemApp app = systemAppService.selectById(id);
		if (app == null) {
			res.put("message", "无效的参数");
			return res;
		}

		app.setName(request.getParameter("name"));
		app.setIcon(request.getParameter("icon"));
		app.setSortNo(new Integer(request.getParameter("sortNo")));

		if (!systemAppService.updateById(app)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

	/***
	 * 删除系统菜单
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/app/delete")
	public Map<String, Object> appDelete(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			res.put("statusCode", 300);
			res.put("message", "无效的参数");
			return res;
		}

		String[] ids = id.split(",");

		Set<String> idList = new HashSet<>();
		Wrapper<SystemMenu> wrapper = null;
		for (String idStr : ids) {
			wrapper = new EntityWrapper<>();
			wrapper.eq("app_id", idStr);
			if (systemMenuService.selectOne(wrapper) != null) {
				res.put("statusCode", 300);
				res.put("message", "请先删除该应用下的所有菜单");
				return res;
			}

			idList.add(idStr);
		}

		if (!systemAppService.deleteBatchIds(idList)) {
			res.put("statusCode", 300);
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "操作成功");
		return res;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/menus")
	public Map<String, Object> menus(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();

		String appId = request.getParameter("appId");
		String menuId = request.getParameter("menuId");

		if (StringUtils.isNotBlank(appId)) {
			List<Map<String, Object>> rootList = new ArrayList<>();

			if (baseDataCacheUtil.checkUserApps(appId)) {
				Wrapper<SystemMenu> wrapper = new EntityWrapper<>();
				wrapper.eq("app_id", appId);
				wrapper.eq("pid", "0");
				wrapper.orderBy("sort_no", true);
				List<SystemMenu> roots = systemMenuService.selectList(wrapper);
				if (roots == null || roots.isEmpty()) {
					res.put("statusCode", -1);
					res.put("errMsg", "无数据");
					return res;
				}
				// 转换
				Map<String, Object> item = null;
				for (SystemMenu menu : roots) {
					if (baseDataCacheUtil.checkUserMenus(menu.getId())) {
						item = new HashMap<>();
						item.put("id", menu.getId());
						item.put("pid", 0);
						item.put("text", menu.getText());
						item.put("state", "closed");
						item.put("iconCls", menu.getIcon());
						rootList.add(item);
					}
				}
			}

			res.put("statusCode", 200);
			res.put("data", rootList);
			return res;
		} else if (StringUtils.isNotBlank(menuId)) {
			List<Map<String, Object>> childList = new ArrayList<>();
			if (baseDataCacheUtil.checkUserMenus(menuId)) {
				Wrapper<SystemMenu> wrapper = new EntityWrapper<>();
				wrapper.eq("pid", menuId);
				wrapper.orderBy("sort_no", true);
				List<SystemMenu> childs = systemMenuService.selectList(wrapper);
				if (childs == null || childs.isEmpty()) {
					res.put("statusCode", -1);
					res.put("errMsg", "无数据");
					return res;
				}

				Map<String, Object> item = null;
				for (SystemMenu menu : childs) {
					if (baseDataCacheUtil.checkUserMenus(menu.getId())) {
						item = new HashMap<>();
						item.put("id", menu.getId());
						item.put("pid", menu.getPid());
						item.put("text", menu.getText());
						item.put("state", "open");
						item.put("iconCls", menu.getIcon());
						item.put("url", menu.getUrl());
						childList.add(item);
					}
				}
			}

			res.put("statusCode", 200);
			res.put("data", childList);
			return res;
		}

		return res;
	}

	/***
	 * 系统菜单
	 * 
	 * @param request
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value = "/menu")
	public ModelAndView menu(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("system/menu");
		return mav;
	}

	/***
	 * 新增一级菜单
	 * 
	 * @param request
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value = "/menu/level1form")
	public ModelAndView menuLevel1Form(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("system/menu/level1Form");
		return mav;
	}

	/***
	 * 新增二级菜单
	 * 
	 * @param request
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value = "/menu/level2form")
	public ModelAndView menuLevel2Form(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("system/menu/level2Form");
		return mav;
	}

	/***
	 * 系统菜单详情
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/menu/detail")
	public SystemMenu menuDetail(HttpServletRequest request) {
		SystemMenu menu = null;

		String id = request.getParameter("id");

		menu = systemMenuService.selectById(id);
		if (menu == null) {
			menu = new SystemMenu();
		}
		return menu;
	}

	/***
	 * 保存系统菜单
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/menu/save")
	public Map<String, Object> menuSave(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		SystemMenu menu = new SystemMenu();
		menu.setId(IdUtil.id());
		String pid = request.getParameter("pid");
		if (StringUtils.isBlank(pid)) {
			pid = "0";
		}
		menu.setPid(pid);

		String appId = request.getParameter("appId");
		if (StringUtils.isBlank(appId)) {
			if ("0".equals(appId)) {
				res.put("message", "请选择一个应用");
				return res;
			}
			SystemMenu pmenu = systemMenuService.selectById(pid);
			if (pmenu == null) {
				res.put("message", "无效的父级菜单");
				return res;
			}
			appId = pmenu.getAppId();
		}

		menu.setAppId(appId);
		menu.setText(request.getParameter("text"));
		String url = request.getParameter("url");
		if (StringUtils.isBlank(url)) {
			url = "";
		} else {
			if (url.startsWith("/")) {
				url = url.substring(1);
			}
		}
		menu.setUrl(url);
		menu.setIcon(request.getParameter("icon"));
		menu.setSortNo(new Integer(request.getParameter("sortNo")));

		if (!systemMenuService.insert(menu)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "保存成功");
		return res;
	}

	/***
	 * 更新系统菜单
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/menu/update")
	public Map<String, Object> menuUpdate(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			res.put("message", "无效的参数");
			return res;
		}

		SystemMenu menu = systemMenuService.selectById(id);
		if (menu == null) {
			res.put("message", "无效的参数");
			return res;
		}

		String pid = request.getParameter("pid");
		if (StringUtils.isBlank(pid)) {
			pid = "0";
		}

		String appId = request.getParameter("appId");
		if (StringUtils.isBlank(appId)) {
			if ("0".equals(appId)) {
				res.put("message", "请选择一个应用");
				return res;
			}
			SystemMenu pmenu = systemMenuService.selectById(pid);
			if (pmenu == null) {
				res.put("message", "无效的父级菜单");
				return res;
			}
			appId = pmenu.getAppId();
		}

		menu.setPid(pid);
		menu.setAppId(appId);
		menu.setText(request.getParameter("text"));
		String url = request.getParameter("url");
		if (StringUtils.isBlank(url)) {
			url = "";
		} else {
			if (url.startsWith("/")) {
				url = url.substring(1);
			}
		}
		menu.setUrl(url);
		menu.setIcon(request.getParameter("icon"));
		menu.setSortNo(new Integer(request.getParameter("sortNo")));

		if (!systemMenuService.updateById(menu)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

	/***
	 * 删除系统菜单
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/menu/delete")
	public Map<String, Object> menuDelete(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			res.put("statusCode", 300);
			res.put("message", "无效的参数");
			return res;
		}

		String[] ids = id.split(",");

		Set<String> idList = new HashSet<>();
		Wrapper<SystemMenu> wrapper = null;
		for (String idStr : ids) {
			wrapper = new EntityWrapper<>();
			wrapper.eq("pid", idStr);
			if (systemMenuService.selectOne(wrapper) != null) {
				res.put("statusCode", 300);
				res.put("message", "请先删除菜单的子级菜单");
				return res;
			}

			idList.add(idStr);
		}

		if (!systemMenuService.deleteBatchIds(idList)) {
			res.put("statusCode", 300);
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "操作成功");
		return res;
	}

	// 根菜单选择
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/menu/rootSelect")
	public List<Map<String, Object>> menuRootSelect(HttpServletRequest request, HttpServletResponse response) {

		String appId = request.getParameter("appId");

		Wrapper<SystemMenu> wrapper = new EntityWrapper<>();
		if (StringUtils.isNoneBlank(appId)) {
			wrapper.eq("app_id", appId);
		}
		wrapper.eq("pid", "0");
		wrapper.orderBy("sort_no", true);
		List<SystemMenu> systemMenus = systemMenuService.selectList(wrapper);

		List<Map<String, Object>> menuList = new ArrayList<>();

		Map<String, Object> item = null;
		if (systemMenus != null && !systemMenus.isEmpty()) {
			for (SystemMenu systemMenu : systemMenus) {
				item = new HashMap<>();
				item.put("id", systemMenu.getId());
				SystemApp systemApp = baseDataCacheUtil.getSystemAppById(systemMenu.getAppId());
				item.put("text", systemApp.getName() + " - " + systemMenu.getText());
				item.put("state", "closed");
				item.put("checked", false);
				menuList.add(item);
			}
		}

		return menuList;
	}

	// 根菜单
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/menu/list")
	public List<Map<String, Object>> menuList(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("id");
		if (StringUtils.isBlank(id)) {
			return new ArrayList<>();
		}

		Wrapper<SystemMenu> wrapper = new EntityWrapper<>();
		List<SystemMenu> systemMenus = null;

		boolean isParent = false;

		SystemApp app = systemAppService.selectById(id);
		if (app != null) {
			wrapper.eq("app_id", id);
			wrapper.eq("pid", "0");
			wrapper.orderBy("sort_no", true);
			systemMenus = systemMenuService.selectList(wrapper);
			isParent = true;
		} else {
			wrapper.eq("pid", id);
			wrapper.orderBy("sort_no", true);
			systemMenus = systemMenuService.selectList(wrapper);
		}

		if (systemMenus == null || systemMenus.isEmpty()) {
			return new ArrayList<>();
		}

		List<Map<String, Object>> menuList = new ArrayList<>();
		Map<String, Object> item = null;
		for (SystemMenu systemMenu : systemMenus) {
			item = new HashMap<>();
			item.put("id", systemMenu.getId());
			item.put("pid", systemMenu.getPid());
			item.put("text", systemMenu.getText());
			item.put("icon", systemMenu.getIcon());
			item.put("url", systemMenu.getUrl());
			item.put("sortNo", systemMenu.getSortNo());
			item.put("state", isParent ? "closed" : "open");
			item.put("checked", false);
			menuList.add(item);
		}

		return menuList;
	}

	/***
	 * 系统权限字配置
	 * 
	 * @param request
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value = "/authword")
	public ModelAndView authword(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("system/authword");
		return mav;
	}

	// 权限字列表
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/authword/list")
	public Map<String, Object> authwordList(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();

		String id = request.getParameter("id");
		if (StringUtils.isBlank(id)) {
			res.put("rows", new ArrayList<>());
			res.put("total", 0);
			return res;
		}

		Wrapper<SystemAuthword> wrapper = new EntityWrapper<>();
		wrapper.eq("menu_id", id);

		String pageStr = request.getParameter("page");
		if (!NumberUtils.isDigits(pageStr)) {
			pageStr = "1";
		}
		String rowsStr = request.getParameter("rows");
		if (!NumberUtils.isDigits(rowsStr)) {
			rowsStr = "20";
		}
		String sort = request.getParameter("sort");
		String order = request.getParameter("order");

		if (StringUtils.isNotBlank(sort) && StringUtils.isNotBlank(order)) {
			wrapper.orderBy(sort, "asc".equals(order));
		}

		PageHelper.startPage(new Integer(pageStr), new Integer(rowsStr));
		List<SystemAuthword> systemAuthwords = systemAuthwordService.selectList(wrapper);
		PageInfo<SystemAuthword> pageInfo = new PageInfo<SystemAuthword>(systemAuthwords);

		List<Map<String, Object>> menuList = new ArrayList<>();
		if (systemAuthwords != null && !systemAuthwords.isEmpty()) {
			Map<String, Object> item = null;
			for (SystemAuthword authword : systemAuthwords) {
				item = new HashMap<>();
				item.put("id", authword.getId());
				item.put("name", authword.getName());
				item.put("code", authword.getCode());
				item.put("desc", authword.getDesc());
				menuList.add(item);
			}
		}

		res.put("rows", menuList);

		res.put("currentPage", pageInfo.getPageNum());
		res.put("firstPage", pageInfo.isIsFirstPage());
		res.put("lastPage", pageInfo.isIsLastPage());
		res.put("numPerPage", pageInfo.getPrePage());
		res.put("totalPage", pageInfo.getPages());
		res.put("total", pageInfo.getTotal());

		return res;
	}

	/***
	 * 系统权限字表单
	 * 
	 * @param request
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value = "/authword/form")
	public ModelAndView authwordForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("system/authword/form");
		return mav;
	}

	/***
	 * 系统权限字详情
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/authword/detail")
	public SystemAuthword authwordDetail(HttpServletRequest request) {
		SystemAuthword authword = null;

		String id = request.getParameter("id");

		authword = systemAuthwordService.selectById(id);
		if (authword == null) {
			authword = new SystemAuthword();
		}
		return authword;
	}

	/***
	 * 保存系统权限字
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/authword/save")
	public Map<String, Object> authwordSave(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		SystemAuthword authword = new SystemAuthword();
		authword.setId(IdUtil.id());
		authword.setMenuId(request.getParameter("menuId"));
		authword.setName(request.getParameter("name"));
		authword.setCode(request.getParameter("code"));
		authword.setDesc(request.getParameter("desc"));

		if (!systemAuthwordService.insert(authword)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "保存成功");
		return res;
	}

	/***
	 * 更新系统权限字
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/authword/update")
	public Map<String, Object> authwordUpdate(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			res.put("message", "无效的参数");
			return res;
		}

		SystemAuthword authword = systemAuthwordService.selectById(id);
		if (authword == null) {
			res.put("message", "无效的参数");
			return res;
		}

		authword.setMenuId(request.getParameter("menuId"));
		authword.setName(request.getParameter("name"));
		authword.setCode(request.getParameter("code"));
		authword.setDesc(request.getParameter("desc"));

		if (!systemAuthwordService.updateById(authword)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

	/***
	 * 删除系统权限字
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/authword/delete")
	public Map<String, Object> authwordDelete(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			res.put("statusCode", 300);
			res.put("message", "无效的参数");
			return res;
		}

		String[] ids = id.split(",");

		Set<String> idList = new HashSet<>();
		for (String idStr : ids) {
			idList.add(idStr);
		}

		if (!systemAuthwordService.deleteBatchIds(idList)) {
			res.put("statusCode", 300);
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "操作成功");
		return res;
	}

}
