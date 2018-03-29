package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 系统用户登陆记录表
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_login_log")
public class LoginLog implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 登陆名称
     */
	@TableField("login_name")
	private String loginName;
    /**
     * 客户端IP
     */
	@TableField("client_ip")
	private String clientIp;
    /**
     * 用户标识
     */
	@TableField("user_agent")
	private String userAgent;
    /**
     * 登陆状态（Y:登陆成功，N:登陆失败）
     */
	@TableField("login_status")
	private String loginStatus;
    /**
     * 登陆结果信息
     */
	@TableField("login_result")
	private String loginResult;
    /**
     * 登陆成功后的用户ID
     */
	@TableField("user_id")
	private String userId;
    /**
     * 登陆时间
     */
	@TableField("login_time")
	private Date loginTime;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getClientIp() {
		return clientIp;
	}

	public void setClientIp(String clientIp) {
		this.clientIp = clientIp;
	}

	public String getUserAgent() {
		return userAgent;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}

	public String getLoginStatus() {
		return loginStatus;
	}

	public void setLoginStatus(String loginStatus) {
		this.loginStatus = loginStatus;
	}

	public String getLoginResult() {
		return loginResult;
	}

	public void setLoginResult(String loginResult) {
		this.loginResult = loginResult;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	@Override
	public String toString() {
		return "LoginLog{" +
			", id=" + id +
			", loginName=" + loginName +
			", clientIp=" + clientIp +
			", userAgent=" + userAgent +
			", loginStatus=" + loginStatus +
			", loginResult=" + loginResult +
			", userId=" + userId +
			", loginTime=" + loginTime +
			"}";
	}
}
