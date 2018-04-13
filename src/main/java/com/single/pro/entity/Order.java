package com.single.pro.entity;

import java.math.BigDecimal;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 订单
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-04-13
 */
@TableName("sp_order")
public class Order implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 订单编号
     */
	@TableField("order_no")
	private String orderNo;
    /**
     * 客户ID
     */
	@TableField("customer_id")
	private String customerId;
    /**
     * 劳务工人ID
     */
	@TableField("worker_id")
	private String workerId;
    /**
     * 项目产品关联ID
     */
	@TableField("project_product_id")
	private String projectProductId;
    /**
     * 项目名称
     */
	@TableField("project_name")
	private String projectName;
    /**
     * 产品关联ID
     */
	@TableField("product_id")
	private String productId;
    /**
     * 产品名称
     */
	@TableField("product_name")
	private String productName;
    /**
     * 产品种类
     */
	@TableField("product_kind")
	private String productKind;
    /**
     * 产品类别
     */
	@TableField("product_type")
	private String productType;
    /**
     * 产品型号
     */
	@TableField("product_model")
	private String productModel;
    /**
     * 预计施工开始时间
     */
	@TableField("expect_stime")
	private Date expectStime;
    /**
     * 预计施工天数
     */
	@TableField("expect_days")
	private Integer expectDays;
    /**
     * 订单金额
     */
	@TableField("order_cost")
	private BigDecimal orderCost;
    /**
     * 托管金额
     */
	@TableField("deposit_cost")
	private BigDecimal depositCost;
    /**
     * 已支付金额
     */
	@TableField("paid_cost")
	private BigDecimal paidCost;
    /**
     * 订单状态（Y:已完成，D:已接单，N:已取消，W:待工人确认，P:待平台确认）
     */
	@TableField("order_status")
	private String orderStatus;
    /**
     * 施工状态（Y:已完工，R:进行中，D:待施工）
     */
	@TableField("build_status")
	private String buildStatus;
    /**
     * 取消订单理由
     */
	@TableField("cancle_reason")
	private String cancleReason;
    /**
     * 备注说明
     */
	private String remarks;
    /**
     * 工人评分，客户填写
     */
	@TableField("worker_grade")
	private BigDecimal workerGrade;
    /**
     * 工人评语，客户填写
     */
	@TableField("worker_comment")
	private String workerComment;
    /**
     * 客户填写时间
     */
	@TableField("worker_c_time")
	private Date workerCTime;
    /**
     * 客户评分，工人填写
     */
	@TableField("customer_grade")
	private BigDecimal customerGrade;
    /**
     * 客户评语，工人填写
     */
	@TableField("customer_comment")
	private String customerComment;
    /**
     * 工人填写时间
     */
	@TableField("customer_c_time")
	private Date customerCTime;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 最后更新时间
     */
	@TableField("update_time")
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

	public String getCancleReason() {
		return cancleReason;
	}

	public void setCancleReason(String cancleReason) {
		this.cancleReason = cancleReason;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public BigDecimal getWorkerGrade() {
		return workerGrade;
	}

	public void setWorkerGrade(BigDecimal workerGrade) {
		this.workerGrade = workerGrade;
	}

	public String getWorkerComment() {
		return workerComment;
	}

	public void setWorkerComment(String workerComment) {
		this.workerComment = workerComment;
	}

	public Date getWorkerCTime() {
		return workerCTime;
	}

	public void setWorkerCTime(Date workerCTime) {
		this.workerCTime = workerCTime;
	}

	public BigDecimal getCustomerGrade() {
		return customerGrade;
	}

	public void setCustomerGrade(BigDecimal customerGrade) {
		this.customerGrade = customerGrade;
	}

	public String getCustomerComment() {
		return customerComment;
	}

	public void setCustomerComment(String customerComment) {
		this.customerComment = customerComment;
	}

	public Date getCustomerCTime() {
		return customerCTime;
	}

	public void setCustomerCTime(Date customerCTime) {
		this.customerCTime = customerCTime;
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
		return "Order{" +
			", id=" + id +
			", orderNo=" + orderNo +
			", customerId=" + customerId +
			", workerId=" + workerId +
			", projectProductId=" + projectProductId +
			", projectName=" + projectName +
			", productId=" + productId +
			", productName=" + productName +
			", productKind=" + productKind +
			", productType=" + productType +
			", productModel=" + productModel +
			", expectStime=" + expectStime +
			", expectDays=" + expectDays +
			", orderCost=" + orderCost +
			", depositCost=" + depositCost +
			", paidCost=" + paidCost +
			", orderStatus=" + orderStatus +
			", buildStatus=" + buildStatus +
			", cancleReason=" + cancleReason +
			", remarks=" + remarks +
			", workerGrade=" + workerGrade +
			", workerComment=" + workerComment +
			", workerCTime=" + workerCTime +
			", customerGrade=" + customerGrade +
			", customerComment=" + customerComment +
			", customerCTime=" + customerCTime +
			", createTime=" + createTime +
			", updateTime=" + updateTime +
			"}";
	}
}
