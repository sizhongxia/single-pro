package com.single.pro.model;

import java.io.Serializable;
import java.util.Date;

public class WorkerAptitudeModel implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;
	private String workerId;
	private String userName;
	private String province;
	private String city;
	private String productId;
	private String productName;
	private String kindId;
	private String typeId;
	private String model;
	private String applyInfo;
	private String applyStatus;
	private Date applyTime;
	private Date updateTime;

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

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getApplyInfo() {
		return applyInfo;
	}

	public void setApplyInfo(String applyInfo) {
		this.applyInfo = applyInfo;
	}

	public String getApplyStatus() {
		return applyStatus;
	}

	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}

	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	public String toString() {
		return "WorkerAptitudeModel [id=" + id + ", workerId=" + workerId + ", userName=" + userName + ", province="
				+ province + ", city=" + city + ", productId=" + productId + ", productName=" + productName
				+ ", kindId=" + kindId + ", typeId=" + typeId + ", model=" + model + ", applyInfo=" + applyInfo
				+ ", applyStatus=" + applyStatus + ", applyTime=" + applyTime + ", updateTime=" + updateTime + "]";
	}

}
