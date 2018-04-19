package com.single.pro.model;

import java.io.Serializable;
import java.util.Date;

public class WorkerAptitudeModel implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;
	private String workerId;
	private String city;
	private String applyStatus;
	private String applyInfo;
	private Date applyTime;
	private String productId;
	private String productName;
	private String kindId;
	private String typeId;
	private String productModel;

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

	@Override
	public String toString() {
		return "WorkerAptitudeModel [id=" + id + ", workerId=" + workerId + ", city=" + city + ", applyStatus="
				+ applyStatus + ", applyInfo=" + applyInfo + ", applyTime=" + applyTime + ", productId=" + productId
				+ ", productName=" + productName + ", kindId=" + kindId + ", typeId=" + typeId + ", productModel="
				+ productModel + "]";
	}

}
