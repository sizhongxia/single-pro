package com.single.pro.web;

import java.math.BigDecimal;
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
import com.single.pro.cache.BaseDataCacheUtil;
import com.single.pro.entity.ProductKind;
import com.single.pro.entity.ProductQualification;
import com.single.pro.entity.ProductType;
import com.single.pro.service.ProductKindService;
import com.single.pro.service.ProductQualificationService;
import com.single.pro.service.ProductTypeService;
import com.single.pro.storage.RealHostReplace;
import com.single.pro.util.IdUtil;
import com.xiaoleilu.hutool.util.NumberUtil;

@Controller
@RequestMapping("product/type")
public class ProductTypeController extends BaseController {

	@Autowired
	ProductTypeService productTypeService;
	@Autowired
	ProductKindService productKindService;
	@Autowired
	BaseDataCacheUtil baseDataCacheUtil;
	@Autowired
	ProductQualificationService productQualificationService;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("product/type/index");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/list" }, method = { RequestMethod.POST })
	public Map<String, Object> list(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();

		Wrapper<ProductType> wrapper = new EntityWrapper<>();

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

		String kindId = request.getParameter("kindId");
		if (StringUtils.isNotBlank(kindId)) {
			wrapper.eq("kind_id", kindId);
		}

		PageHelper.startPage(new Integer(pageStr), new Integer(rowsStr));
		List<ProductType> productTypes = productTypeService.selectList(wrapper);
		PageInfo<ProductType> pageInfo = new PageInfo<ProductType>(productTypes);

		List<Map<String, Object>> productTypeList = new ArrayList<>();
		if (productTypes != null && !productTypes.isEmpty()) {
			Map<String, Object> item = null;
			for (ProductType productType : productTypes) {
				item = new HashMap<>();
				item.put("id", productType.getId());
				item.put("name", productType.getName());
				item.put("pic_url", RealHostReplace.getResUrl(productType.getPicUrl()));
				item.put("unit", baseDataCacheUtil.getDictItemName(productType.getUnit()));
				item.put("difficulty", productType.getDifficulty());
				item.put("summary", productType.getSummary());
				item.put("status", productType.getStatus());
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				item.put("create_time", dateFormat.format(productType.getCreateTime()));
				item.put("update_time", dateFormat.format(productType.getUpdateTime()));
				productTypeList.add(item);
			}
		}

		res.put("rows", productTypeList);

		res.put("currentPage", pageInfo.getPageNum());
		res.put("firstPage", pageInfo.isIsFirstPage());
		res.put("lastPage", pageInfo.isIsLastPage());
		res.put("numPerPage", pageInfo.getPrePage());
		res.put("totalPage", pageInfo.getPages());
		res.put("total", pageInfo.getTotal());

		return res;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/all" }, method = { RequestMethod.POST })
	public List<Map<String, Object>> all(HttpServletRequest request) {
		List<Map<String, Object>> productTypeList = new ArrayList<>();

		String kindId = request.getParameter("kindId");
		if (StringUtils.isBlank(kindId)) {
			return productTypeList;
		}

		Wrapper<ProductType> wrapper = new EntityWrapper<>();
		wrapper.eq("kind_id", kindId);
		wrapper.eq("status", "Y");
		wrapper.orderBy("name asc");
		List<ProductType> productTypes = productTypeService.selectList(wrapper);

		if (productTypes != null && !productTypes.isEmpty()) {
			Map<String, Object> item = null;
			for (ProductType productType : productTypes) {
				item = new HashMap<>();
				item.put("typeId", productType.getId());
				item.put("typeName", productType.getName());
				item.put("picUrl", RealHostReplace.getResUrl(productType.getPicUrl()));
				productTypeList.add(item);
			}
		}

		return productTypeList;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/form" }, method = { RequestMethod.GET })
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("product/type/form");
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/qualification" }, method = { RequestMethod.GET })
	public ModelAndView qualification(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("product/type/qualification");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/qualificationData" })
	public Map<String, Object> qualificationData(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		String id = request.getParameter("id");

		ProductType productType = productTypeService.selectById(id);
		if (productType == null) {
			return res;
		}

		Wrapper<ProductQualification> wrapper = new EntityWrapper<>();
		wrapper.eq("type_id", id);
		List<ProductQualification> qualifications = productQualificationService.selectList(wrapper);

		if (qualifications != null && !qualifications.isEmpty()) {
			Set<String> qualificationCodes = new HashSet<>();
			for (ProductQualification qualification : qualifications) {
				qualificationCodes.add(qualification.getQualification());
			}
			res.put("qualification", qualificationCodes);
		}

		res.put("id", id);
		return res;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/info" }, method = { RequestMethod.GET })
	public ModelAndView info(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("product/type/info");
		String id = request.getParameter("id");

		ProductType productType = productTypeService.selectById(id);
		if (productType == null) {
			return new ModelAndView("error/invalid_parameter");
		}

		ProductKind productKind = productKindService.selectById(productType.getKindId());
		if (productKind == null) {
			mav.addObject("productKindName", "");
			mav.addObject("productKindPicUrl", "");
		} else {
			mav.addObject("productKindName", productKind.getName());
			mav.addObject("productKindPicUrl", RealHostReplace.getResUrl(productKind.getPicUrl()));
		}
		mav.addObject("productType", productType);
		mav.addObject("productTypePicUrl", RealHostReplace.getResUrl(productType.getPicUrl()));
		mav.addObject("productTypeUnit", baseDataCacheUtil.getDictItemName(productType.getUnit()));
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
	public ProductType detail(HttpServletRequest request) {
		ProductType productType = null;

		String id = request.getParameter("id");

		productType = productTypeService.selectById(id);
		if (productType == null) {
			productType = new ProductType();
		}

		return productType;
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

		ProductType productType = new ProductType();
		productType.setId(IdUtil.id());
		productType.setKindId(request.getParameter("kindId"));
		productType.setName(request.getParameter("name"));
		productType.setPicUrl(request.getParameter("picUrl"));

		productType.setSgsqCondition(request.getParameter("sgsqCondition"));

		productType.setSerSurvey(request.getParameter("serSurvey"));
		productType.setSerCheck(request.getParameter("serCheck"));
		productType.setSerConstruct(request.getParameter("serConstruct"));
		productType.setSerTrain(request.getParameter("serTrain"));
		productType.setSerAccept(request.getParameter("serAccept"));

		String difficulty = request.getParameter("difficulty");
		if (NumberUtil.isNumber(difficulty)) {
			productType.setDifficulty(new BigDecimal(difficulty));
		} else {
			productType.setDifficulty(new BigDecimal("3"));
		}

		productType.setUnit(request.getParameter("unit"));
		productType.setSummary(request.getParameter("summary"));
		productType.setStatus(request.getParameter("status"));

		productType.setCreateTime(new Date());
		productType.setUpdateTime(new Date());

		if (!productTypeService.insert(productType)) {
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

		ProductType productType = productTypeService.selectById(id);
		if (productType == null) {
			res.put("message", "无效的参数");
			return res;
		}

		productType.setKindId(request.getParameter("kindId"));
		productType.setName(request.getParameter("name"));
		productType.setPicUrl(request.getParameter("picUrl"));

		productType.setSgsqCondition(request.getParameter("sgsqCondition"));

		productType.setSerSurvey(request.getParameter("serSurvey"));
		productType.setSerCheck(request.getParameter("serCheck"));
		productType.setSerConstruct(request.getParameter("serConstruct"));
		productType.setSerTrain(request.getParameter("serTrain"));
		productType.setSerAccept(request.getParameter("serAccept"));

		String difficulty = request.getParameter("difficulty");
		if (NumberUtil.isNumber(difficulty)) {
			productType.setDifficulty(new BigDecimal(difficulty));
		} else {
			productType.setDifficulty(new BigDecimal("3"));
		}

		productType.setUnit(request.getParameter("unit"));
		productType.setSummary(request.getParameter("summary"));
		productType.setStatus(request.getParameter("status"));
		productType.setUpdateTime(new Date());

		if (!productTypeService.updateById(productType)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/updateQualification")
	public Map<String, Object> updateQualification(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			res.put("message", "无效的参数");
			return res;
		}

		String[] qualifications = request.getParameterValues("qualification");
		if (qualifications == null || qualifications.length == 0) {
			res.put("message", "请选择一个产品资质");
			return res;
		}

		ProductType productType = productTypeService.selectById(id);
		if (productType == null) {
			res.put("message", "无效的参数");
			return res;
		}

		List<String> qualificationNews1 = new ArrayList<>();
		List<String> qualificationNews2 = new ArrayList<>();
		for (String qualification : qualifications) {
			qualificationNews1.add(qualification);
			qualificationNews2.add(qualification);
		}

		Wrapper<ProductQualification> wrapper = new EntityWrapper<>();
		wrapper.eq("type_id", id);
		List<ProductQualification> qualificationDbs = productQualificationService.selectList(wrapper);

		if (qualificationDbs == null || qualificationDbs.isEmpty()) {
			List<ProductQualification> entityList = new ArrayList<>();
			for (String qualification : qualificationNews1) {
				ProductQualification item = new ProductQualification();
				item.setId(IdUtil.id());
				item.setTypeId(id);
				item.setQualification(qualification);
				entityList.add(item);
			}
			if (!productQualificationService.insertBatch(entityList)) {
				res.put("message", "未知错误");
				return res;
			}
		} else {
			List<String> qualificationOlds1 = new ArrayList<>();
			List<String> qualificationOlds2 = new ArrayList<>();
			for (ProductQualification qualification : qualificationDbs) {
				qualificationOlds1.add(qualification.getQualification());
				qualificationOlds2.add(qualification.getQualification());
			}

			qualificationNews1.removeAll(qualificationOlds1);
			if (qualificationNews1.size() > 0) {
				List<ProductQualification> entityList = new ArrayList<>();
				for (String qualification : qualificationNews1) {
					ProductQualification item = new ProductQualification();
					item.setId(IdUtil.id());
					item.setTypeId(id);
					item.setQualification(qualification);
					entityList.add(item);
				}
				if (!productQualificationService.insertBatch(entityList)) {
					res.put("message", "未知错误");
					return res;
				}
			}

			qualificationOlds2.removeAll(qualificationNews2);

			if (qualificationOlds2.size() > 0) {
				for (String qualification : qualificationOlds2) {
					Wrapper<ProductQualification> productQualificationWrapper = new EntityWrapper<>();
					productQualificationWrapper.eq("type_id", id);
					productQualificationWrapper.eq("qualification", qualification);
					if (!productQualificationService.delete(productQualificationWrapper)) {
						res.put("message", "未知错误");
						return res;
					}
				}
			}
		}

		res.put("statusCode", 200);
		res.put("message", "操作成功");
		return res;
	}

	public static void main(String[] args) {
		List<String> qualificationNews = new ArrayList<>();
		qualificationNews.add("A");
		qualificationNews.add("B");
		qualificationNews.add("C");
		qualificationNews.add("D");
		List<String> qualificationOlds = new ArrayList<>();
		qualificationOlds.add("C");
		qualificationOlds.add("D");
		qualificationOlds.add("E");
		List<String> qualificationNews2 = qualificationNews;

		System.out.println(qualificationNews.retainAll(qualificationOlds));
		System.out.println(qualificationNews);

		System.out.println(qualificationNews2.removeAll(qualificationOlds));

		System.out.println(qualificationNews2);
	}
}
