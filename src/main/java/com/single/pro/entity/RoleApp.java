package com.single.pro.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * <p>
 * 角色系统应用授权
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-01
 */
@TableName("sp_role_app")
public class RoleApp implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 角色ID
     */
	@TableField("role_id")
	private String roleId;
    /**
     * 系统应用关联
     */
	@TableField("app_id")
	private String appId;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;


	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "RoleApp{" +
			", roleId=" + roleId +
			", appId=" + appId +
			", createTime=" + createTime +
			"}";
	}
}
