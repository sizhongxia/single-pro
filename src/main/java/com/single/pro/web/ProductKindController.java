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
import com.single.pro.entity.ProductKind;
import com.single.pro.service.ProductKindService;
import com.single.pro.storage.RealHostReplace;
import com.single.pro.util.IdUtil;
import com.xiaoleilu.hutool.util.NumberUtil;

@Controller
@RequestMapping("product/kind")
public class ProductKindController extends BaseController {

	@Autowired
	ProductKindService productKindService;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("product/kind/index");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/list" }, method = { RequestMethod.POST })
	public Map<String, Object> list(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();

		Wrapper<ProductKind> wrapper = new EntityWrapper<>();

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
		List<ProductKind> productKinds = productKindService.selectList(wrapper);
		PageInfo<ProductKind> pageInfo = new PageInfo<ProductKind>(productKinds);

		List<Map<String, Object>> productKindList = new ArrayList<>();
		if (productKinds != null && !productKinds.isEmpty()) {
			Map<String, Object> item = null;
			for (ProductKind productKind : productKinds) {
				item = new HashMap<>();
				item.put("id", productKind.getId());
				item.put("name", productKind.getName());
				item.put("pic_url", RealHostReplace.getResUrl(productKind.getPicUrl()));
				item.put("summary", productKind.getSummary());
				item.put("status", productKind.getStatus());
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				item.put("create_time", dateFormat.format(productKind.getCreateTime()));
				item.put("update_time", dateFormat.format(productKind.getUpdateTime()));
				productKindList.add(item);
			}
		}

		res.put("rows", productKindList);

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
		ModelAndView mav = new ModelAndView("product/kind/form");
		return mav;
	}

	/***
	 * 产品种类详情
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/detail")
	public ProductKind detail(HttpServletRequest request) {
		ProductKind productKind = null;

		String id = request.getParameter("id");

		productKind = productKindService.selectById(id);
		if (productKind == null) {
			productKind = new ProductKind();
		}

		return productKind;
	}

	/***
	 * 保存产品种类
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

		ProductKind productKind = new ProductKind();
		productKind.setId(IdUtil.id());
		productKind.setName(request.getParameter("name"));
		productKind.setPicUrl(request.getParameter("picUrl"));
		productKind.setSummary(request.getParameter("summary"));
		productKind.setStatus(request.getParameter("status"));
		productKind.setCreateTime(new Date());
		productKind.setUpdateTime(new Date());

		if (!productKindService.insert(productKind)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "保存成功");
		return res;
	}

	/***
	 * 更新产品种类
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

		ProductKind productKind = productKindService.selectById(id);
		if (productKind == null) {
			res.put("message", "无效的参数");
			return res;
		}

		productKind.setName(request.getParameter("name"));
		productKind.setPicUrl(request.getParameter("picUrl"));
		productKind.setSummary(request.getParameter("summary"));
		productKind.setStatus(request.getParameter("status"));
		productKind.setUpdateTime(new Date());

		if (!productKindService.updateById(productKind)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}
}
