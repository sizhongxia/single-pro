package com.single.pro.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.single.pro.entity.Role;
import com.single.pro.entity.RoleApp;
import com.single.pro.entity.RoleAuthword;
import com.single.pro.entity.RoleMenu;
import com.single.pro.entity.SystemApp;
import com.single.pro.entity.SystemAuthword;
import com.single.pro.entity.SystemMenu;
import com.single.pro.service.RoleAppService;
import com.single.pro.service.RoleAuthwordService;
import com.single.pro.service.RoleMenuService;
import com.single.pro.service.RoleService;
import com.single.pro.service.SystemAppService;
import com.single.pro.service.SystemAuthwordService;
import com.single.pro.service.SystemMenuService;
import com.single.pro.util.IdUtil;

@Controller
@RequestMapping("role")
public class RoleController extends BaseController {

	@Autowired
	RoleService roleService;
	@Autowired
	SystemAppService systemAppService;
	@Autowired
	RoleAppService roleAppService;
	@Autowired
	SystemMenuService systemMenuService;
	@Autowired
	RoleMenuService roleMenuService;
	@Autowired
	RoleAuthwordService roleAuthwordService;
	@Autowired
	SystemAuthwordService systemAuthwordService;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("role/index");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/list" }, method = { RequestMethod.POST })
	public Map<String, Object> list(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();

		Wrapper<Role> wrapper = new EntityWrapper<>();
		// wrapper.eq("status", "Y");

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
		List<Role> roles = roleService.selectList(wrapper);
		PageInfo<Role> pageInfo = new PageInfo<Role>(roles);

		List<Map<String, Object>> systemRoleList = new ArrayList<>();
		if (roles != null && !roles.isEmpty()) {
			Map<String, Object> item = null;
			for (Role role : roles) {
				item = new HashMap<>();
				item.put("id", role.getId());
				item.put("name", role.getName());
				item.put("code", role.getCode());
				item.put("is_system", "Y".equals(role.getIsSystem()));
				item.put("status", "Y".equals(role.getStatus()));
				item.put("create_time", role.getCreateTime());
				item.put("update_time", role.getUpdateTime());
				systemRoleList.add(item);
			}
		}

		res.put("rows", systemRoleList);

		res.put("currentPage", pageInfo.getPageNum());
		res.put("firstPage", pageInfo.isIsFirstPage());
		res.put("lastPage", pageInfo.isIsLastPage());
		res.put("numPerPage", pageInfo.getPrePage());
		res.put("totalPage", pageInfo.getPages());
		res.put("total", pageInfo.getTotal());

		return res;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/form" }, method = { RequestMethod.GET })
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("role/form");
		return mav;
	}

	/***
	 * 角色详情
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/detail")
	public Role detail(HttpServletRequest request) {
		Role role = null;

		String id = request.getParameter("id");

		role = roleService.selectById(id);
		if (role == null) {
			role = new Role();
		}
		return role;
	}

	/***
	 * 保存角色
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/save")
	public Map<String, Object> save(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		Role role = new Role();
		role.setId(IdUtil.id());
		role.setName(request.getParameter("name"));
		role.setCode(request.getParameter("code"));
		role.setIsSystem("N");
		role.setStatus(request.getParameter("status"));
		Date now = new Date();
		role.setCreateTime(now);
		role.setUpdateTime(now);

		if (!roleService.insert(role)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "保存成功");
		return res;
	}

	/***
	 * 更新角色
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/update")
	public Map<String, Object> update(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			res.put("message", "无效的参数");
			return res;
		}

		Role role = roleService.selectById(id);
		if (role == null) {
			res.put("message", "无效的参数");
			return res;
		}

		if ("Y".equals(role.getIsSystem())) {
			res.put("message", "系统角色不允许修改");
			return res;
		}

		role.setName(request.getParameter("name"));
		role.setCode(request.getParameter("code"));
		role.setStatus(request.getParameter("status"));
		Date now = new Date();
		role.setUpdateTime(now);

		if (!roleService.updateById(role)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/auth" }, method = { RequestMethod.GET })
	public ModelAndView auth(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("role/auth");
		return mav;
	}

	// 所有角色
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/allSelect")
	public List<Map<String, Object>> allSelect(HttpServletRequest request, HttpServletResponse response) {
		Wrapper<Role> wrapper = new EntityWrapper<>();
		wrapper.eq("status", "Y");
		List<Role> roles = roleService.selectList(wrapper);
		if (roles == null || roles.isEmpty()) {
			return new ArrayList<>();
		}
		List<Map<String, Object>> appList = new ArrayList<>();
		Map<String, Object> item = null;

		for (Role role : roles) {
			item = new HashMap<>();
			item.put("id", role.getId());
			item.put("name", role.getName());
			item.put("code", role.getCode());
			appList.add(item);
		}

		return appList;
	}

	// 所有应用选择
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/authAuths")
	public List<Map<String, Object>> authApps(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("role_id");
		if (StringUtils.isBlank(id)) {
			return new ArrayList<>();
		}
		Role role = roleService.selectById(id);
		if (role == null) {
			return new ArrayList<>();
		}

		List<Map<String, Object>> appList = new ArrayList<>();
		Map<String, Object> item = new HashMap<>();
		item.put("id", "");
		item.put("role_id", id);
		item.put("type", 0);
		item.put("name", role.getName() + " 授权信息");
		item.put("auth", false);
		item.put("state", "closed");
		appList.add(item);

		return appList;
	}

	// 角色授权菜单
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/authChilds")
	public List<Map<String, Object>> authChilds(HttpServletRequest request, HttpServletResponse response) {

		String roleId = request.getParameter("role_id");
		if (StringUtils.isBlank(roleId)) {
			return new ArrayList<>();
		}
		Role role = roleService.selectById(roleId);
		if (role == null) {
			return new ArrayList<>();
		}

		String pid = request.getParameter("id");

		if (StringUtils.isBlank(pid)) {
			Wrapper<SystemApp> wrapper = new EntityWrapper<>();
			wrapper.orderBy("sort_no", true);
			List<SystemApp> systemApps = systemAppService.selectList(wrapper);
			if (systemApps == null || systemApps.isEmpty()) {
				return new ArrayList<>();
			}

			List<Map<String, Object>> appList = new ArrayList<>();
			Map<String, Object> item = null;

			Wrapper<RoleApp> roleAppWrapper = new EntityWrapper<>();
			roleAppWrapper.eq("role_id", roleId);
			List<RoleApp> roleAuthApps = roleAppService.selectList(roleAppWrapper);

			for (SystemApp systemApp : systemApps) {
				item = new HashMap<>();
				item.put("id", systemApp.getId());
				item.put("role_id", roleId);
				item.put("type", 1);
				item.put("name", systemApp.getName());
				item.put("auth", hadAuthApp(systemApp.getId(), roleAuthApps));
				item.put("state", "closed");
				appList.add(item);
			}

			return appList;
		}

		Wrapper<SystemMenu> wrapper = new EntityWrapper<>();
		List<SystemMenu> systemMenus = null;
		List<SystemAuthword> systemAuthwords = null;

		List<Map<String, Object>> childList = new ArrayList<>();

		SystemApp app = systemAppService.selectById(pid);
		if (app != null) {
			wrapper.eq("app_id", pid);
			wrapper.eq("pid", "0");
			wrapper.orderBy("sort_no", true);
			systemMenus = systemMenuService.selectList(wrapper);
		} else {

			SystemMenu menu = systemMenuService.selectById(pid);

			if (menu == null) {
				return new ArrayList<>();
			}

			if ("0".equals(menu.getPid())) {
				wrapper.eq("pid", pid);
				wrapper.orderBy("sort_no", true);
				systemMenus = systemMenuService.selectList(wrapper);

				if (systemMenus == null || systemMenus.isEmpty()) {
					return new ArrayList<>();
				}

			}

			Wrapper<SystemAuthword> authwordWrapper = new EntityWrapper<>();
			authwordWrapper.eq("menu_id", pid);
			systemAuthwords = systemAuthwordService.selectList(authwordWrapper);

		}

		Map<String, Object> item = null;

		if (systemMenus != null) {
			Wrapper<RoleMenu> roleMenuWrapper = new EntityWrapper<>();
			roleMenuWrapper.eq("role_id", roleId);
			List<RoleMenu> roleAuthMenus = roleMenuService.selectList(roleMenuWrapper);
			for (SystemMenu systemMenu : systemMenus) {
				item = new HashMap<>();
				item.put("id", systemMenu.getId());
				item.put("pid", systemMenu.getPid());
				item.put("role_id", roleId);
				item.put("type", 2);
				item.put("name", systemMenu.getText());
				item.put("auth", hadAuthMenu(systemMenu.getId(), roleAuthMenus));
				item.put("state", "closed");
				childList.add(item);
			}
		}

		if (systemAuthwords != null && !systemAuthwords.isEmpty()) {
			Wrapper<RoleAuthword> roleAuthwordWrapper = new EntityWrapper<>();
			roleAuthwordWrapper.eq("role_id", roleId);
			List<RoleAuthword> roleAuthAuthwords = roleAuthwordService.selectList(roleAuthwordWrapper);
			for (SystemAuthword systemAuthword : systemAuthwords) {
				item = new HashMap<>();
				item.put("id", systemAuthword.getId());
				item.put("pid", "");
				item.put("role_id", roleId);
				item.put("type", 3);
				item.put("name", systemAuthword.getName());
				item.put("auth", hadAuthAuthword(systemAuthword.getCode(), roleAuthAuthwords));
				item.put("state", "open");
				childList.add(item);
			}
		}

		return childList;
	}

	/***
	 * 角色授权/取消授权
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/toAuth")
	public Map<String, Object> toAuth(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String roleId = request.getParameter("role_id");
		String roles[] = roleId.split("[,]");

		Role role = roleService.selectById(roles[0]);
		if (role == null || !"Y".equals(role.getStatus())) {
			res.put("message", "无效的授权角色，或者角色已禁用");
			return res;
		}
		String auths = request.getParameter("auth");
		String types = request.getParameter("type");
		String objIds = request.getParameter("id");

		String authArr[] = auths.split("[,]");
		String typeArr[] = types.split("[,]");
		String objIdArr[] = objIds.split("[,]");

		int size = authArr.length;
		for (int i = 0; i < size; i++) {
			if (!"0".equals(typeArr[i])) {
				toAuth(role.getId(), objIdArr[i], typeArr[i], authArr[i]);
			}
		}
		res.put("statusCode", 200);
		res.put("message", "操作成功");
		return res;
	}

	private boolean toAuth(String roleId, String objId, String type, String auth) {
		Boolean authBool = new Boolean(auth);
		if ("1".equals(type)) {
			SystemApp systemApp = systemAppService.selectById(objId);
			if (systemApp == null) {
				return false;
			}
			if (authBool.booleanValue()) {
				Wrapper<RoleApp> wp = new EntityWrapper<>();
				wp.eq("role_id", roleId);
				wp.eq("app_id", objId);
				if (roleAppService.delete(wp)) {
					return true;
				}
			} else {
				RoleApp entity = new RoleApp();
				entity.setRoleId(roleId);
				entity.setAppId(objId);
				entity.setCreateTime(new Date());
				if (roleAppService.insert(entity)) {
					return true;
				}
			}
		} else if ("2".equals(type)) {
			SystemMenu systemMenu = systemMenuService.selectById(objId);
			if (systemMenu == null) {
				return false;
			}
			if (authBool.booleanValue()) {
				Wrapper<RoleMenu> wp = new EntityWrapper<>();
				wp.eq("role_id", roleId);
				wp.eq("menu_id", objId);
				if (roleMenuService.delete(wp)) {
					return true;
				}
			} else {
				RoleMenu entity = new RoleMenu();
				entity.setRoleId(roleId);
				entity.setMenuId(objId);
				entity.setCreateTime(new Date());
				if (roleMenuService.insert(entity)) {
					return true;
				}
			}
		} else if ("3".equals(type)) {
			SystemAuthword systemAuthword = systemAuthwordService.selectById(objId);
			if (systemAuthword == null) {
				return false;
			}
			if (authBool.booleanValue()) {
				Wrapper<RoleAuthword> wp = new EntityWrapper<>();
				wp.eq("role_id", roleId);
				wp.eq("authword", systemAuthword.getCode());
				if (roleAuthwordService.delete(wp)) {
					return true;
				}
			} else {
				RoleAuthword entity = new RoleAuthword();
				entity.setRoleId(roleId);
				entity.setAuthword(systemAuthword.getCode());
				entity.setCreateTime(new Date());
				if (roleAuthwordService.insert(entity)) {
					return true;
				}
			}
		}
		return false;
	}

	private boolean hadAuthApp(String appId, List<RoleApp> roleAuthApps) {
		if (roleAuthApps == null || roleAuthApps.isEmpty()) {
			return false;
		}
		for (RoleApp app : roleAuthApps) {
			if (app.getAppId().equals(appId)) {
				return true;
			}
		}
		return false;
	}

	private boolean hadAuthMenu(String menuId, List<RoleMenu> roleAppMenus) {
		if (roleAppMenus == null || roleAppMenus.isEmpty()) {
			return false;
		}
		for (RoleMenu menu : roleAppMenus) {
			if (menu.getMenuId().equals(menuId)) {
				return true;
			}
		}
		return false;
	}

	private boolean hadAuthAuthword(String code, List<RoleAuthword> roleAuthAuthwords) {
		if (roleAuthAuthwords == null || roleAuthAuthwords.isEmpty()) {
			return false;
		}
		for (RoleAuthword roleAuthword : roleAuthAuthwords) {
			if (roleAuthword.getAuthword().equals(code)) {
				return true;
			}
		}
		return false;
	}
}
