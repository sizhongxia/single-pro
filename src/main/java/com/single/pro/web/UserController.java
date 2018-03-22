package com.single.pro.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.single.pro.entity.SystemUser;
import com.single.pro.service.SystemUserService;
import com.single.pro.util.IdUtil;
import com.single.pro.util.Md5Util;

@Controller
@RequestMapping("user")
public class UserController extends BaseController {

	@Autowired
	SystemUserService systemUserService;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/index");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/list" }, method = { RequestMethod.POST })
	public Map<String, Object> list(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		List<Map<String, Object>> systemUserList = new ArrayList<>();

		Wrapper<SystemUser> wrapper = new EntityWrapper<>();

		String roleId = request.getParameter("role_id");
		
		if (StringUtils.isBlank(roleId)) {
			res.put("rows", systemUserList);
			res.put("total", 0);
			return res;
		}

		wrapper.eq("role_id", roleId);

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

		if (StringUtils.isNotBlank(sort) && StringUtils.isNotBlank(order)) {
			wrapper.orderBy(sort, "asc".equals(order));
		}

		PageHelper.startPage(new Integer(pageStr), new Integer(rowsStr));
		List<SystemUser> users = systemUserService.selectList(wrapper);
		PageInfo<SystemUser> pageInfo = new PageInfo<SystemUser>(users);

		if (users != null && !users.isEmpty()) {
			Map<String, Object> item = null;
			for (SystemUser user : users) {
				item = new HashMap<>();
				item.put("id", user.getId());
				item.put("nick_name", user.getNickName());
				item.put("login_name", user.getLoginName());
				item.put("phone_no", user.getPhoneNo());
				item.put("password", user.getPassword());
				item.put("role_id", user.getRoleId());
				item.put("info", user.getInfo());
				item.put("status", user.getStatus());
				item.put("create_time", user.getCreateTime());
				item.put("update_time", user.getUpdateTime());
				item.put("last_login_time", user.getLastLoginTime());
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
		ModelAndView mav = new ModelAndView("user/form");
		return mav;
	}

	/***
	 * 用户详情
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/detail")
	public SystemUser detail(HttpServletRequest request) {
		SystemUser user = null;

		String id = request.getParameter("id");

		user = systemUserService.selectById(id);
		if (user == null) {
			user = new SystemUser();
		}
		return user;
	}

	/***
	 * 保存用户
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

		SystemUser user = new SystemUser();
		user.setId(IdUtil.id());
		user.setNickName(request.getParameter("nickName"));

		String loginName = request.getParameter("loginName");
		Wrapper<SystemUser> wrapper = new EntityWrapper<>();
		wrapper.eq("login_name", loginName);
		if (null != systemUserService.selectOne(wrapper)) {
			res.put("message", "当前登录名已存在");
			return res;
		}
		user.setLoginName(loginName);
		String phoneNo = request.getParameter("phoneNo");
		wrapper = new EntityWrapper<>();
		wrapper.eq("phone_no", phoneNo);
		if (null != systemUserService.selectOne(wrapper)) {
			res.put("message", "当前手机号已存在");
			return res;
		}
		user.setPhoneNo(phoneNo);
		user.setRoleId(request.getParameter("roleId"));
		user.setPassword(Md5Util.md5(request.getParameter("password")));
		user.setStatus(request.getParameter("status"));
		user.setInfo(request.getParameter("info"));
		Date now = new Date();
		user.setCreateTime(now);
		user.setUpdateTime(now);
		user.setLastLoginTime(now);

		if (!systemUserService.insert(user)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "保存成功");
		return res;
	}

	/***
	 * 更新用户
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

		SystemUser user = systemUserService.selectById(id);
		if (user == null) {
			res.put("message", "无效的参数");
			return res;
		}
		user.setNickName(request.getParameter("nickName"));
		String loginName = request.getParameter("loginName");
		Wrapper<SystemUser> wrapper = new EntityWrapper<>();
		wrapper.eq("login_name", loginName);
		SystemUser u1 = systemUserService.selectOne(wrapper);
		if (null != u1 && !u1.getId().equals(user.getId())) {
			res.put("message", "当前登录名已存在");
			return res;
		}
		user.setLoginName(loginName);
		String phoneNo = request.getParameter("phoneNo");
		wrapper = new EntityWrapper<>();
		wrapper.eq("phone_no", phoneNo);
		SystemUser u2 = systemUserService.selectOne(wrapper);
		if (null != u2 && !u2.getId().equals(user.getId())) {
			res.put("message", "当前手机号已存在");
			return res;
		}
		user.setPhoneNo(phoneNo);
		user.setRoleId(request.getParameter("roleId"));
		String nPassword = request.getParameter("password");
		if (!nPassword.equals(user.getPassword())) {
			user.setPassword(Md5Util.md5(nPassword));
		}
		user.setStatus(request.getParameter("status"));
		user.setInfo(request.getParameter("info"));
		user.setUpdateTime(new Date());

		if (!systemUserService.updateById(user)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/changePwd" }, method = { RequestMethod.GET })
	public ModelAndView changePwd(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/changePwd");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/updatePwd" }, method = { RequestMethod.POST })
	public Map<String, Object> updatePwd(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		String opassword = request.getParameter("opassword");
		if (StringUtils.isBlank(opassword)) {
			res.put("statusCode", -1);
			res.put("errMsg", "请输入原始密码");
			return res;
		}
		String password = request.getParameter("password");
		if (StringUtils.isBlank(password)) {
			res.put("statusCode", -1);
			res.put("errMsg", "请输入新密码");
			return res;
		}
		String password2 = request.getParameter("password2");
		if (!password.equals(password2)) {
			res.put("statusCode", -1);
			res.put("errMsg", "两次密码输入不一致");
			return res;
		}

		String pwd = Md5Util.md5(opassword);

		Subject subject = SecurityUtils.getSubject();
		SystemUser user = (SystemUser) subject.getPrincipal();

		user = systemUserService.selectById(user.getId());
		if (!user.getPassword().equals(pwd)) {
			res.put("statusCode", -1);
			res.put("errMsg", "无效的原密码");
			return res;
		}

		String newPwd = Md5Util.md5(password);
		if (newPwd.equals(pwd)) {
			res.put("statusCode", 0);
			return res;
		}

		user.setPassword(Md5Util.md5(password));

		if (!systemUserService.updateById(user)) {
			res.put("statusCode", -1);
			res.put("errMsg", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		return res;
	}

}
