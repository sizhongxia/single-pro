package com.single.pro.web;

import java.net.URLDecoder;
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
import com.github.stuxuhai.jpinyin.PinyinException;
import com.github.stuxuhai.jpinyin.PinyinFormat;
import com.github.stuxuhai.jpinyin.PinyinHelper;
import com.single.pro.cache.BaseDataCacheUtil;
import com.single.pro.entity.Company;
import com.single.pro.service.CompanyService;
import com.single.pro.service.custom.CompanyCustomService;
import com.single.pro.util.IdUtil;
import com.xiaoleilu.hutool.util.NumberUtil;

@Controller
@RequestMapping("company")
public class CompanyController extends BaseController {

	@Autowired
	CompanyService companyService;
	@Autowired
	CompanyCustomService companyCustomService;
	@Autowired
	BaseDataCacheUtil baseDataCacheUtil;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("company/index");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/list" }, method = { RequestMethod.POST })
	public Map<String, Object> list(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();

		Wrapper<Company> wrapper = new EntityWrapper<>();

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
			wrapper.orderBy("name", true);
		}

		PageHelper.startPage(new Integer(pageStr), new Integer(rowsStr));
		List<Company> companys = companyService.selectList(wrapper);
		PageInfo<Company> pageInfo = new PageInfo<Company>(companys);

		List<Map<String, Object>> companyList = new ArrayList<>();
		if (companys != null && !companys.isEmpty()) {
			Map<String, Object> item = null;
			for (Company company : companys) {
				item = new HashMap<>();
				item.put("id", company.getId());
				item.put("name", company.getName());
				item.put("short_name", company.getShortName());
				item.put("mechanism_type", baseDataCacheUtil.getDictItemName(company.getMechanismType()));
				item.put("business_regist_no", company.getBusinessRegistNo());
				item.put("organization_code", company.getOrganizationCode());
				item.put("tax_no", company.getTaxNo());
				item.put("contacts", company.getContacts());
				item.put("contact_tel", company.getContactTel());

				item.put("provincial", baseDataCacheUtil.getCityName(company.getProvincial()));
				item.put("city", baseDataCacheUtil.getCityName(company.getCity()));
				item.put("county", baseDataCacheUtil.getCityName(company.getCounty()));

				item.put("address", company.getAddress());
				item.put("remarks", company.getRemarks());
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				item.put("create_time", dateFormat.format(company.getCreateTime()));
				item.put("update_time", dateFormat.format(company.getUpdateTime()));
				companyList.add(item);
			}
		}

		res.put("rows", companyList);

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
	@RequestMapping(value = "/groups")
	public List<Map<String, String>> groups(HttpServletRequest request) {
		List<Map<String, String>> list = new ArrayList<>();

		Map<String, Object> params = new HashMap<>();

		String q = request.getParameter("q");
		if (StringUtils.isNotBlank(q)) {
			try {
				q = URLDecoder.decode(q, "utf-8");
				q = q.toLowerCase();
				params.put("sq", q);
			} catch (Exception e) {
			}
		}
		List<Company> companys = companyCustomService.selectCompanyList(params);
		if (companys == null || companys.isEmpty()) {
			return list;
		}
		Map<String, String> item = null;
		for (Company company : companys) {
			item = new HashMap<>();
			item.put("groupId", company.getId());
			item.put("companyName", company.getName() + " (" + company.getShortName() + ")");
			list.add(item);
		}

		return list;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/form" }, method = { RequestMethod.GET })
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("company/form");
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/editForm" }, method = { RequestMethod.GET })
	public ModelAndView editForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("company/editForm");
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/changeAreaform" }, method = { RequestMethod.GET })
	public ModelAndView changeAreaform(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("company/changeAreaform");
		return mav;
	}

	/***
	 * 企业详情
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/detail")
	public Company detail(HttpServletRequest request) {
		Company company = null;

		String id = request.getParameter("id");

		company = companyService.selectById(id);
		if (company == null) {
			company = new Company();
		}

		company.setProvincial(baseDataCacheUtil.getCityName(company.getProvincial()));
		company.setCity(baseDataCacheUtil.getCityName(company.getCity()));
		company.setCounty(baseDataCacheUtil.getCityName(company.getCounty()));

		return company;
	}

	/***
	 * 保存企业
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

		String organizationCode = request.getParameter("organizationCode");

		Wrapper<Company> wrapper = new EntityWrapper<>();
		wrapper.eq("organization_code", organizationCode);
		Company company = companyService.selectOne(wrapper);
		if (company != null) {
			res.put("message", "组织机构代码已存在");
			return res;
		}
		String name = request.getParameter("name");
		company = new Company();
		company.setId(IdUtil.id());
		company.setName(name);
		try {
			company.setPinyin(PinyinHelper.convertToPinyinString(name, "", PinyinFormat.WITHOUT_TONE));
		} catch (PinyinException e) {
			res.put("message", "拼音数据转换失败");
			return res;
		}
		company.setShortName(request.getParameter("shortName"));
		company.setGroupId(request.getParameter("groupId"));
		company.setMechanismType(request.getParameter("mechanismType"));
		company.setBusinessRegistNo(request.getParameter("businessRegistNo"));
		company.setOrganizationCode(organizationCode);
		company.setTaxNo(request.getParameter("taxNo"));
		company.setProvincial(request.getParameter("provincial"));
		company.setCity(request.getParameter("city"));
		company.setCounty(request.getParameter("county"));
		company.setAddress(request.getParameter("address"));
		company.setContacts(request.getParameter("contacts"));
		company.setContactTel(request.getParameter("contactTel"));
		company.setRemarks(request.getParameter("remarks"));
		company.setCreateTime(new Date());
		company.setUpdateTime(new Date());

		if (!companyService.insert(company)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "保存成功");
		return res;
	}

	/***
	 * 更新企业
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

		Company company = companyService.selectById(id);
		if (company == null) {
			res.put("message", "无效的参数");
			return res;
		}

		String organizationCode = request.getParameter("organizationCode");

		Wrapper<Company> wrapper = new EntityWrapper<>();
		wrapper.eq("organization_code", organizationCode);
		Company _company = companyService.selectOne(wrapper);
		if (_company != null && !_company.getId().equals(id)) {
			res.put("message", "组织机构代码已存在");
			return res;
		}

		String name = request.getParameter("name");
		company.setName(name);
		try {
			company.setPinyin(PinyinHelper.convertToPinyinString(name, "", PinyinFormat.WITHOUT_TONE));
		} catch (PinyinException e) {
			res.put("message", "拼音数据转换失败");
			return res;
		}
		company.setShortName(request.getParameter("shortName"));
		// company.setGroupId(request.getParameter("groupId"));
		company.setMechanismType(request.getParameter("mechanismType"));
		company.setBusinessRegistNo(request.getParameter("businessRegistNo"));
		company.setOrganizationCode(organizationCode);
		company.setTaxNo(request.getParameter("taxNo"));
		company.setProvincial(request.getParameter("provincial"));
		company.setCity(request.getParameter("city"));
		company.setCounty(request.getParameter("county"));
		company.setAddress(request.getParameter("address"));
		company.setContacts(request.getParameter("contacts"));
		company.setContactTel(request.getParameter("contactTel"));
		company.setRemarks(request.getParameter("remarks"));
		company.setUpdateTime(new Date());

		if (!companyService.updateById(company)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/updateArea")
	public Map<String, Object> updateArea(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			res.put("message", "无效的参数");
			return res;
		}

		Company company = companyService.selectById(id);
		if (company == null) {
			res.put("message", "无效的参数");
			return res;
		}
		company.setProvincial(request.getParameter("n-provincial"));
		company.setCity(request.getParameter("n-city"));
		company.setCounty(request.getParameter("n-county"));
		company.setAddress(request.getParameter("address"));
		company.setUpdateTime(new Date());

		if (!companyService.updateById(company)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}
}
