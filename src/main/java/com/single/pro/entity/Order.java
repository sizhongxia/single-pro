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
 * @since 2018-04-19
 */
@TableName("sp_order")
public class Order implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 项目ID
     */
	@TableField("project_id")
	private String projectId;
    /**
     * 项目名称
     */
	@TableField("project_name")
	private String projectName;
    /**
     * 项目批次ID
     */
	@TableField("work_id")
	private String workId;
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
     * 下单客户名称
     */
	@TableField("customer_name")
	private String customerName;
    /**
     * 劳务工人ID
     */
	@TableField("worker_id")
	private String workerId;
    /**
     * 接单工人名称
     */
	@TableField("worker_name")
	private String workerName;
    /**
     * 接单工人年龄
     */
	@TableField("worker_age")
	private Integer workerAge;
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
     * 产品公司
     */
	@TableField("product_company")
	private String productCompany;
    /**
     * 产品图片
     */
	@TableField("product_pic")
	private String productPic;
    /**
     * 产品数量及描述
     */
	@TableField("product_num")
	private String productNum;
    /**
     * 清单文件链接
     */
	@TableField("detail_list_url")
	private String detailListUrl;
    /**
     * 预计施工开始时间
     */
	@TableField("expect_time")
	private String expectTime;
    /**
     * 预计施工天数
     */
	@TableField("expect_days")
	private Integer expectDays;
    /**
     * 人天单价
     */
	@TableField("unit_day_price")
	private BigDecimal unitDayPrice;
    /**
     * 订单金额
     */
	@TableField("order_cost")
	private BigDecimal orderCost;
    /**
     * 更新定价时间（当confirm_cost_status为Y时，不允许修改）
     */
	@TableField("update_cost_time")
	private Date updateCostTime;
    /**
     * 客户确认定价状态（Y:已确认，N:未确认，C:工人暂未填写）
     */
	@TableField("confirm_cost_status")
	private String confirmCostStatus;
    /**
     * 确认金额时间
     */
	@TableField("confirm_cost_time")
	private Date confirmCostTime;
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
     * 剩余支付余额
     */
	@TableField("surplus_pay_cost")
	private BigDecimal surplusPayCost;
    /**
     * 待支付金额
     */
	@TableField("pending_pay_cost")
	private BigDecimal pendingPayCost;
    /**
     * 勘测服务选择（Y:选择，N:未选择）
     */
	@TableField("ser_survey_choice")
	private String serSurveyChoice;
    /**
     * 勘测服务进展状态（Y:已完成，D:进行中，N:未开始）
     */
	@TableField("ser_survey_status")
	private String serSurveyStatus;
    /**
     * 勘测服务更新时间
     */
	@TableField("ser_survey_update_time")
	private Date serSurveyUpdateTime;
    /**
     * 验货服务选择（Y:选择，N:未选择）
     */
	@TableField("ser_check_choice")
	private String serCheckChoice;
    /**
     * 验货服务进展状态（Y:已完成，D:进行中，N:未开始）
     */
	@TableField("ser_check_status")
	private String serCheckStatus;
    /**
     * 验货服务更新时间
     */
	@TableField("ser_check_update_time")
	private Date serCheckUpdateTime;
    /**
     * 施工服务选择（Y:选择，N:未选择）
     */
	@TableField("ser_construct_choice")
	private String serConstructChoice;
    /**
     * 施工服务进展状态（Y:已完成，D:进行中，N:未开始）
     */
	@TableField("ser_construct_status")
	private String serConstructStatus;
    /**
     * 施工服务更新时间
     */
	@TableField("ser_construct_update_time")
	private Date serConstructUpdateTime;
    /**
     * 培训服务选择（Y:选择，N:未选择）
     */
	@TableField("ser_train_choice")
	private String serTrainChoice;
    /**
     * 培训服务进展状态（Y:已完成，D:进行中，N:未开始）
     */
	@TableField("ser_train_status")
	private String serTrainStatus;
    /**
     * 培训服务更新时间
     */
	@TableField("ser_train_update_time")
	private Date serTrainUpdateTime;
    /**
     * 验收服务选择（Y:选择，N:未选择）
     */
	@TableField("ser_accept_choice")
	private String serAcceptChoice;
    /**
     * 验收服务进展状态（Y:已完成，D:进行中，N:未开始）
     */
	@TableField("ser_accept_status")
	private String serAcceptStatus;
    /**
     * 验收服务更新时间
     */
	@TableField("ser_accept_update_time")
	private Date serAcceptUpdateTime;
    /**
     * 下单发布状态（Y:已发布，N:暂存），一旦发布，状态不可修改
     */
	@TableField("release_status")
	private String releaseStatus;
    /**
     * 发布时间
     */
	@TableField("release_time")
	private Date releaseTime;
    /**
     * 施工状态（Y:已完工，R:进行中，D:待施工）
     */
	@TableField("build_status")
	private String buildStatus;
    /**
     * 订单状态（Y:已完成，D:已接单，N:已取消，W:待工人确认，P:待平台确认）
     */
	@TableField("order_status")
	private String orderStatus;
    /**
     * 备注说明
     */
	private String remarks;
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

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getWorkId() {
		return workId;
	}

	public void setWorkId(String workId) {
		this.workId = workId;
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

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getWorkerId() {
		return workerId;
	}

	public void setWorkerId(String workerId) {
		this.workerId = workerId;
	}

	public String getWorkerName() {
		return workerName;
	}

	public void setWorkerName(String workerName) {
		this.workerName = workerName;
	}

	public Integer getWorkerAge() {
		return workerAge;
	}

	public void setWorkerAge(Integer workerAge) {
		this.workerAge = workerAge;
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

	public String getProductCompany() {
		return productCompany;
	}

	public void setProductCompany(String productCompany) {
		this.productCompany = productCompany;
	}

	public String getProductPic() {
		return productPic;
	}

	public void setProductPic(String productPic) {
		this.productPic = productPic;
	}

	public String getProductNum() {
		return productNum;
	}

	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}

	public String getDetailListUrl() {
		return detailListUrl;
	}

	public void setDetailListUrl(String detailListUrl) {
		this.detailListUrl = detailListUrl;
	}

	public String getExpectTime() {
		return expectTime;
	}

	public void setExpectTime(String expectTime) {
		this.expectTime = expectTime;
	}

	public Integer getExpectDays() {
		return expectDays;
	}

	public void setExpectDays(Integer expectDays) {
		this.expectDays = expectDays;
	}

	public BigDecimal getUnitDayPrice() {
		return unitDayPrice;
	}

	public void setUnitDayPrice(BigDecimal unitDayPrice) {
		this.unitDayPrice = unitDayPrice;
	}

	public BigDecimal getOrderCost() {
		return orderCost;
	}

	public void setOrderCost(BigDecimal orderCost) {
		this.orderCost = orderCost;
	}

	public Date getUpdateCostTime() {
		return updateCostTime;
	}

	public void setUpdateCostTime(Date updateCostTime) {
		this.updateCostTime = updateCostTime;
	}

	public String getConfirmCostStatus() {
		return confirmCostStatus;
	}

	public void setConfirmCostStatus(String confirmCostStatus) {
		this.confirmCostStatus = confirmCostStatus;
	}

	public Date getConfirmCostTime() {
		return confirmCostTime;
	}

	public void setConfirmCostTime(Date confirmCostTime) {
		this.confirmCostTime = confirmCostTime;
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

	public BigDecimal getSurplusPayCost() {
		return surplusPayCost;
	}

	public void setSurplusPayCost(BigDecimal surplusPayCost) {
		this.surplusPayCost = surplusPayCost;
	}

	public BigDecimal getPendingPayCost() {
		return pendingPayCost;
	}

	public void setPendingPayCost(BigDecimal pendingPayCost) {
		this.pendingPayCost = pendingPayCost;
	}

	public String getSerSurveyChoice() {
		return serSurveyChoice;
	}

	public void setSerSurveyChoice(String serSurveyChoice) {
		this.serSurveyChoice = serSurveyChoice;
	}

	public String getSerSurveyStatus() {
		return serSurveyStatus;
	}

	public void setSerSurveyStatus(String serSurveyStatus) {
		this.serSurveyStatus = serSurveyStatus;
	}

	public Date getSerSurveyUpdateTime() {
		return serSurveyUpdateTime;
	}

	public void setSerSurveyUpdateTime(Date serSurveyUpdateTime) {
		this.serSurveyUpdateTime = serSurveyUpdateTime;
	}

	public String getSerCheckChoice() {
		return serCheckChoice;
	}

	public void setSerCheckChoice(String serCheckChoice) {
		this.serCheckChoice = serCheckChoice;
	}

	public String getSerCheckStatus() {
		return serCheckStatus;
	}

	public void setSerCheckStatus(String serCheckStatus) {
		this.serCheckStatus = serCheckStatus;
	}

	public Date getSerCheckUpdateTime() {
		return serCheckUpdateTime;
	}

	public void setSerCheckUpdateTime(Date serCheckUpdateTime) {
		this.serCheckUpdateTime = serCheckUpdateTime;
	}

	public String getSerConstructChoice() {
		return serConstructChoice;
	}

	public void setSerConstructChoice(String serConstructChoice) {
		this.serConstructChoice = serConstructChoice;
	}

	public String getSerConstructStatus() {
		return serConstructStatus;
	}

	public void setSerConstructStatus(String serConstructStatus) {
		this.serConstructStatus = serConstructStatus;
	}

	public Date getSerConstructUpdateTime() {
		return serConstructUpdateTime;
	}

	public void setSerConstructUpdateTime(Date serConstructUpdateTime) {
		this.serConstructUpdateTime = serConstructUpdateTime;
	}

	public String getSerTrainChoice() {
		return serTrainChoice;
	}

	public void setSerTrainChoice(String serTrainChoice) {
		this.serTrainChoice = serTrainChoice;
	}

	public String getSerTrainStatus() {
		return serTrainStatus;
	}

	public void setSerTrainStatus(String serTrainStatus) {
		this.serTrainStatus = serTrainStatus;
	}

	public Date getSerTrainUpdateTime() {
		return serTrainUpdateTime;
	}

	public void setSerTrainUpdateTime(Date serTrainUpdateTime) {
		this.serTrainUpdateTime = serTrainUpdateTime;
	}

	public String getSerAcceptChoice() {
		return serAcceptChoice;
	}

	public void setSerAcceptChoice(String serAcceptChoice) {
		this.serAcceptChoice = serAcceptChoice;
	}

	public String getSerAcceptStatus() {
		return serAcceptStatus;
	}

	public void setSerAcceptStatus(String serAcceptStatus) {
		this.serAcceptStatus = serAcceptStatus;
	}

	public Date getSerAcceptUpdateTime() {
		return serAcceptUpdateTime;
	}

	public void setSerAcceptUpdateTime(Date serAcceptUpdateTime) {
		this.serAcceptUpdateTime = serAcceptUpdateTime;
	}

	public String getReleaseStatus() {
		return releaseStatus;
	}

	public void setReleaseStatus(String releaseStatus) {
		this.releaseStatus = releaseStatus;
	}

	public Date getReleaseTime() {
		return releaseTime;
	}

	public void setReleaseTime(Date releaseTime) {
		this.releaseTime = releaseTime;
	}

	public String getBuildStatus() {
		return buildStatus;
	}

	public void setBuildStatus(String buildStatus) {
		this.buildStatus = buildStatus;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
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
		return "Order{" +
			", id=" + id +
			", projectId=" + projectId +
			", projectName=" + projectName +
			", workId=" + workId +
			", orderNo=" + orderNo +
			", customerId=" + customerId +
			", customerName=" + customerName +
			", workerId=" + workerId +
			", workerName=" + workerName +
			", workerAge=" + workerAge +
			", productId=" + productId +
			", productName=" + productName +
			", productKind=" + productKind +
			", productType=" + productType +
			", productModel=" + productModel +
			", productCompany=" + productCompany +
			", productPic=" + productPic +
			", productNum=" + productNum +
			", detailListUrl=" + detailListUrl +
			", expectTime=" + expectTime +
			", expectDays=" + expectDays +
			", unitDayPrice=" + unitDayPrice +
			", orderCost=" + orderCost +
			", updateCostTime=" + updateCostTime +
			", confirmCostStatus=" + confirmCostStatus +
			", confirmCostTime=" + confirmCostTime +
			", depositCost=" + depositCost +
			", paidCost=" + paidCost +
			", surplusPayCost=" + surplusPayCost +
			", pendingPayCost=" + pendingPayCost +
			", serSurveyChoice=" + serSurveyChoice +
			", serSurveyStatus=" + serSurveyStatus +
			", serSurveyUpdateTime=" + serSurveyUpdateTime +
			", serCheckChoice=" + serCheckChoice +
			", serCheckStatus=" + serCheckStatus +
			", serCheckUpdateTime=" + serCheckUpdateTime +
			", serConstructChoice=" + serConstructChoice +
			", serConstructStatus=" + serConstructStatus +
			", serConstructUpdateTime=" + serConstructUpdateTime +
			", serTrainChoice=" + serTrainChoice +
			", serTrainStatus=" + serTrainStatus +
			", serTrainUpdateTime=" + serTrainUpdateTime +
			", serAcceptChoice=" + serAcceptChoice +
			", serAcceptStatus=" + serAcceptStatus +
			", serAcceptUpdateTime=" + serAcceptUpdateTime +
			", releaseStatus=" + releaseStatus +
			", releaseTime=" + releaseTime +
			", buildStatus=" + buildStatus +
			", orderStatus=" + orderStatus +
			", remarks=" + remarks +
			", createTime=" + createTime +
			", updateTime=" + updateTime +
			"}";
	}
}
