package com.single.pro.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
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
import com.single.pro.entity.DictionaryItem;
import com.single.pro.entity.DictionaryType;
import com.single.pro.service.DictionaryItemService;
import com.single.pro.service.DictionaryTypeService;
import com.single.pro.util.IdUtil;
import com.xiaoleilu.hutool.util.NumberUtil;

@Controller
@RequestMapping("dictionary")
public class DictionaryController extends BaseController {

	@Autowired
	DictionaryTypeService dictionaryTypeService;
	@Autowired
	DictionaryItemService dictionaryItemService;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("dictionary/index");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/list" }, method = { RequestMethod.POST })
	public Map<String, Object> list(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();

		Wrapper<DictionaryType> wrapper = new EntityWrapper<>();

		String pageStr = request.getParameter("page");
		if (!NumberUtil.isNumber(pageStr)) {
			pageStr = "1";
		}
		String rowsStr = request.getParameter("rows");
		if (!NumberUtil.isNumber(rowsStr)) {
			rowsStr = "20";
		}
		String sort = request.getParameter("sort");
		String order = request.getParameter("order");

		if (StringUtils.isNotBlank(sort) && StringUtils.isNotBlank(order)) {
			wrapper.orderBy(sort, "asc".equals(order));
		} else {
			wrapper.orderBy("status", false);
		}

		PageHelper.startPage(new Integer(pageStr), new Integer(rowsStr));
		List<DictionaryType> dictionaryTypes = dictionaryTypeService.selectList(wrapper);
		PageInfo<DictionaryType> pageInfo = new PageInfo<DictionaryType>(dictionaryTypes);

		List<Map<String, Object>> dictionaryTypeList = new ArrayList<>();
		if (dictionaryTypes != null && !dictionaryTypes.isEmpty()) {
			Map<String, Object> item = null;
			for (DictionaryType dictionaryType : dictionaryTypes) {
				item = new HashMap<>();
				item.put("id", dictionaryType.getId());
				item.put("name", dictionaryType.getName());
				item.put("code", dictionaryType.getCode());
				item.put("status", dictionaryType.getStatus().equals("Y") ? "正常" : "禁用");
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				item.put("create_time", dateFormat.format(dictionaryType.getCreateTime()));
				item.put("update_time", dateFormat.format(dictionaryType.getUpdateTime()));
				dictionaryTypeList.add(item);
			}
		}

		res.put("rows", dictionaryTypeList);

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
		ModelAndView mav = new ModelAndView("dictionary/form");
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/itemForm" }, method = { RequestMethod.GET })
	public ModelAndView itemForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("dictionary/itemForm");
		String typeId = request.getParameter("typeId");
		mav.addObject("typeId", typeId);
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/items" }, method = { RequestMethod.GET })
	public ModelAndView items(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("dictionary/items");
		mav.addObject("typeId", request.getParameter("id"));
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/itemList" }, method = { RequestMethod.POST })
	public Map<String, Object> itemList(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		List<Map<String, Object>> dictionaryItemList = new ArrayList<>();

		Wrapper<DictionaryItem> wrapper = new EntityWrapper<>();

		String typeId = request.getParameter("typeId");
		if (StringUtils.isBlank(typeId)) {
			res.put("rows", dictionaryItemList);
			return res;
		}
		wrapper.eq("type_id", typeId);

		String pageStr = request.getParameter("page");
		if (!NumberUtil.isNumber(pageStr)) {
			pageStr = "1";
		}
		String rowsStr = request.getParameter("rows");
		if (!NumberUtil.isNumber(rowsStr)) {
			rowsStr = "20";
		}
		String sort = request.getParameter("sort");
		String order = request.getParameter("order");

		if (StringUtils.isNotBlank(sort) && StringUtils.isNotBlank(order)) {
			wrapper.orderBy(sort, "asc".equals(order));
		} else {
			wrapper.orderBy("status", false);
		}

		PageHelper.startPage(new Integer(pageStr), new Integer(rowsStr));
		List<DictionaryItem> dictionaryItems = dictionaryItemService.selectList(wrapper);
		PageInfo<DictionaryItem> pageInfo = new PageInfo<DictionaryItem>(dictionaryItems);

		if (dictionaryItems != null && !dictionaryItems.isEmpty()) {
			Map<String, Object> item = null;
			for (DictionaryItem dictionaryItem : dictionaryItems) {
				item = new HashMap<>();
				item.put("id", dictionaryItem.getId());
				item.put("name", dictionaryItem.getName());
				item.put("code", dictionaryItem.getCode());
				item.put("status", dictionaryItem.getStatus().equals("Y") ? "正常" : "禁用");
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				item.put("create_time", dateFormat.format(dictionaryItem.getCreateTime()));
				item.put("update_time", dateFormat.format(dictionaryItem.getUpdateTime()));
				dictionaryItemList.add(item);
			}
		}

		res.put("rows", dictionaryItemList);

		res.put("currentPage", pageInfo.getPageNum());
		res.put("firstPage", pageInfo.isIsFirstPage());
		res.put("lastPage", pageInfo.isIsLastPage());
		res.put("numPerPage", pageInfo.getPrePage());
		res.put("totalPage", pageInfo.getPages());
		res.put("total", pageInfo.getTotal());

		return res;
	}

	/***
	 * 字典详情
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/detail")
	public DictionaryType detail(HttpServletRequest request) {
		DictionaryType dictionaryType = null;

		String id = request.getParameter("id");

		dictionaryType = dictionaryTypeService.selectById(id);
		if (dictionaryType == null) {
			dictionaryType = new DictionaryType();
		}

		return dictionaryType;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/itemDetail")
	public DictionaryItem itemDetail(HttpServletRequest request) {
		DictionaryItem dictionaryItem = null;

		String id = request.getParameter("id");

		dictionaryItem = dictionaryItemService.selectById(id);
		if (dictionaryItem == null) {
			dictionaryItem = new DictionaryItem();
		}

		return dictionaryItem;
	}

	/***
	 * 保存字典
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

		String code = request.getParameter("code");

		Wrapper<DictionaryType> wrapper = new EntityWrapper<>();
		wrapper.eq("code", code);
		DictionaryType dictionaryType = dictionaryTypeService.selectOne(wrapper);
		if (dictionaryType != null) {
			res.put("message", "字典类型编码已存在");
			return res;
		}

		dictionaryType = new DictionaryType();
		dictionaryType.setId(IdUtil.id());
		dictionaryType.setName(request.getParameter("name"));
		dictionaryType.setCode(code);
		dictionaryType.setStatus(request.getParameter("status"));
		dictionaryType.setCreateTime(new Date());
		dictionaryType.setUpdateTime(new Date());

		if (!dictionaryTypeService.insert(dictionaryType)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "保存成功");
		return res;
	}

	/***
	 * 更新字典
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

		DictionaryType dictionaryType = dictionaryTypeService.selectById(id);
		if (dictionaryType == null) {
			res.put("message", "无效的参数");
			return res;
		}

		String code = request.getParameter("code");

		Wrapper<DictionaryType> wrapper = new EntityWrapper<>();
		wrapper.eq("code", code);
		DictionaryType _dictionaryType = dictionaryTypeService.selectOne(wrapper);
		if (_dictionaryType != null && !_dictionaryType.getId().equals(id)) {
			res.put("message", "字典类型编码已存在");
			return res;
		}

		dictionaryType.setName(request.getParameter("name"));
		dictionaryType.setCode(code);
		dictionaryType.setStatus(request.getParameter("status"));
		dictionaryType.setUpdateTime(new Date());

		if (!dictionaryTypeService.updateById(dictionaryType)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

	/***
	 * 保存字典项
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/saveItem")
	public Map<String, Object> saveItem(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String code = request.getParameter("code");

		Wrapper<DictionaryItem> wrapper = new EntityWrapper<>();
		wrapper.eq("code", code);
		DictionaryItem dictionaryItem = dictionaryItemService.selectOne(wrapper);
		if (dictionaryItem != null) {
			res.put("message", "字典编码已存在");
			return res;
		}

		dictionaryItem = new DictionaryItem();
		dictionaryItem.setId(IdUtil.id());
		dictionaryItem.setTypeId(request.getParameter("typeId"));
		dictionaryItem.setName(request.getParameter("name"));
		dictionaryItem.setCode(code);
		dictionaryItem.setStatus(request.getParameter("status"));
		dictionaryItem.setCreateTime(new Date());
		dictionaryItem.setUpdateTime(new Date());

		if (!dictionaryItemService.insert(dictionaryItem)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "保存成功");
		return res;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/updateItem")
	public Map<String, Object> updateItem(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			res.put("message", "无效的参数");
			return res;
		}

		DictionaryItem dictionaryItem = dictionaryItemService.selectById(id);
		if (dictionaryItem == null) {
			res.put("message", "无效的参数");
			return res;
		}

		String code = request.getParameter("code");

		Wrapper<DictionaryItem> wrapper = new EntityWrapper<>();
		wrapper.eq("code", code);
		DictionaryItem _dictionaryItem = dictionaryItemService.selectOne(wrapper);
		if (_dictionaryItem != null && !_dictionaryItem.getId().equals(id)) {
			res.put("message", "字典项编码已存在");
			return res;
		}

		dictionaryItem.setName(request.getParameter("name"));
		dictionaryItem.setCode(code);
		dictionaryItem.setStatus(request.getParameter("status"));
		dictionaryItem.setUpdateTime(new Date());

		if (!dictionaryItemService.updateById(dictionaryItem)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

}
