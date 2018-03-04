package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 系统用户
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-01
 */
@TableName("sp_system_user")
public class SystemUser implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.INPUT)
	private String id;
    /**
     * 用户名称
     */
	@TableField("nick_name")
	private String nickName;
    /**
     * 登录名称（唯一）
     */
	@TableField("login_name")
	private String loginName;
    /**
     * 手机号
     */
	@TableField("phone_no")
	private String phoneNo;
    /**
     * 登录密码
     */
	private String password;
    /**
     * 关联角色
     */
	@TableField("role_id")
	private String roleId;
    /**
     * 备注
     */
	private String info;
    /**
     * 状态（Y:正常，L:锁定，N:禁用）
     */
	private String status;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 最后修改时间
     */
	@TableField("update_time")
	private Date updateTime;
    /**
     * 最后登录时间
     */
	@TableField("last_login_time")
	private Date lastLoginTime;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	@Override
	public String toString() {
		return "SystemUser{" +
			", id=" + id +
			", nickName=" + nickName +
			", loginName=" + loginName +
			", phoneNo=" + phoneNo +
			", password=" + password +
			", roleId=" + roleId +
			", info=" + info +
			", status=" + status +
			", createTime=" + createTime +
			", updateTime=" + updateTime +
			", lastLoginTime=" + lastLoginTime +
			"}";
	}
}
