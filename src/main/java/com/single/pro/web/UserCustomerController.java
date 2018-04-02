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
import com.single.pro.cache.BaseDataCacheUtil;
import com.single.pro.entity.Company;
import com.single.pro.entity.User;
import com.single.pro.entity.UserCustomer;
import com.single.pro.model.UserCustomerModel;
import com.single.pro.service.CompanyService;
import com.single.pro.service.UserCustomerService;
import com.single.pro.service.UserService;
import com.single.pro.service.custom.UserCustomerCustomService;
import com.single.pro.util.AdvanceFilterUtil;
import com.single.pro.util.IdUtil;

@Controller
@RequestMapping("user/customer")
public class UserCustomerController extends BaseController {

	@Autowired
	UserCustomerCustomService userCustomerCustomService;
	@Autowired
	UserService userService;
	@Autowired
	UserCustomerService userCustomerService;
	@Autowired
	BaseDataCacheUtil baseDataCacheUtil;
	@Autowired
	CompanyService companyService;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/customer/index");
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
			params.put("orderByClause", "u." + sort + " " + order);
		} else {
			params.put("orderByClause", "u.regist_time asc");
		}

		Set<String> exclusionFields = new HashSet<>();
		exclusionFields.add("is_platform");
		exclusionFields.add("apply_status");
		exclusionFields.add("apply_time");
		exclusionFields.add("apply_reason");
		exclusionFields.add("province");
		exclusionFields.add("city");
		exclusionFields.add("county");

		String advanceFilter = request.getParameter("advanceFilter");
		params = AdvanceFilterUtil.initSerachParams(advanceFilter, exclusionFields, "u.", params);

		PageHelper.startPage(new Integer(pageStr), new Integer(rowsStr));
		List<UserCustomerModel> userCustomers = userCustomerCustomService.findUserCustomers(params);
		PageInfo<UserCustomerModel> pageInfo = new PageInfo<UserCustomerModel>(userCustomers);

		List<Map<String, Object>> rows = new ArrayList<>();

		if (userCustomers != null && !userCustomers.isEmpty()) {
			Map<String, Object> item = null;

			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

			for (UserCustomerModel userCustomer : userCustomers) {
				item = new HashMap<>();
				item.put("id", userCustomer.getId());
				item.put("user_name", userCustomer.getUserName());
				item.put("phone_no", userCustomer.getPhoneNo());
				item.put("gender", userCustomer.getGender());
				item.put("age", userCustomer.getAge());

				item.put("province", baseDataCacheUtil.getCityName(userCustomer.getProvince()));
				item.put("city", baseDataCacheUtil.getCityName(userCustomer.getCity()));
				item.put("county", baseDataCacheUtil.getCityName(userCustomer.getCounty()));
				item.put("address_detail", userCustomer.getAddressDetail());

				item.put("customer_id", userCustomer.getCustomerId());
				item.put("company_id", userCustomer.getCompanyId());
				item.put("company_name", userCustomer.getCompanyName());
				item.put("industry", userCustomer.getIndustry());
				item.put("grade_level", userCustomer.getGradeLevel());
				item.put("bond_status", userCustomer.getBondStatus());

				item.put("account_status", userCustomer.getAccountStatus());
				item.put("regist_time", df.format(userCustomer.getRegistTime()));
				item.put("update_time", df.format(userCustomer.getUpdateTime()));
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
		ModelAndView mav = new ModelAndView("user/customer/form");
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/editForm" }, method = { RequestMethod.GET })
	public ModelAndView editForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/customer/editForm");
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/customerDetailForm" }, method = { RequestMethod.GET })
	public ModelAndView customerDetailForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/customer/customerDetailForm");
		return mav;
	}

	/***
	 * 客户详情
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/detail")
	public Map<String, Object> detail(HttpServletRequest request) {
		String id = request.getParameter("id");
		User user = userService.selectById(id);
		Map<String, Object> map = new HashMap<>();
		if (user == null) {
			return map;
		}

		Wrapper<UserCustomer> wrapper = new EntityWrapper<>();
		wrapper.eq("user_id", user.getId());
		UserCustomer userCustomer = userCustomerService.selectOne(wrapper);

		if (userCustomer == null) {
			return map;
		}
		map.put("id", user.getId());
		map.put("userName", user.getUserName());
		map.put("age", user.getAge());
		map.put("gender", user.getGender());
		map.put("phoneNo", user.getPhoneNo());
		map.put("addressDetail", user.getAddressDetail());
		map.put("accountStatus", user.getAccountStatus());
		map.put("partnerId", userCustomer.getId());
		return map;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/areaDetail")
	public Map<String, Object> areaDetail(HttpServletRequest request) {
		String id = request.getParameter("id");
		User user = userService.selectById(id);
		Map<String, Object> map = new HashMap<>();
		if (user == null) {
			return map;
		}

		map.put("id", user.getId());

		map.put("province", baseDataCacheUtil.getCityName(user.getProvince()));
		map.put("city", baseDataCacheUtil.getCityName(user.getCity()));
		map.put("county", baseDataCacheUtil.getCityName(user.getCounty()));

		return map;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/changeAreaForm" }, method = { RequestMethod.GET })
	public ModelAndView changeAreaForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/customer/changeAreaform");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/customerDetail")
	public Map<String, Object> customerDetail(HttpServletRequest request) {
		String id = request.getParameter("id");
		User user = userService.selectById(id);
		Map<String, Object> map = new HashMap<>();
		if (user == null) {
			return map;
		}

		Wrapper<UserCustomer> wrapper = new EntityWrapper<>();
		wrapper.eq("user_id", user.getId());
		UserCustomer userCustomer = userCustomerService.selectOne(wrapper);

		if (userCustomer == null) {
			return map;
		}
		map.put("id", user.getId());
		map.put("companyName", "");
		String companyId = userCustomer.getCompanyId();
		if (StringUtils.isNotBlank(companyId)) {
			Company company = companyService.selectById(companyId);
			if (company != null) {
				map.put("companyName", company.getName());
			}
		}

		map.put("industry", baseDataCacheUtil.getDictItemName(userCustomer.getIndustry()));
		map.put("gradeLevel", userCustomer.getGradeLevel());
		map.put("bondStatus", "Y".equals(userCustomer.getBondStatus()) ? "已缴纳" : "未缴纳");

		return map;
	}

	/***
	 * 保存客户
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

		User user = new User();
		user.setId(IdUtil.id());
		user.setUserName(request.getParameter("userName"));

		String phoneNo = request.getParameter("phoneNo");
		Wrapper<User> wrapper = new EntityWrapper<>();
		wrapper.eq("phone_no", phoneNo);
		if (null != userService.selectOne(wrapper)) {
			res.put("message", "当前手机号已存在");
			return res;
		}
		user.setHeadPicUrl("");
		user.setPhoneNo(phoneNo);
		user.setPassword("");
		user.setGender(1);
		user.setAge(0);
		user.setProvince("");
		user.setCity("");
		user.setCounty("");
		user.setAddressDetail("");
		user.setAccountStatus("Y");
		user.setUserType("C");
		Date now = new Date();
		user.setRegistTime(now);
		user.setUpdateTime(now);
		user.setDeleteFlag("N");
		user.setDeleteTime(now);

		if (!userService.insert(user)) {
			res.put("message", "未知错误");
			return res;
		}

		UserCustomer userCustomer = new UserCustomer();
		userCustomer.setId(IdUtil.id());
		userCustomer.setUserId(user.getId());
		userCustomer.setGradeLevel(new BigDecimal("3.0"));
		userCustomer.setCompanyId(request.getParameter("groupId"));
		userCustomer.setBondStatus("N");
		userCustomer.setIndustry(request.getParameter("industry"));
		userCustomer.setCreateTime(now);
		userCustomer.setUpdateTime(now);

		if (!userCustomerService.insert(userCustomer)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "保存成功");
		return res;
	}

	/***
	 * 更新客户
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/updateBase")
	public Map<String, Object> updateBase(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			res.put("message", "无效的参数");
			return res;
		}

		User user = userService.selectById(id);
		if (user == null) {
			res.put("message", "无效的参数");
			return res;
		}
		user.setUserName(request.getParameter("userName"));

		String phoneNo = request.getParameter("phoneNo");
		Wrapper<User> wrapper = new EntityWrapper<>();
		wrapper.eq("phone_no", phoneNo);
		User _user = userService.selectOne(wrapper);
		if (null != _user && !_user.getId().equals(id)) {
			res.put("message", "当前手机号已存在");
			return res;
		}
		user.setPhoneNo(phoneNo);
		user.setGender(new Integer(request.getParameter("gender")));
		user.setAge(new Integer(request.getParameter("age")));

		user.setAddressDetail(request.getParameter("addressDetail"));
		user.setAccountStatus(request.getParameter("accountStatus"));
		Date now = new Date();
		user.setUpdateTime(now);

		if (!userService.updateById(user)) {
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

		User user = userService.selectById(id);
		if (user == null) {
			res.put("message", "无效的参数");
			return res;
		}

		user.setProvince(request.getParameter("n-province"));
		user.setCity(request.getParameter("n-city"));
		user.setCounty(request.getParameter("n-county"));

		user.setUpdateTime(new Date());

		if (!userService.updateById(user)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

}
