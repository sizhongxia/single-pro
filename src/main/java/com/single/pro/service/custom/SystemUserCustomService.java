package com.single.pro.service.custom;

import java.util.List;
import java.util.Map;

import com.single.pro.model.SystemUserModel;

/**
 * <p>
 * 系统用户自定义接口
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
public interface SystemUserCustomService {

	/***
	 *
	 * @param loginName
	 * @param phoneNo
	 * @param status
	 * @param orderByClause
	 * 
	 * 
	 * @return
	 */
	List<SystemUserModel> findSystemUsersWithRole(Map<String, Object> params);

}
