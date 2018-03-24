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
import com.single.pro.entity.MpChannel;
import com.single.pro.service.MpChannelService;
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
@RequestMapping("/mp/channel")
public class MpChannelController extends BaseController {

	@Autowired
	MpChannelService mpChannelService;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("mp/channel/index");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/list" }, method = { RequestMethod.POST })
	public Map<String, Object> list(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();

		Wrapper<MpChannel> wrapper = new EntityWrapper<>();

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
		List<MpChannel> mpChannels = mpChannelService.selectList(wrapper);
		PageInfo<MpChannel> pageInfo = new PageInfo<MpChannel>(mpChannels);

		List<Map<String, Object>> rows = new ArrayList<>();
		if (mpChannels != null && !mpChannels.isEmpty()) {
			Map<String, Object> item = null;
			for (MpChannel mpChannel : mpChannels) {
				item = new HashMap<>();
				item.put("id", mpChannel.getId());
				item.put("name", mpChannel.getName());
				item.put("icon_url", mpChannel.getIconUrl());
				item.put("status", mpChannel.getStatus());
				item.put("sort_weight", mpChannel.getSortWeight());
				item.put("create_time", mpChannel.getCreateTime());
				item.put("update_time", mpChannel.getUpdateTime());
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
		ModelAndView mav = new ModelAndView("mp/channel/form");
		return mav;
	}

	/***
	 * Channel详情
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/detail")
	public MpChannel detail(HttpServletRequest request) {
		MpChannel mpChannel = null;
		String id = request.getParameter("id");
		mpChannel = mpChannelService.selectById(id);
		if (mpChannel == null) {
			mpChannel = new MpChannel();
		}
		return mpChannel;
	}

	/***
	 * 保存Channel
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

		MpChannel mpChannel = new MpChannel();
		mpChannel.setId(IdUtil.id());
		mpChannel.setName(request.getParameter("name"));
		mpChannel.setIconUrl(request.getParameter("iconUrl"));

		String sortWeight = request.getParameter("sortWeight");
		if (NumberUtils.isDigits(sortWeight)) {
			mpChannel.setSortWeight(new Integer(sortWeight));
		} else {
			mpChannel.setSortWeight(10);
		}

		mpChannel.setStatus(request.getParameter("status"));
		Date now = new Date();
		mpChannel.setCreateTime(now);
		mpChannel.setUpdateTime(now);

		if (!mpChannelService.insert(mpChannel)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "保存成功");
		return res;
	}

	/***
	 * 更新Channel
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

		MpChannel mpChannel = mpChannelService.selectById(id);
		if (mpChannel == null) {
			res.put("message", "无效的参数");
			return res;
		}

		mpChannel.setName(request.getParameter("name"));
		mpChannel.setIconUrl(request.getParameter("iconUrl"));

		String sortWeight = request.getParameter("sortWeight");
		if (NumberUtils.isDigits(sortWeight)) {
			mpChannel.setSortWeight(new Integer(sortWeight));
		} else {
			mpChannel.setSortWeight(10);
		}

		mpChannel.setStatus(request.getParameter("status"));
		Date now = new Date();
		mpChannel.setUpdateTime(now);

		if (!mpChannelService.updateById(mpChannel)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

}
