package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 用户oAuth验证登录
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_user_wxoauth")
public class UserWxoauth implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
	private String id;
    /**
     * 用户ID
     */
	@TableField("user_id")
	private String userId;
    /**
     * 微信OPENID
     */
	@TableField("open_id")
	private String openId;
    /**
     * 微信昵称
     */
	@TableField("nick_name")
	private String nickName;
    /**
     * 头像
     */
	@TableField("avatar_url")
	private String avatarUrl;
    /**
     * 性别
     */
	private Integer gender;
    /**
     * 所在城市
     */
	private String city;
    /**
     * 国家
     */
	private String country;
    /**
     * 状态（Y:正常，N:取消绑定）
     */
	private String status;
    /**
     * 关联时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 取消绑定时间
     */
	@TableField("unbind_time")
	private Date unbindTime;
    /**
     * 最后修改时间
     */
	@TableField("update_time")
	private Date updateTime;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getAvatarUrl() {
		return avatarUrl;
	}

	public void setAvatarUrl(String avatarUrl) {
		this.avatarUrl = avatarUrl;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
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

	public Date getUnbindTime() {
		return unbindTime;
	}

	public void setUnbindTime(Date unbindTime) {
		this.unbindTime = unbindTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	public String toString() {
		return "UserWxoauth{" +
			", id=" + id +
			", userId=" + userId +
			", openId=" + openId +
			", nickName=" + nickName +
			", avatarUrl=" + avatarUrl +
			", gender=" + gender +
			", city=" + city +
			", country=" + country +
			", status=" + status +
			", createTime=" + createTime +
			", unbindTime=" + unbindTime +
			", updateTime=" + updateTime +
			"}";
	}
}
