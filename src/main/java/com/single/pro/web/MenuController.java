package com.single.pro.web;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.single.pro.entity.Menu;
import com.single.pro.service.MenuService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-02-28
 */
@Controller
@RequestMapping("/menu")
public class MenuController extends BaseController {

	@Autowired
	private MenuService menuService;

	@ResponseBody
	@RequestMapping(value = "/list")
	public Map<String, Object> login(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();

		String appId = request.getParameter("appId");
		String menuId = request.getParameter("menuId");

		if (StringUtils.isNotBlank(appId)) {
			Wrapper<Menu> wrapper = new EntityWrapper<>();
			wrapper.eq("app_id", appId);
			wrapper.isNull("parent_id");
			wrapper.eq("status", "Y");
			wrapper.orderBy("sort_number", true);
			List<Menu> roots = menuService.selectList(wrapper);
			if (roots == null || roots.isEmpty()) {
				res.put("statusCode", -1);
				res.put("errMsg", "无数据");
				return res;
			}
			List<Map<String, Object>> rootList = new ArrayList<>();
			Map<String, Object> item = null;
			for (Menu menu : roots) {
				item = new HashMap<>();
				item.put("id", menu.getId());
				item.put("pid", 0);
				item.put("text", menu.getTitle());
				item.put("state", "closed");
				item.put("iconCls", "fa fa-heartbeat");
				item.put("url", "");
				rootList.add(item);
			}
			res.put("statusCode", 200);
			res.put("data", rootList);
			return res;
		} else if (StringUtils.isNotBlank(menuId)) {
			Wrapper<Menu> wrapper = new EntityWrapper<>();
			wrapper.eq("parent_id", menuId);
			wrapper.eq("status", "Y");
			wrapper.orderBy("sort_number", true);
			List<Menu> childs = menuService.selectList(wrapper);
			if (childs == null || childs.isEmpty()) {
				res.put("statusCode", -1);
				res.put("errMsg", "无数据");
				return res;
			}
			List<Map<String, Object>> childList = new ArrayList<>();
			Map<String, Object> item = null;
			for (Menu menu : childs) {
				item = new HashMap<>();
				item.put("id", menu.getId());
				item.put("pid", menu.getParentId());
				item.put("text", menu.getTitle());
				item.put("state", "open");
				item.put("iconCls", "");
				item.put("url", menu.getUrl());
				childList.add(item);
			}
			res.put("statusCode", 200);
			res.put("data", childList);
			return res;
		}

		return res;
	}
}
