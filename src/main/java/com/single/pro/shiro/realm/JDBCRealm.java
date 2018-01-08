package com.single.pro.shiro.realm;

import java.util.ArrayList;
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
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.single.pro.entity.Authorization;
import com.single.pro.entity.Role;
import com.single.pro.entity.RoleAuthorization;
import com.single.pro.entity.User;
import com.single.pro.service.AuthorizationService;
import com.single.pro.service.RoleAuthorizationService;
import com.single.pro.service.RoleService;
import com.single.pro.service.UserService;

public class JDBCRealm extends AuthorizingRealm {

	@Autowired
	UserService userService;
	@Autowired
	RoleService roleService;
	@Autowired
	AuthorizationService authorizationService;
	@Autowired
	RoleAuthorizationService roleAuthorizationService;

	/***
	 * 权限验证判断
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		// 登陆成功，记录Session
		Subject subject = SecurityUtils.getSubject();
		User user = (User) subject.getPrincipal();
		Role role = roleService.selectById(user.getRoleId());
		if ("Y".equals(role.getStatus())) {
			Set<String> roleCodes = new HashSet<String>();
			roleCodes.add(role.getCode());
			authorizationInfo.setRoles(roleCodes);

			RoleAuthorization entity = new RoleAuthorization();
			entity.setRoleId(role.getId());
			Wrapper<RoleAuthorization> wrapper = new EntityWrapper<RoleAuthorization>(entity);
			List<RoleAuthorization> roleAuths = roleAuthorizationService.selectList(wrapper);

			if (roleAuths != null && !roleAuths.isEmpty()) {
				List<Integer> authIds = new ArrayList<>();
				for (RoleAuthorization ra : roleAuths) {
					authIds.add(ra.getAuthwordId());
				}
				// 查询角色授权
				List<Authorization> auths = authorizationService.selectBatchIds(authIds);
				if (auths != null && !auths.isEmpty()) {
					Set<String> permissions = new HashSet<>();
					for (Authorization a : auths) {
						permissions.add(a.getCode());
					}
					authorizationInfo.setStringPermissions(permissions);
				}
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

		User entity = new User();
		entity.setLoginName(loginName);
		Wrapper<User> wrapper = new EntityWrapper<User>(entity);
		User user = userService.selectOne(wrapper);
		if (user == null) {
			// 未知账号
			throw new UnknownAccountException();
		}
		if ("L".equals(user.getStatus())) {
			// 账号锁定
			throw new LockedAccountException();
		}
		if ("D".equals(user.getStatus())) {
			// 账号禁用
			throw new DisabledAccountException();
		}
		String password = String.valueOf(upToken.getPassword());
		if (!user.getPassword().equals(password)) {
			// 登陆密码错误
			throw new IncorrectCredentialsException();
		}
		user.setLastLoginTime(new Date());
		if (!userService.updateById(user)) {
			// 未知账号
			throw new RuntimeException();
		}
		return new SimpleAuthenticationInfo(user, password.toCharArray(), getName());
	}

}
