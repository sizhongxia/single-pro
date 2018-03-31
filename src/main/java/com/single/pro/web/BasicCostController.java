package com.single.pro.web;

import java.math.BigDecimal;
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
import com.single.pro.entity.BasicCity;
import com.single.pro.entity.BasicCost;
import com.single.pro.service.BasicCityService;
import com.single.pro.service.BasicCostService;
import com.single.pro.util.IdUtil;
import com.xiaoleilu.hutool.util.NumberUtil;

@Controller
@RequestMapping("basic/cost")
public class BasicCostController extends BaseController {

	@Autowired
	BasicCostService basicCostService;
	@Autowired
	BasicCityService basicCityService;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("basic/cost/index");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/list" }, method = { RequestMethod.POST })
	public Map<String, Object> list(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();

		Wrapper<BasicCost> wrapper = new EntityWrapper<>();

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
			wrapper.orderBy("city_code", true);
		}

		PageHelper.startPage(new Integer(pageStr), new Integer(rowsStr));
		List<BasicCost> basicCosts = basicCostService.selectList(wrapper);
		PageInfo<BasicCost> pageInfo = new PageInfo<BasicCost>(basicCosts);

		List<Map<String, Object>> systemFileList = new ArrayList<>();
		if (basicCosts != null && !basicCosts.isEmpty()) {
			Map<String, Object> item = null;
			for (BasicCost basicCost : basicCosts) {
				item = new HashMap<>();
				item.put("id", basicCost.getId());
				item.put("city_code", basicCost.getCityCode());
				item.put("city_name", basicCost.getCityName());
				item.put("basic_cost", basicCost.getBasicCost());
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				item.put("update_time", dateFormat.format(basicCost.getUpdateTime()));
				systemFileList.add(item);
			}
		}

		res.put("rows", systemFileList);

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
		ModelAndView mav = new ModelAndView("basic/cost/form");
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/edit" }, method = { RequestMethod.GET })
	public ModelAndView edit(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("basic/cost/edit");
		return mav;
	}

	/***
	 * 基础数据城市费用详情
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/detail")
	public BasicCost detail(HttpServletRequest request) {
		BasicCost basicCost = null;

		String id = request.getParameter("id");

		basicCost = basicCostService.selectById(id);
		if (basicCost == null) {
			basicCost = new BasicCost();
		}

		basicCost.getCityCode();

		Wrapper<BasicCity> wrapper3 = new EntityWrapper<>();
		wrapper3.eq("code", basicCost.getCityCode());
		BasicCity l3 = basicCityService.selectOne(wrapper3);

		if (!StringUtils.isBlank(l3.getPcode())) {
			Wrapper<BasicCity> wrapper2 = new EntityWrapper<>();
			wrapper2.eq("code", l3.getPcode());
			BasicCity l2 = basicCityService.selectOne(wrapper2);
			basicCost.setCityName(l2.getName() + " - " + l3.getName());
			if (!StringUtils.isBlank(l2.getPcode())) {
				Wrapper<BasicCity> wrapper1 = new EntityWrapper<>();
				wrapper1.eq("code", l2.getPcode());
				BasicCity l1 = basicCityService.selectOne(wrapper1);
				basicCost.setCityName(l1.getName() + " - " + l2.getName() + " - " + l3.getName());
			}
		}

		return basicCost;
	}

	/***
	 * 保存基础数据城市
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

		String cityCode = request.getParameter("city_code");
		Wrapper<BasicCost> wrapper = new EntityWrapper<>();
		wrapper.eq("city_code", cityCode);
		BasicCost _basicCost = basicCostService.selectOne(wrapper);
		if (_basicCost != null) {
			res.put("message", "城市已存在");
			return res;
		}

		Wrapper<BasicCity> basicCityWrapper = new EntityWrapper<>();
		basicCityWrapper.eq("code", cityCode);
		BasicCity basicCity = basicCityService.selectOne(basicCityWrapper);
		if (basicCity == null) {
			res.put("message", "无效的城市编码");
			return res;
		}

		BasicCost basicCost = new BasicCost();

		String basicCostValue = request.getParameter("basic_cost");
		if (NumberUtil.isNumber(basicCostValue)) {
			basicCost.setBasicCost(new BigDecimal(basicCostValue));
		} else {
			basicCost.setBasicCost(new BigDecimal("0"));
		}

		basicCost.setId(IdUtil.id());
		basicCost.setCityCode(basicCity.getCode());
		basicCost.setCityName(basicCity.getName());

		Date now = new Date();
		basicCost.setCreateTime(now);
		basicCost.setUpdateTime(now);

		if (!basicCostService.insert(basicCost)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "保存成功");
		return res;
	}

	/***
	 * 更新基础数据城市服务费
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

		BasicCost basicCost = basicCostService.selectById(id);
		if (basicCost == null) {
			res.put("message", "无效的参数");
			return res;
		}

		String basicCostValue = request.getParameter("basicCost");
		if (NumberUtil.isNumber(basicCostValue)) {
			basicCost.setBasicCost(new BigDecimal(basicCostValue));
		} else {
			basicCost.setBasicCost(new BigDecimal("0"));
		}

		Date now = new Date();
		basicCost.setUpdateTime(now);

		if (!basicCostService.updateById(basicCost)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

}
