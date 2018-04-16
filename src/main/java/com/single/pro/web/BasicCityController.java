package com.single.pro.web;

import java.net.URLDecoder;
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
import com.single.pro.cache.BaseDataCacheUtil;
import com.single.pro.entity.BasicCity;
import com.single.pro.model.BasicCityModel;
import com.single.pro.service.BasicCityService;
import com.single.pro.service.custom.BasicCityCustomService;
import com.single.pro.util.IdUtil;

@Controller
@RequestMapping("basic/city")
public class BasicCityController extends BaseController {

	@Autowired
	BasicCityService basicCityService;
	@Autowired
	BasicCityCustomService basicCityCustomService;
	@Autowired
	BaseDataCacheUtil baseDataCacheUtil;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("basic/city/index");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/data" }, method = { RequestMethod.POST })
	public List<Map<String, Object>> data(HttpServletRequest request) {
		String pcode = request.getParameter("pcode");
		if (StringUtils.isBlank(pcode)) {
			pcode = "";
		}
		Wrapper<BasicCity> wrapper = new EntityWrapper<>();
		wrapper.eq("pcode", pcode);
		wrapper.orderBy("code", true);
		List<BasicCity> citys = basicCityService.selectList(wrapper);

		List<Map<String, Object>> cityList = new ArrayList<>();

		Map<String, Object> item = null;
		if (citys != null && !citys.isEmpty()) {
			for (BasicCity city : citys) {
				item = new HashMap<>();
				item.put("id", city.getId());
				item.put("name", city.getName());
				item.put("code", city.getCode());
				item.put("pinyin", city.getPinyin());
				item.put("jianpin", city.getJianpin());
				item.put("pcode", city.getPcode());
				item.put("state", city.getCode().length() == 6 && !city.getCode().endsWith("00") ? "open" : "closed");
				item.put("checked", false);
				cityList.add(item);
			}
		}

		return cityList;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/cities" }, method = { RequestMethod.POST })
	public List<Map<String, Object>> cities(HttpServletRequest request) {
		String pcode = request.getParameter("pcode");
		if (StringUtils.isBlank(pcode)) {
			pcode = "1";
		}

		Wrapper<BasicCity> wrapper = new EntityWrapper<>();
		wrapper.eq("pcode", pcode);
		wrapper.orderBy("code", true);
		List<BasicCity> citys = basicCityService.selectList(wrapper);

		List<Map<String, Object>> cityList = new ArrayList<>();

		boolean isFirst = true;

		Map<String, Object> item = null;
		if (citys != null && !citys.isEmpty()) {
			for (BasicCity city : citys) {
				item = new HashMap<>();
				item.put("code", city.getCode());
				item.put("name", city.getName());
				if (isFirst) {
					item.put("selected", "selected");
					isFirst = false;
				}
				cityList.add(item);
			}
		}

		return cityList;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/select" }, method = { RequestMethod.POST })
	public List<Map<String, String>> select(HttpServletRequest request) throws Exception {
		List<Map<String, String>> list = new ArrayList<>();

		String s = request.getParameter("s");
		if (StringUtils.isBlank(s)) {
			return list;
		}
		try {
			s = URLDecoder.decode(s, "utf-8");
			s = s.toLowerCase();
		} catch (Exception e) {
			return list;
		}

		List<BasicCityModel> citys = basicCityCustomService.findBasicCityWithParent(s);
		if (citys != null && !citys.isEmpty()) {
			Map<String, String> item = null;
			for (BasicCityModel cm : citys) {
				item = new HashMap<>();
				item.put("code", cm.getCode());
				StringBuffer sb = new StringBuffer();
				if (StringUtils.isNotBlank(cm.getLv1())) {
					sb.append(cm.getLv1() + " - ");
				}
				if (StringUtils.isNotBlank(cm.getLv2())) {
					sb.append(cm.getLv2() + " - ");
				}
				sb.append(cm.getLv3());
				item.put("name", sb.toString());
				list.add(item);
			}
		}
		return list;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/form" }, method = { RequestMethod.GET })
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("basic/city/form");
		return mav;
	}

	/***
	 * 基础数据城市详情
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/detail")
	public BasicCity detail(HttpServletRequest request) {
		BasicCity basicCity = null;

		String id = request.getParameter("id");

		basicCity = basicCityService.selectById(id);
		if (basicCity == null) {
			basicCity = new BasicCity();
		}

		return basicCity;
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

		String code = request.getParameter("code");
		Wrapper<BasicCity> wrapper = new EntityWrapper<>();
		wrapper.eq("code", code);
		BasicCity _basicCity = basicCityService.selectOne(wrapper);
		if (_basicCity != null) {
			res.put("message", "城市编码已存在");
			return res;
		}

		BasicCity basicCity = new BasicCity();
		basicCity.setId(IdUtil.id());
		basicCity.setName(request.getParameter("name"));
		basicCity.setPcode(request.getParameter("pcode"));
		basicCity.setCode(request.getParameter("code"));
		basicCity.setJianpin(request.getParameter("jianpin"));
		basicCity.setPinyin(request.getParameter("pinyin"));
		Date now = new Date();
		basicCity.setCreateTime(now);
		basicCity.setUpdateTime(now);

		if (!basicCityService.insert(basicCity)) {
			res.put("message", "未知错误");
			return res;
		}
		// 更新通知
		baseDataCacheUtil.updateCachePublish("city");
		res.put("statusCode", 200);
		res.put("message", "保存成功");
		return res;
	}

	/***
	 * 更新基础数据城市
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

		BasicCity basicCity = basicCityService.selectById(id);
		if (basicCity == null) {
			res.put("message", "无效的参数");
			return res;
		}

		String code = request.getParameter("code");
		Wrapper<BasicCity> wrapper = new EntityWrapper<>();
		wrapper.eq("code", code);
		BasicCity _basicCity = basicCityService.selectOne(wrapper);
		if (_basicCity != null && !_basicCity.getId().equals(id)) {
			res.put("message", "城市编码已存在");
			return res;
		}

		basicCity.setName(request.getParameter("name"));
		basicCity.setPcode(request.getParameter("pcode"));
		basicCity.setJianpin(request.getParameter("jianpin"));
		basicCity.setPinyin(request.getParameter("pinyin"));
		basicCity.setCode(code);

		Date now = new Date();
		basicCity.setUpdateTime(now);

		if (!basicCityService.updateById(basicCity)) {
			res.put("message", "未知错误");
			return res;
		}
		// 更新通知
		baseDataCacheUtil.updateCachePublish("city");
		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

	/***
	 * 删除城市
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/delete")
	public Map<String, Object> delete(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			res.put("statusCode", 300);
			res.put("message", "无效的参数");
			return res;
		}

		BasicCity basicCity = basicCityService.selectById(id);
		if (basicCity == null) {
			res.put("statusCode", 300);
			res.put("message", "无效的参数");
			return res;
		}

		Wrapper<BasicCity> wrapper = null;
		wrapper = new EntityWrapper<>();
		wrapper.eq("pcode", basicCity.getCode());
		if (basicCityService.selectOne(wrapper) != null) {
			res.put("statusCode", 300);
			res.put("message", "请先删除其下级城市");
			return res;
		}

		if (!basicCityService.deleteById(id)) {
			res.put("statusCode", 300);
			res.put("message", "未知错误");
			return res;
		}
		// 更新通知
		baseDataCacheUtil.updateCachePublish("city");
		res.put("statusCode", 200);
		res.put("message", "操作成功");
		return res;
	}

}
