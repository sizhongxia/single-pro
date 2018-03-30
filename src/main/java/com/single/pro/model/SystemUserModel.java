package com.single.pro.model;

import java.io.Serializable;
import java.util.Date;

public class SystemUserModel implements Serializable {
	private static final long serialVersionUID = 1L;
	private String id;
	private String nickName;
	private String loginName;
	private String phoneNo;
	private String password;
	private String info;
	private String status;
	private Date createTime;
	private Date updateTime;
	private Date lastLoginTime;

	private String roleNames;

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

	public String getRoleNames() {
		return roleNames;
	}

	public void setRoleNames(String roleNames) {
		this.roleNames = roleNames;
	}

	@Override
	public String toString() {
		return "SystemUserModel [id=" + id + ", nickName=" + nickName + ", loginName=" + loginName + ", phoneNo="
				+ phoneNo + ", password=" + password + ", info=" + info + ", status=" + status + ", createTime="
				+ createTime + ", updateTime=" + updateTime + ", lastLoginTime=" + lastLoginTime + ", roleNames="
				+ roleNames + "]";
	}

}
