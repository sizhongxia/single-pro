package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 公司、企业基础信息表
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_company")
public class Company implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	private String id;
	/**
	 * 公司名称
	 */
	private String name;
	/**
	 * 名称拼音
	 */
	private String pinyin;
	/**
	 * 名称简称
	 */
	@TableField("short_name")
	private String shortName;
	/**
	 * 所属集团（上级公司）
	 */
	@TableField("group_id")
	private String groupId;
	/**
	 * 机构类型
	 */
	@TableField("mechanism_type")
	private String mechanismType;
	/**
	 * 工商注册号
	 */
	@TableField("business_regist_no")
	private String businessRegistNo;
	/**
	 * 组织机构代码
	 */
	@TableField("organization_code")
	private String organizationCode;
	/**
	 * 纳税人识别号
	 */
	@TableField("tax_no")
	private String taxNo;
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
	private String county;
	/**
	 * 地址
	 */
	private String address;
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

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getMechanismType() {
		return mechanismType;
	}

	public void setMechanismType(String mechanismType) {
		this.mechanismType = mechanismType;
	}

	public String getBusinessRegistNo() {
		return businessRegistNo;
	}

	public void setBusinessRegistNo(String businessRegistNo) {
		this.businessRegistNo = businessRegistNo;
	}

	public String getOrganizationCode() {
		return organizationCode;
	}

	public void setOrganizationCode(String organizationCode) {
		this.organizationCode = organizationCode;
	}

	public String getTaxNo() {
		return taxNo;
	}

	public void setTaxNo(String taxNo) {
		this.taxNo = taxNo;
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

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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
		return "Company{" + ", id=" + id + ", name=" + name + ", pinyin=" + pinyin + ", shortName=" + shortName
				+ ", groupId=" + groupId + ", mechanismType=" + mechanismType + ", businessRegistNo=" + businessRegistNo
				+ ", organizationCode=" + organizationCode + ", taxNo=" + taxNo + ", provincial=" + provincial
				+ ", city=" + city + ", county=" + county + ", address=" + address + ", contacts=" + contacts
				+ ", contactTel=" + contactTel + ", remarks=" + remarks + ", createTime=" + createTime + ", updateTime="
				+ updateTime + "}";
	}
}
