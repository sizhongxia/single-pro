package com.single.pro.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ProjectOrderModel implements Serializable {
	private static final long serialVersionUID = 1L;
	private String id;
	private String orderNo;
	private String customerId;
	private String workerId;
	private String workNo;
	private String workName;
	private String projectProductId;
	private String projectName;
	private String productId;
	private String productName;
	private String productKind;
	private String productType;
	private String productModel;
	private Date expectStime;
	private Integer expectDays;
	private BigDecimal orderCost;
	private BigDecimal depositCost;
	private BigDecimal paidCost;
	/** 订单状态（Y:已完成，D:已接单，N:已取消，W:待工人确认，P:待平台确认） */
	private String orderStatus;
	/** 施工状态（Y:已完工，R:进行中，D:待施工） */
	private String buildStatus;
	private Date createTime;
	private Date updateTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getWorkerId() {
		return workerId;
	}

	public void setWorkerId(String workerId) {
		this.workerId = workerId;
	}

	public String getWorkNo() {
		return workNo;
	}

	public void setWorkNo(String workNo) {
		this.workNo = workNo;
	}

	public String getWorkName() {
		return workName;
	}

	public void setWorkName(String workName) {
		this.workName = workName;
	}

	public String getProjectProductId() {
		return projectProductId;
	}

	public void setProjectProductId(String projectProductId) {
		this.projectProductId = projectProductId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
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

	public String getProductKind() {
		return productKind;
	}

	public void setProductKind(String productKind) {
		this.productKind = productKind;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getProductModel() {
		return productModel;
	}

	public void setProductModel(String productModel) {
		this.productModel = productModel;
	}

	public Date getExpectStime() {
		return expectStime;
	}

	public void setExpectStime(Date expectStime) {
		this.expectStime = expectStime;
	}

	public Integer getExpectDays() {
		return expectDays;
	}

	public void setExpectDays(Integer expectDays) {
		this.expectDays = expectDays;
	}

	public BigDecimal getOrderCost() {
		return orderCost;
	}

	public void setOrderCost(BigDecimal orderCost) {
		this.orderCost = orderCost;
	}

	public BigDecimal getDepositCost() {
		return depositCost;
	}

	public void setDepositCost(BigDecimal depositCost) {
		this.depositCost = depositCost;
	}

	public BigDecimal getPaidCost() {
		return paidCost;
	}

	public void setPaidCost(BigDecimal paidCost) {
		this.paidCost = paidCost;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getBuildStatus() {
		return buildStatus;
	}

	public void setBuildStatus(String buildStatus) {
		this.buildStatus = buildStatus;
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
		return "ProjectOrderModel [id=" + id + ", orderNo=" + orderNo + ", customerId=" + customerId + ", workerId="
				+ workerId + ", workNo=" + workNo + ", workName=" + workName + ", projectProductId=" + projectProductId
				+ ", projectName=" + projectName + ", productId=" + productId + ", productName=" + productName
				+ ", productKind=" + productKind + ", productType=" + productType + ", productModel=" + productModel
				+ ", expectStime=" + expectStime + ", expectDays=" + expectDays + ", orderCost=" + orderCost
				+ ", depositCost=" + depositCost + ", paidCost=" + paidCost + ", orderStatus=" + orderStatus
				+ ", buildStatus=" + buildStatus + ", createTime=" + createTime + ", updateTime=" + updateTime + "]";
	}

}
