package com.single.pro.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.single.pro.cache.BaseDataCacheUtil;
import com.single.pro.entity.Company;
import com.single.pro.entity.Product;
import com.single.pro.entity.ProductKind;
import com.single.pro.entity.ProductType;
import com.single.pro.entity.SystemUser;
import com.single.pro.model.ProductModel;
import com.single.pro.service.CompanyService;
import com.single.pro.service.ProductKindService;
import com.single.pro.service.ProductService;
import com.single.pro.service.ProductTypeService;
import com.single.pro.service.custom.ProductCustomService;
import com.single.pro.util.AdvanceFilterUtil;
import com.single.pro.util.IdUtil;

@Controller
@RequestMapping("product")
public class ProductController extends BaseController {

	@Autowired
	ProductService productService;
	@Autowired
	ProductCustomService productCustomService;
	@Autowired
	ProductKindService productKindService;
	@Autowired
	ProductTypeService productTypeService;
	@Autowired
	CompanyService companyService;
	@Autowired
	BaseDataCacheUtil baseDataCacheUtil;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("product/index");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/list" }, method = { RequestMethod.POST })
	public Map<String, Object> list(HttpServletRequest request) {

		Map<String, Object> res = new HashMap<>();
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

		Map<String, Object> params = new HashMap<>();
		if (StringUtils.isNotBlank(sort) && StringUtils.isNotBlank(order)) {
			params.put("orderByClause", sort + " " + order);
		} else {
			params.put("orderByClause", "p.create_time desc");
		}

		Set<String> exclusionFields = new HashSet<>();
		exclusionFields.add("c.mechanism_type");

		String advanceFilter = request.getParameter("advanceFilter");
		params = AdvanceFilterUtil.initSerachParams(advanceFilter, exclusionFields, "", params);

		PageHelper.startPage(new Integer(pageStr), new Integer(rowsStr));
		List<ProductModel> products = productCustomService.selectProductList(params);
		PageInfo<ProductModel> pageInfo = new PageInfo<ProductModel>(products);

		List<Map<String, Object>> productList = new ArrayList<>();
		if (products != null && !products.isEmpty()) {
			Map<String, Object> item = null;
			for (ProductModel product : products) {
				item = new HashMap<>();
				item.put("p.id", product.getId());
				item.put("p.name", product.getName());
				item.put("pk.name", product.getKindName());
				item.put("pt.name", product.getTypeName());
				item.put("c.name", product.getCompanyName());
				item.put("c.mechanism_type", baseDataCacheUtil.getDictItemName(product.getCompanyMechanismType()));
				item.put("p.model", product.getModel());
				item.put("p.describe", product.getDescribe());
				item.put("p.name", product.getName());
				item.put("p.show_status", product.getShowStatus());
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				item.put("p.create_time", dateFormat.format(product.getCreateTime()));
				item.put("p.update_time", dateFormat.format(product.getUpdateTime()));
				productList.add(item);
			}
		}

		res.put("rows", productList);

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
		ModelAndView mav = new ModelAndView("product/form");
		mav.addObject("domId", System.currentTimeMillis());
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/editForm" }, method = { RequestMethod.GET })
	public ModelAndView editForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("product/editForm");
		mav.addObject("domId", System.currentTimeMillis());
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/editTypeForm" }, method = { RequestMethod.GET })
	public ModelAndView editTypeForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("product/editTypeForm");
		mav.addObject("domId", System.currentTimeMillis());

		String id = request.getParameter("id");
		Product product = productService.selectById(id);
		if (product == null) {
			return mav;
		}

		mav.addObject("id", product.getId());
		mav.addObject("productKindName", "");
		if (StringUtils.isNotBlank(product.getKindId())) {
			ProductKind productKind = productKindService.selectById(product.getKindId());
			if (productKind != null) {
				mav.addObject("productKindName", productKind.getName());
			}
		}
		mav.addObject("productTypeName", "");
		if (StringUtils.isNotBlank(product.getTypeId())) {
			ProductType productType = productTypeService.selectById(product.getTypeId());
			if (productType != null) {
				mav.addObject("productTypeName", productType.getName());
			}
		}

		return mav;
	}

	/***
	 * 产品详情
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/detail")
	public Map<String, Object> detail(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();

		String id = request.getParameter("id");
		Product product = productService.selectById(id);
		if (product == null) {
			return map;
		}

		map.put("id", product.getId());
		map.put("name", product.getName());
		map.put("productKindName", "");
		if (StringUtils.isNotBlank(product.getKindId())) {
			ProductKind productKind = productKindService.selectById(product.getKindId());
			if (productKind != null) {
				map.put("productKindName", productKind.getName());
			}
		}
		map.put("productTypeName", "");
		if (StringUtils.isNotBlank(product.getTypeId())) {
			ProductType productType = productTypeService.selectById(product.getTypeId());
			if (productType != null) {
				map.put("productTypeName", productType.getName());
			}
		}
		map.put("groupId", product.getCompanyId());
		map.put("companyName", "");
		if (StringUtils.isNotBlank(product.getCompanyId())) {
			Company company = companyService.selectById(product.getCompanyId());
			if (company != null) {
				map.put("companyName", company.getName());
			}
		}
		map.put("model", product.getModel());
		map.put("describe", product.getDescribe());
		map.put("constituent", product.getConstituent());
		map.put("surveyItems", product.getSurveyItems());
		map.put("installDebug", product.getInstallDebug());
		map.put("deviceMaintain", product.getDeviceMaintain());
		map.put("commonProblem", product.getCommonProblem());
		map.put("docUrl", product.getDocUrl());
		map.put("manualUrl", product.getManualUrl());
		map.put("showStatus", product.getShowStatus());
		return map;
	}

	/***
	 * 保存产品
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

		Product product = new Product();
		product.setId(IdUtil.id());
		product.setName(request.getParameter("name"));
		product.setKindId(request.getParameter("kindId"));
		product.setTypeId(request.getParameter("typeId"));
		product.setCompanyId(request.getParameter("groupId"));
		product.setModel(request.getParameter("model"));
		product.setDescribe(request.getParameter("describe"));
		product.setConstituent(request.getParameter("constituent"));
		product.setSurveyItems(request.getParameter("surveyItems"));
		product.setInstallDebug(request.getParameter("installDebug"));
		product.setDeviceMaintain(request.getParameter("deviceMaintain"));
		product.setCommonProblem(request.getParameter("commonProblem"));
		product.setDocUrl(request.getParameter("docUrl"));
		product.setManualUrl(request.getParameter("manualUrl"));
		product.setShowStatus(request.getParameter("showStatus"));
		Subject subject = SecurityUtils.getSubject();
		SystemUser user = (SystemUser) subject.getPrincipal();
		product.setApplyUserId(user.getId());
		product.setCreateTime(new Date());
		product.setUpdateTime(new Date());

		if (!productService.insert(product)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "保存成功");
		return res;
	}

	/***
	 * 更新产品
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

		Product product = productService.selectById(id);
		if (product == null) {
			res.put("message", "无效的参数");
			return res;
		}

		product.setName(request.getParameter("name"));
		product.setCompanyId(request.getParameter("groupId"));
		product.setModel(request.getParameter("model"));
		product.setDescribe(request.getParameter("describe"));
		product.setConstituent(request.getParameter("constituent"));
		product.setSurveyItems(request.getParameter("surveyItems"));
		product.setInstallDebug(request.getParameter("installDebug"));
		product.setDeviceMaintain(request.getParameter("deviceMaintain"));
		product.setCommonProblem(request.getParameter("commonProblem"));
		product.setDocUrl(request.getParameter("docUrl"));
		product.setManualUrl(request.getParameter("manualUrl"));
		product.setShowStatus(request.getParameter("showStatus"));
		product.setUpdateTime(new Date());

		if (!productService.updateById(product)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/updateType")
	public Map<String, Object> updateType(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			res.put("message", "无效的参数");
			return res;
		}

		Product product = productService.selectById(id);
		if (product == null) {
			res.put("message", "无效的参数");
			return res;
		}
		product.setKindId(request.getParameter("kindId"));
		product.setTypeId(request.getParameter("typeId"));
		product.setUpdateTime(new Date());

		if (!productService.updateById(product)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}
}
