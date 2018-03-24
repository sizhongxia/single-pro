package com.single.pro.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.single.pro.entity.MpBanner;
import com.single.pro.service.MpBannerService;
import com.single.pro.util.IdUtil;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-23
 */
@Controller
@RequestMapping("/mp/banner")
public class MpBannerController extends BaseController {

	@Autowired
	MpBannerService mpBannerService;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("mp/banner/index");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/list" }, method = { RequestMethod.POST })
	public Map<String, Object> list(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();

		Wrapper<MpBanner> wrapper = new EntityWrapper<>();

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
		} else {
			wrapper.orderBy("sort_weight", false);
		}

		PageHelper.startPage(new Integer(pageStr), new Integer(rowsStr));
		List<MpBanner> mpBanners = mpBannerService.selectList(wrapper);
		PageInfo<MpBanner> pageInfo = new PageInfo<MpBanner>(mpBanners);

		List<Map<String, Object>> rows = new ArrayList<>();
		if (mpBanners != null && !mpBanners.isEmpty()) {
			Map<String, Object> item = null;
			for (MpBanner mpBanner : mpBanners) {
				item = new HashMap<>();
				item.put("id", mpBanner.getId());
				item.put("name", mpBanner.getName());
				item.put("pic_url", mpBanner.getPicUrl());
				item.put("status", mpBanner.getStatus());
				item.put("sort_weight", mpBanner.getSortWeight());
				item.put("create_time", mpBanner.getCreateTime());
				item.put("update_time", mpBanner.getUpdateTime());
				rows.add(item);
			}
		}

		res.put("rows", rows);

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
		ModelAndView mav = new ModelAndView("mp/banner/form");
		return mav;
	}

	/***
	 * Banner详情
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/detail")
	public MpBanner detail(HttpServletRequest request) {
		MpBanner mpBanner = null;
		String id = request.getParameter("id");
		mpBanner = mpBannerService.selectById(id);
		if (mpBanner == null) {
			mpBanner = new MpBanner();
		}
		return mpBanner;
	}

	/***
	 * 保存Banner
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

		MpBanner mpBanner = new MpBanner();
		mpBanner.setId(IdUtil.id());
		mpBanner.setName(request.getParameter("name"));
		mpBanner.setPicUrl(request.getParameter("picUrl"));

		String sortWeight = request.getParameter("sortWeight");
		if (NumberUtils.isDigits(sortWeight)) {
			mpBanner.setSortWeight(new Integer(sortWeight));
		} else {
			mpBanner.setSortWeight(10);
		}

		mpBanner.setStatus(request.getParameter("status"));
		Date now = new Date();
		mpBanner.setCreateTime(now);
		mpBanner.setUpdateTime(now);

		if (!mpBannerService.insert(mpBanner)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "保存成功");
		return res;
	}

	/***
	 * 更新Banner
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

		MpBanner mpBanner = mpBannerService.selectById(id);
		if (mpBanner == null) {
			res.put("message", "无效的参数");
			return res;
		}

		mpBanner.setName(request.getParameter("name"));
		mpBanner.setPicUrl(request.getParameter("picUrl"));

		String sortWeight = request.getParameter("sortWeight");
		if (NumberUtils.isDigits(sortWeight)) {
			mpBanner.setSortWeight(new Integer(sortWeight));
		} else {
			mpBanner.setSortWeight(10);
		}

		mpBanner.setStatus(request.getParameter("status"));
		Date now = new Date();
		mpBanner.setUpdateTime(now);

		if (!mpBannerService.updateById(mpBanner)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

}
