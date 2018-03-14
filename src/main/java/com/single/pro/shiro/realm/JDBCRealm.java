package com.single.pro.shiro.realm;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.single.pro.entity.Role;
import com.single.pro.entity.RoleApp;
import com.single.pro.entity.RoleAuthword;
import com.single.pro.entity.RoleMenu;
import com.single.pro.entity.SystemUser;
import com.single.pro.service.RoleAppService;
import com.single.pro.service.RoleAuthwordService;
import com.single.pro.service.RoleMenuService;
import com.single.pro.service.RoleService;
import com.single.pro.service.SystemAuthwordService;
import com.single.pro.service.SystemUserService;

public class JDBCRealm extends AuthorizingRealm {

	public static final String USER_ROLE_APP_AUTH_KEY = "current_user_role_apps";
	public static final String USER_ROLE_MENU_AUTH_KEY = "current_user_role_menus";

	@Autowired
	SystemUserService systemUserService;
	@Autowired
	RoleService roleService;
	@Autowired
	SystemAuthwordService systemAuthwordService;
	@Autowired
	RoleAuthwordService roleAuthwordService;
	@Autowired
	RoleAppService roleAppService;
	@Autowired
	RoleMenuService roleMenuService;

	/***
	 * 权限验证判断
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		// 登陆成功，记录Session
		Subject subject = SecurityUtils.getSubject();
		SystemUser user = (SystemUser) subject.getPrincipal();

		Role role = roleService.selectById(user.getRoleId());
		if ("Y".equals(role.getStatus())) {

			// 获取角色授权
			Set<String> roleCodes = new HashSet<String>();
			roleCodes.add(role.getCode());
			authorizationInfo.setRoles(roleCodes);

			Wrapper<RoleAuthword> roleAuthwordWrapper = new EntityWrapper<RoleAuthword>();
			roleAuthwordWrapper.eq("role_id", role.getId());
			List<RoleAuthword> roleAuths = roleAuthwordService.selectList(roleAuthwordWrapper);

			if (roleAuths != null && !roleAuths.isEmpty()) {
				Set<String> permissions = new HashSet<>();
				for (RoleAuthword ra : roleAuths) {
					permissions.add(ra.getAuthword());
				}
				authorizationInfo.setStringPermissions(permissions);
			}
		}

		return authorizationInfo;
	}

	/**
	 * 登陆检查判断
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
			throws AuthenticationException {
		// token中储存着输入的用户名和密码
		UsernamePasswordToken upToken = (UsernamePasswordToken) authenticationToken;
		String loginName = upToken.getUsername();

		SystemUser entity = new SystemUser();
		entity.setLoginName(loginName);
		Wrapper<SystemUser> wrapper = new EntityWrapper<SystemUser>(entity);
		SystemUser user = systemUserService.selectOne(wrapper);
		if (user == null) {
			// 未知账号
			throw new UnknownAccountException();
		}
		if ("L".equals(user.getStatus())) {
			// 账号锁定
			throw new LockedAccountException();
		}
		if ("N".equals(user.getStatus())) {
			// 账号禁用
			throw new DisabledAccountException();
		}
		String password = String.valueOf(upToken.getPassword());
		if (!user.getPassword().equals(password)) {
			// 登陆密码错误
			throw new IncorrectCredentialsException();
		}
		user.setLastLoginTime(new Date());
		if (!systemUserService.updateById(user)) {
			// 未知账号
			throw new RuntimeException();
		}

		Role role = roleService.selectById(user.getRoleId());
		if ("Y".equals(role.getStatus())) {

			// 获取角色授权
			Wrapper<RoleApp> roleAppWrapper = new EntityWrapper<>();
			roleAppWrapper.eq("role_id", role.getId());
			List<RoleApp> roleApps = roleAppService.selectList(roleAppWrapper);
			Subject subject = SecurityUtils.getSubject();

			// 授权应用
			if (roleApps != null && !roleApps.isEmpty()) {
				Session session = subject.getSession();

				session.setAttribute(USER_ROLE_APP_AUTH_KEY, roleApps);

				Wrapper<RoleMenu> roleMenuWrapper = new EntityWrapper<>();
				roleMenuWrapper.eq("role_id", role.getId());
				List<RoleMenu> roleMenus = roleMenuService.selectList(roleMenuWrapper);

				// 授权菜单
				if (roleMenus != null && !roleMenus.isEmpty()) {

					Set<String> menuIds = new HashSet<>();
					for (RoleMenu menu : roleMenus) {
						menuIds.add(menu.getMenuId());
					}
					session.setAttribute(USER_ROLE_MENU_AUTH_KEY, menuIds);

				}

			}
		}

		return new SimpleAuthenticationInfo(user, password.toCharArray(), getName());
	}

}
