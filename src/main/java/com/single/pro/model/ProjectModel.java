package com.single.pro.model;

import java.io.Serializable;
import java.util.Date;

public class ProjectModel implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;
	private String name;
	private String type;
	private String provincial;
	private String city;
	private String country;
	private String address;
	private String longitude;
	private String latitude;
	private String coveredArea;
	private Integer workerNum;
	private String companyId;
	private String companyName;
	private String contacts;
	private String contactTel;
	private String remarks;
	private Date createTime;
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

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
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
		return "ProjectModel [id=" + id + ", name=" + name + ", type=" + type + ", provincial=" + provincial + ", city="
				+ city + ", country=" + country + ", address=" + address + ", longitude=" + longitude + ", latitude="
				+ latitude + ", coveredArea=" + coveredArea + ", workerNum=" + workerNum + ", companyId=" + companyId
				+ ", companyName=" + companyName + ", contacts=" + contacts + ", contactTel=" + contactTel
				+ ", remarks=" + remarks + ", createTime=" + createTime + ", updateTime=" + updateTime + "]";
	}

}
