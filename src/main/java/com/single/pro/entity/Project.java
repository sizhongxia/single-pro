package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 施工项目表
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_project")
public class Project implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 项目名称
     */
	private String name;
	private String pinyin;
    /**
     * 项目类别
     */
	private String type;
    /**
     * 省
     */
	private String provincial;
    /**
     * 市
     */
	private String city;
    /**
     * 区县
     */
	private String country;
    /**
     * 详细地址
     */
	private String address;
    /**
     * 经度
     */
	private String longitude;
    /**
     * 纬度
     */
	private String latitude;
    /**
     * 建筑面积
     */
	@TableField("covered_area")
	private String coveredArea;
    /**
     * 劳务人数
     */
	@TableField("worker_num")
	private Integer workerNum;
    /**
     * 所属组织公司
     */
	@TableField("company_id")
	private String companyId;
    /**
     * 分公司
     */
	@TableField("branch_company_id")
	private String branchCompanyId;
    /**
     * 联系人
     */
	private String contacts;
    /**
     * 联系电话
     */
	@TableField("contact_tel")
	private String contactTel;
    /**
     * 备注
     */
	private String remarks;
    /**
     * 创建人
     */
	@TableField("create_user_id")
	private String createUserId;
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


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPinyin() {
		return pinyin;
	}

	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getProvincial() {
		return provincial;
	}

	public void setProvincial(String provincial) {
		this.provincial = provincial;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getCoveredArea() {
		return coveredArea;
	}

	public void setCoveredArea(String coveredArea) {
		this.coveredArea = coveredArea;
	}

	public Integer getWorkerNum() {
		return workerNum;
	}

	public void setWorkerNum(Integer workerNum) {
		this.workerNum = workerNum;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getBranchCompanyId() {
		return branchCompanyId;
	}

	public void setBranchCompanyId(String branchCompanyId) {
		this.branchCompanyId = branchCompanyId;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getContactTel() {
		return contactTel;
	}

	public void setContactTel(String contactTel) {
		this.contactTel = contactTel;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
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

	@Override
	public String toString() {
		return "Project{" +
			", id=" + id +
			", name=" + name +
			", pinyin=" + pinyin +
			", type=" + type +
			", provincial=" + provincial +
			", city=" + city +
			", country=" + country +
			", address=" + address +
			", longitude=" + longitude +
			", latitude=" + latitude +
			", coveredArea=" + coveredArea +
			", workerNum=" + workerNum +
			", companyId=" + companyId +
			", branchCompanyId=" + branchCompanyId +
			", contacts=" + contacts +
			", contactTel=" + contactTel +
			", remarks=" + remarks +
			", createUserId=" + createUserId +
			", createTime=" + createTime +
			", updateTime=" + updateTime +
			"}";
	}
}
