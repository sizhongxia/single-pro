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
import com.single.pro.entity.User;
import com.single.pro.entity.UserWorker;
import com.single.pro.model.UserWorkerModel;
import com.single.pro.service.UserService;
import com.single.pro.service.UserWorkerService;
import com.single.pro.service.custom.UserWorkerCustomService;
import com.single.pro.util.AdvanceFilterUtil;
import com.single.pro.util.IdUtil;
import com.xiaoleilu.hutool.util.RandomUtil;

@Controller
@RequestMapping("user/worker")
public class UserWorkerController extends BaseController {

	@Autowired
	UserWorkerCustomService userWorkerCustomService;
	@Autowired
	UserService userService;
	@Autowired
	UserWorkerService userWorkerService;
	@Autowired
	BaseDataCacheUtil baseDataCacheUtil;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/worker/index");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/list" }, method = { RequestMethod.POST })
	public Map<String, Object> list(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		List<Map<String, Object>> systemUserList = new ArrayList<>();

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
		exclusionFields.add("worker_no");
		exclusionFields.add("grade_level");
		exclusionFields.add("bond_status");
		exclusionFields.add("balance");
		exclusionFields.add("remarks");
		exclusionFields.add("last_order_time");
		exclusionFields.add("province");
		exclusionFields.add("city");
		exclusionFields.add("county");

		String advanceFilter = request.getParameter("advanceFilter");
		params = AdvanceFilterUtil.initSerachParams(advanceFilter, exclusionFields, "u.", params);

		PageHelper.startPage(new Integer(pageStr), new Integer(rowsStr));
		List<UserWorkerModel> userWorkers = userWorkerCustomService.findUserWorkers(params);
		PageInfo<UserWorkerModel> pageInfo = new PageInfo<UserWorkerModel>(userWorkers);

		if (userWorkers != null && !userWorkers.isEmpty()) {
			Map<String, Object> item = null;

			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

			for (UserWorkerModel userWorker : userWorkers) {
				item = new HashMap<>();
				item.put("id", userWorker.getId());
				item.put("user_name", userWorker.getUserName());
				item.put("phone_no", userWorker.getPhoneNo());
				item.put("gender", userWorker.getGender());
				item.put("age", userWorker.getAge());

				item.put("province", baseDataCacheUtil.getCityName(userWorker.getProvince()));
				item.put("city", baseDataCacheUtil.getCityName(userWorker.getCity()));
				item.put("county", baseDataCacheUtil.getCityName(userWorker.getCounty()));
				item.put("address_detail", userWorker.getAddressDetail());

				item.put("grade_level", userWorker.getGradeLevel());
				item.put("worker_no", userWorker.getWorkerNo());
				item.put("bond_status", userWorker.getBondStatus());

				item.put("account_status", userWorker.getAccountStatus());
				item.put("regist_time", df.format(userWorker.getRegistTime()));
				item.put("update_time", df.format(userWorker.getUpdateTime()));
				systemUserList.add(item);
			}
		}

		res.put("rows", systemUserList);

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
		ModelAndView mav = new ModelAndView("user/worker/form");
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/editForm" }, method = { RequestMethod.GET })
	public ModelAndView editForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/worker/editForm");
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/changeAreaForm" }, method = { RequestMethod.GET })
	public ModelAndView changeAreaForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/worker/changeAreaform");
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

		Wrapper<UserWorker> wrapper = new EntityWrapper<>();
		wrapper.eq("user_id", user.getId());
		UserWorker userWorker = userWorkerService.selectOne(wrapper);

		if (userWorker == null) {
			return map;
		}
		map.put("id", user.getId());
		map.put("userName", user.getUserName());
		map.put("age", user.getAge());
		map.put("gender", user.getGender());
		map.put("phoneNo", user.getPhoneNo());
		map.put("addressDetail", user.getAddressDetail());
		map.put("accountStatus", user.getAccountStatus());
		map.put("workerId", userWorker.getId());
		map.put("remarks", userWorker.getRemarks());
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

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/apllyDetail")
	public Map<String, Object> apllyDetail(HttpServletRequest request) {
		String id = request.getParameter("id");
		User user = userService.selectById(id);
		Map<String, Object> map = new HashMap<>();
		if (user == null) {
			return map;
		}

		Wrapper<UserWorker> wrapper = new EntityWrapper<>();
		wrapper.eq("user_id", user.getId());
		UserWorker userWorker = userWorkerService.selectOne(wrapper);

		if (userWorker == null) {
			return map;
		}
		map.put("id", user.getId());

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
		user.setProvince(request.getParameter("province"));
		user.setCity(request.getParameter("city"));
		user.setCounty(request.getParameter("county"));
		user.setAddressDetail("");
		user.setAccountStatus("Y");
		user.setUserType("P");
		Date now = new Date();
		user.setRegistTime(now);
		user.setUpdateTime(now);
		user.setDeleteFlag("N");
		user.setDeleteTime(now);

		if (!userService.insert(user)) {
			res.put("message", "未知错误");
			return res;
		}

		UserWorker userWorker = new UserWorker();
		userWorker.setId(IdUtil.id());
		int workerNo = 0;
		Wrapper<UserWorker> userWorkerWrapper = null;
		while (true) {
			workerNo = RandomUtil.randomInt(100001, 999999);
			userWorkerWrapper = new EntityWrapper<>();
			userWorkerWrapper.eq("worker_no", workerNo);
			if (userWorkerService.selectOne(userWorkerWrapper) == null) {
				break;
			}
		}
		userWorker.setId(IdUtil.id());
		userWorker.setWorkerNo(workerNo);
		userWorker.setUserId(user.getId());
		userWorker.setBondStatus("N");
		userWorker.setBalance(new BigDecimal(0));
		userWorker.setGradeLevel(new BigDecimal(3));
		userWorker.setRemarks("");
		userWorker.setLastOrderTime(null);
		userWorker.setCreateTime(now);
		userWorker.setUpdateTime(now);

		if (!userWorkerService.insert(userWorker)) {
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

		UserWorker userWorker = userWorkerService.selectById(request.getParameter("workerId"));
		if (userWorker == null) {
			res.put("message", "无效的合作伙伴ID");
			return res;
		}
		String remarks = request.getParameter("remarks");
		if (StringUtils.isBlank(remarks)) {
			remarks = "";
		}
		userWorker.setRemarks(remarks);
		userWorker.setUpdateTime(now);

		if (!userWorkerService.updateById(userWorker)) {
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
