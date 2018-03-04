package com.single.pro.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * <p>
 * 角色权限字授权
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-01
 */
@TableName("sp_role_authword")
public class RoleAuthword implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 角色ID
     */
    @TableField("role_id")
	private String roleId;
    /**
     * 权限关联
     */
	private String authword;
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

	public String getAuthword() {
		return authword;
	}

	public void setAuthword(String authword) {
		this.authword = authword;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "RoleAuthword{" +
			", roleId=" + roleId +
			", authword=" + authword +
			", createTime=" + createTime +
			"}";
	}
}
