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
import com.single.pro.entity.UserPartner;
import com.single.pro.entity.UserWxoauth;
import com.single.pro.model.UserPartnerModel;
import com.single.pro.service.UserPartnerService;
import com.single.pro.service.UserService;
import com.single.pro.service.UserWxoauthService;
import com.single.pro.service.custom.UserPartnerCustomService;
import com.single.pro.util.AdvanceFilterUtil;
import com.single.pro.util.IdUtil;

@Controller
@RequestMapping("user/partner")
public class UserPartnerController extends BaseController {

	@Autowired
	UserPartnerCustomService userPartnerCustomService;
	@Autowired
	UserService userService;
	@Autowired
	UserPartnerService userPartnerService;
	@Autowired
	UserWxoauthService userWxoauthService;
	@Autowired
	BaseDataCacheUtil baseDataCacheUtil;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/partner/index");
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
		List<UserPartnerModel> userPartners = userPartnerCustomService.findUserPartners(params);
		PageInfo<UserPartnerModel> pageInfo = new PageInfo<UserPartnerModel>(userPartners);

		if (userPartners != null && !userPartners.isEmpty()) {
			Map<String, Object> item = null;

			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

			for (UserPartnerModel userPartner : userPartners) {
				item = new HashMap<>();
				item.put("id", userPartner.getId());
				item.put("user_name", userPartner.getUserName());
				item.put("phone_no", userPartner.getPhoneNo());
				item.put("gender", userPartner.getGender());
				item.put("age", userPartner.getAge());

				item.put("province", baseDataCacheUtil.getCityName(userPartner.getProvince()));
				item.put("city", baseDataCacheUtil.getCityName(userPartner.getCity()));
				item.put("county", baseDataCacheUtil.getCityName(userPartner.getCounty()));
				item.put("address_detail", userPartner.getAddressDetail());

				item.put("is_platform", userPartner.getIsPlatform());
				item.put("apply_status", userPartner.getApplyStatus());
				item.put("apply_time", df.format(userPartner.getApplyTime()));
				item.put("apply_reason", userPartner.getApplyReason());
				item.put("account_status", userPartner.getAccountStatus());
				item.put("regist_time", df.format(userPartner.getRegistTime()));
				item.put("update_time", df.format(userPartner.getUpdateTime()));
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
		ModelAndView mav = new ModelAndView("user/partner/form");
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/editForm" }, method = { RequestMethod.GET })
	public ModelAndView editForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/partner/editForm");
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/changeAreaForm" }, method = { RequestMethod.GET })
	public ModelAndView changeAreaForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/partner/changeAreaForm");
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/applyDetailForm" }, method = { RequestMethod.GET })
	public ModelAndView applyDetailForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/partner/applyDetailForm");
		return mav;
	}
	
	@RequiresAuthentication
	@RequestMapping(value = { "/wechatDetailForm" }, method = { RequestMethod.GET })
	public ModelAndView wechatDetailForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/partner/wechatDetailForm");
		return mav;
	}

	/***
	 * 合伙人详情
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

		Wrapper<UserPartner> wrapper = new EntityWrapper<>();
		wrapper.eq("user_id", user.getId());
		UserPartner userPartner = userPartnerService.selectOne(wrapper);

		if (userPartner == null) {
			return map;
		}
		map.put("id", user.getId());
		map.put("userName", user.getUserName());
		map.put("age", user.getAge());
		map.put("gender", user.getGender());
		map.put("phoneNo", user.getPhoneNo());
		map.put("addressDetail", user.getAddressDetail());
		map.put("accountStatus", user.getAccountStatus());
		map.put("partnerId", userPartner.getId());
		map.put("isPlatform", userPartner.getIsPlatform());
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
	@RequestMapping(value = "/wechatDetail")
	public Map<String, Object> wechatDetail(HttpServletRequest request) {
		String id = request.getParameter("id");
		User user = userService.selectById(id);
		Map<String, Object> map = new HashMap<>();
		if (user == null) {
			return map;
		}

		Wrapper<UserWxoauth> wrapper = new EntityWrapper<>();
		wrapper.eq("user_id", user.getId());
		UserWxoauth userWxoauth = userWxoauthService.selectOne(wrapper);

		if (userWxoauth == null) {
			map.put("openId", "暂未绑定");
			return map;
		}
		map.put("openId", userWxoauth.getOpenId());
		map.put("nickName", userWxoauth.getNickName());
		map.put("avatarUrl", userWxoauth.getAvatarUrl());
		map.put("gender", userWxoauth.getGender());
		map.put("city", userWxoauth.getCity());
		map.put("country", userWxoauth.getCountry());
		map.put("status", userWxoauth.getStatus());
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		map.put("createTime", df.format(userWxoauth.getCreateTime()));
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

		Wrapper<UserPartner> wrapper = new EntityWrapper<>();
		wrapper.eq("user_id", user.getId());
		UserPartner userPartner = userPartnerService.selectOne(wrapper);

		if (userPartner == null) {
			return map;
		}
		map.put("id", user.getId());

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		map.put("applyTime", df.format(userPartner.getApplyTime()));
		map.put("applyReason", userPartner.getApplyReason());

		return map;
	}

	/***
	 * 保存合伙人
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

		UserPartner userPartner = new UserPartner();
		userPartner.setId(IdUtil.id());
		userPartner.setUserId(user.getId());
		userPartner.setIsPlatform(request.getParameter("isPlatform"));
		userPartner.setApplyReason(request.getParameter("applyReason"));
		userPartner.setApplyTime(now);
		userPartner.setApplyStatus("D");
		userPartner.setCreateTime(now);
		userPartner.setUpdateTime(now);

		if (!userPartnerService.insert(userPartner)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "保存成功");
		return res;
	}

	/***
	 * 更新合伙人
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

		UserPartner userPartner = userPartnerService.selectById(request.getParameter("partnerId"));
		if (userPartner == null) {
			res.put("message", "无效的合作伙伴ID");
			return res;
		}
		userPartner.setIsPlatform(request.getParameter("isPlatform"));
		userPartner.setUpdateTime(now);

		if (!userPartnerService.updateById(userPartner)) {
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
