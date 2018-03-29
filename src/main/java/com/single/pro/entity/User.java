package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 用户基础信息表
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_user")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
	private String id;
	@TableField("user_name")
	private String userName;
	@TableField("head_pic_url")
	private String headPicUrl;
	@TableField("phone_no")
	private String phoneNo;
	private String password;
    /**
     * 性别（1:男，0:女）
     */
	private Integer gender;
    /**
     * 年龄
     */
	private Integer age;
    /**
     * 省
     */
	private String province;
    /**
     * 市
     */
	private String city;
    /**
     * 区县
     */
	private String county;
    /**
     * 详细地址
     */
	@TableField("address_detail")
	private String addressDetail;
    /**
     * 账号状态（Y:正常，N:禁用）
     */
	@TableField("account_status")
	private String accountStatus;
    /**
     * 用户类别（P:城市合伙人，W:劳务工人，C:客户）
     */
	@TableField("user_type")
	private String userType;
    /**
     * 注册时间
     */
	@TableField("regist_time")
	private Date registTime;
    /**
     * 最后修改时间
     */
	@TableField("update_time")
	private Date updateTime;
    /**
     * 账号状态（Y:已移除，N:未移除）
     */
	@TableField("delete_flag")
	private String deleteFlag;
    /**
     * 移除时间
     */
	@TableField("delete_time")
	private Date deleteTime;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getHeadPicUrl() {
		return headPicUrl;
	}

	public void setHeadPicUrl(String headPicUrl) {
		this.headPicUrl = headPicUrl;
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

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getAccountStatus() {
		return accountStatus;
	}

	public void setAccountStatus(String accountStatus) {
		this.accountStatus = accountStatus;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Date getRegistTime() {
		return registTime;
	}

	public void setRegistTime(Date registTime) {
		this.registTime = registTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public Date getDeleteTime() {
		return deleteTime;
	}

	public void setDeleteTime(Date deleteTime) {
		this.deleteTime = deleteTime;
	}

	@Override
	public String toString() {
		return "User{" +
			", id=" + id +
			", userName=" + userName +
			", headPicUrl=" + headPicUrl +
			", phoneNo=" + phoneNo +
			", password=" + password +
			", gender=" + gender +
			", age=" + age +
			", province=" + province +
			", city=" + city +
			", county=" + county +
			", addressDetail=" + addressDetail +
			", accountStatus=" + accountStatus +
			", userType=" + userType +
			", registTime=" + registTime +
			", updateTime=" + updateTime +
			", deleteFlag=" + deleteFlag +
			", deleteTime=" + deleteTime +
			"}";
	}
}
