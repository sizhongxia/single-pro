package com.single.pro.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.single.pro.entity.Company;
import com.single.pro.service.CompanyService;
import com.xiaoleilu.hutool.util.NumberUtil;

@Controller
@RequestMapping("company")
public class CompanyController extends BaseController {

	@Autowired
	CompanyService companyService;

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
				item.put("mechanism_type", company.getMechanismType());
				item.put("business_regist_no", company.getBusinessRegistNo());
				item.put("organization_code", company.getOrganizationCode());
				item.put("tax_no", company.getTaxNo());
				item.put("contacts", company.getContacts());
				item.put("contact_tel", company.getContactTel());
				item.put("address", company.getAddress());
				item.put("remarks", company.getRemarks());
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
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

	@RequiresAuthentication
	@RequestMapping(value = { "/form" }, method = { RequestMethod.GET })
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("company/form");
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
		Company basicCost = null;

		String id = request.getParameter("id");

		basicCost = companyService.selectById(id);
		if (basicCost == null) {
			basicCost = new Company();
		}

		return basicCost;
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

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

}
