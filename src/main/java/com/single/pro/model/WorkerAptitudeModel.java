package com.single.pro.model;

import java.io.Serializable;
import java.util.Date;

public class WorkerAptitudeModel implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;
	private String workerId;
	private String userName;
	private Integer gender;
	private Integer age;
	private String phoneNo;
	private String city;
	private String applyStatus;
	private String applyInfo;
	private Date applyTime;
	private Date handleTime;
	private String productId;
	private String productName;
	private String kindId;
	private String typeId;
	private String productModel;
	private String companyName;
	private String coverPicUrl;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWorkerId() {
		return workerId;
	}

	public void setWorkerId(String workerId) {
		this.workerId = workerId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getApplyStatus() {
		return applyStatus;
	}

	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}

	public String getApplyInfo() {
		return applyInfo;
	}

	public void setApplyInfo(String applyInfo) {
		this.applyInfo = applyInfo;
	}

	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	public Date getHandleTime() {
		return handleTime;
	}

	public void setHandleTime(Date handleTime) {
		this.handleTime = handleTime;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getKindId() {
		return kindId;
	}

	public void setKindId(String kindId) {
		this.kindId = kindId;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getProductModel() {
		return productModel;
	}

	public void setProductModel(String productModel) {
		this.productModel = productModel;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCoverPicUrl() {
		return coverPicUrl;
	}

	public void setCoverPicUrl(String coverPicUrl) {
		this.coverPicUrl = coverPicUrl;
	}

	@Override
	public String toString() {
		return "WorkerAptitudeModel [id=" + id + ", workerId=" + workerId + ", userName=" + userName + ", gender="
				+ gender + ", age=" + age + ", phoneNo=" + phoneNo + ", city=" + city + ", applyStatus=" + applyStatus
				+ ", applyInfo=" + applyInfo + ", applyTime=" + applyTime + ", handleTime=" + handleTime
				+ ", productId=" + productId + ", productName=" + productName + ", kindId=" + kindId + ", typeId="
				+ typeId + ", productModel=" + productModel + ", companyName=" + companyName + ", coverPicUrl="
				+ coverPicUrl + "]";
	}

}
