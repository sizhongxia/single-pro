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

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.single.pro.cache.BaseDataCacheUtil;
import com.single.pro.entity.Company;
import com.single.pro.entity.Product;
import com.single.pro.entity.ProductImage;
import com.single.pro.entity.ProductKind;
import com.single.pro.entity.ProductQualification;
import com.single.pro.entity.ProductType;
import com.single.pro.entity.SystemUser;
import com.single.pro.model.ProductModel;
import com.single.pro.service.CompanyService;
import com.single.pro.service.ProductImageService;
import com.single.pro.service.ProductKindService;
import com.single.pro.service.ProductQualificationService;
import com.single.pro.service.ProductService;
import com.single.pro.service.ProductTypeService;
import com.single.pro.service.custom.ProductCustomService;
import com.single.pro.storage.RealHostReplace;
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
	ProductQualificationService productQualificationService;
	@Autowired
	ProductImageService productImageService;
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
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
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
				if(StringUtils.isNotBlank(product.getDocUrl())) {
					item.put("p.doc_url", RealHostReplace.getResUrl(product.getDocUrl()));
				} else {
					item.put("p.doc_url", "");
				}
				if(StringUtils.isNotBlank(product.getManualUrl())) {
					item.put("p.manual_url", RealHostReplace.getResUrl(product.getManualUrl()));
				} else {
					item.put("p.manual_url", "");
				}
				item.put("p.show_status", product.getShowStatus());
				item.put("p.contacts", product.getContacts());
				item.put("p.contact_tel", product.getContactTel());
				if(StringUtils.isNotBlank(product.getCoverPicUrl())) {
					item.put("p.coverPicUrl", RealHostReplace.getResUrl(product.getCoverPicUrl()));
				} else {
					item.put("p.coverPicUrl", "");
				}
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
	@RequestMapping(value = { "/uploadPic" }, method = { RequestMethod.GET })
	public ModelAndView uploadPic(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("product/uploadPic");
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/images" }, method = { RequestMethod.GET })
	public ModelAndView images(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("product/images");

		String id = request.getParameter("id");
		Product product = productService.selectById(id);
		if (product == null) {
			return new ModelAndView("error/invalid_parameter");
		}

		Wrapper<ProductImage> wrapper = new EntityWrapper<>();
		wrapper.eq("product_id", id);
		wrapper.eq("status", "Y");
		wrapper.orderBy("is_cover desc");
		List<ProductImage> images = productImageService.selectList(wrapper);

		if (images != null && !images.isEmpty()) {
			for (ProductImage img : images) {
				img.setPath(RealHostReplace.getResUrl(img.getPath()));
			}
		} else {
			images = new ArrayList<>();
		}

		mav.addObject("id", id);
		mav.addObject("name", product.getName());
		mav.addObject("images", images);
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
			return new ModelAndView("error/invalid_parameter");
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
		map.put("contacts", product.getContacts());
		map.put("contactTel", product.getContactTel());
		map.put("showStatus", product.getShowStatus());
		return map;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/baseData")
	public Map<String, Object> baseData(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		String id = request.getParameter("id");
		map.put("id", id);
		return map;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/qualification" }, method = { RequestMethod.GET })
	public ModelAndView qualification(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("product/qualification");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/qualificationData" })
	public Map<String, Object> qualificationData(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		String id = request.getParameter("id");

		Product product = productService.selectById(id);
		if (product == null) {
			return res;
		}

		Wrapper<ProductQualification> wrapper = new EntityWrapper<>();
		wrapper.eq("type_id", product.getTypeId());
		List<ProductQualification> qualifications = productQualificationService.selectList(wrapper);

		if (qualifications != null && !qualifications.isEmpty()) {
			Set<String> qualificationCodes = new HashSet<>();
			for (ProductQualification qualification : qualifications) {
				qualificationCodes.add(qualification.getQualification());
			}
			res.put("qualification", qualificationCodes);
		}
		return res;
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
		product.setShowStatus("D");
		product.setContacts(request.getParameter("contacts"));
		product.setContactTel(request.getParameter("contactTel"));
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
		product.setContacts(request.getParameter("contacts"));
		product.setContactTel(request.getParameter("contactTel"));

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

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/unsale")
	public Map<String, Object> unsale(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String ids = request.getParameter("ids");

		if (StringUtils.isBlank(ids)) {
			res.put("message", "未选择数据");
			return res;
		}

		String[] idses = ids.split(",");
		Set<String> idList = new HashSet<>();
		for (String id : idses) {
			idList.add(id);
		}
		List<Product> products = productService.selectBatchIds(idList);
		if (products != null && products.size() > 0) {
			List<Product> dProducts = new ArrayList<>();
			for (Product product : products) {
				if ("Y".equals(product.getShowStatus())) {
					product.setShowStatus("N");
					product.setUpdateTime(new Date());
					dProducts.add(product);
				}
			}
			if (!dProducts.isEmpty()) {
				if (!productService.updateBatchById(dProducts)) {
					res.put("message", "出现未知错误，请稍后重试");
					return res;
				}
			} else {
				res.put("message", "所选项目中未发现上线产品");
				return res;
			}
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/savePic")
	public Map<String, Object> savePic(HttpServletRequest request) {
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

		String picUrl = request.getParameter("picUrl");

		if (StringUtils.isBlank(picUrl)) {
			res.put("message", "请上传一张图片");
			return res;
		}

		String isCover = request.getParameter("isCover");
		if (StringUtils.isBlank(isCover) || !"Y".equals(isCover)) {
			isCover = "N";
		}

		Wrapper<ProductImage> wrapper = new EntityWrapper<>();
		wrapper.eq("product_id", id);
		wrapper.eq("status", "Y");
		wrapper.eq("is_cover", "Y");
		Date now = new Date();
		ProductImage productImage = productImageService.selectOne(wrapper);
		boolean change = false;
		if (productImage == null) {
			isCover = "Y";
			change = true;
			product.setCoverPicUrl(picUrl);
		} else {
			if ("Y".equals(isCover)) {
				product.setCoverPicUrl(picUrl);
				productImage.setIsCover("N");
				productImage.setUpdateTime(now);
				change = true;
			}
		}

		ProductImage entity = new ProductImage();
		entity.setId(IdUtil.id());
		entity.setProductId(id);
		entity.setPath(picUrl);
		entity.setIsCover(isCover);
		entity.setStatus("Y");
		entity.setCreateTime(now);
		entity.setUpdateTime(now);

		if (!productImageService.insert(entity)) {
			res.put("message", "未知错误1");
			return res;
		}

		if (change) {
			if (!productService.updateById(product)) {
				res.put("message", "未知错误3");
				return res;
			}

			if (productImage != null) {
				if (!productImageService.updateById(productImage)) {
					res.put("message", "未知错误2");
					return res;
				}
			}
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/setImageDefault")
	public Map<String, Object> setImageDefault(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			res.put("message", "无效的参数");
			return res;
		}

		ProductImage productImage = productImageService.selectById(id);
		if (productImage == null) {
			res.put("message", "无效的参数");
			return res;
		}
		Product product = productService.selectById(productImage.getProductId());
		if (product == null) {
			res.put("message", "无效的产品参数");
			return res;
		}

		Wrapper<ProductImage> wrapper = new EntityWrapper<>();
		wrapper.eq("product_id", productImage.getProductId());
		wrapper.eq("status", "Y");
		wrapper.eq("is_cover", "Y");
		Date now = new Date();
		ProductImage productImageDeault = productImageService.selectOne(wrapper);

		productImage.setIsCover("Y");
		productImage.setUpdateTime(now);
		if (!productImageService.updateById(productImage)) {
			res.put("message", "未知错误1");
			return res;
		}

		product.setCoverPicUrl(productImage.getPath());
		if (!productService.updateById(product)) {
			res.put("message", "未知错误2");
			return res;
		}

		if (productImageDeault != null) {
			productImageDeault.setIsCover("N");
			productImageDeault.setUpdateTime(now);
			if (!productImageService.updateById(productImageDeault)) {
				res.put("message", "未知错误3");
				return res;
			}
		}

		res.put("statusCode", 200);
		res.put("message", "设置成功");
		return res;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/setImageOutline")
	public Map<String, Object> setImageOutline(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			res.put("message", "无效的参数");
			return res;
		}

		ProductImage productImage = productImageService.selectById(id);
		if (productImage == null) {
			res.put("message", "无效的参数");
			return res;
		}

		if ("Y".equals(productImage.getIsCover())) {
			res.put("message", "不允许直接删除封面图片");
			return res;
		}

		productImage.setStatus("N");
		productImage.setUpdateTime(new Date());
		if (!productImageService.updateById(productImage)) {
			res.put("message", "未知错误1");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "移除成功");
		return res;
	}
}
