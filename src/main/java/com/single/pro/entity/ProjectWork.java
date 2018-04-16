package com.single.pro.entity;

import java.math.BigDecimal;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 项目任务（批次）
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-04-15
 */
@TableName("sp_project_work")
public class ProjectWork implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 项目关联ID
     */
	@TableField("project_id")
	private String projectId;
    /**
     * 操作流水号
     */
	@TableField("work_no")
	private String workNo;
    /**
     * 项目批次名称
     */
	@TableField("work_name")
	private String workName;
    /**
     * 项目类别
     */
	@TableField("project_type")
	private String projectType;
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
     * 人天单价（当前时间）
     */
	@TableField("city_unit_price")
	private BigDecimal cityUnitPrice;
    /**
     * 施工单位ID
     */
	@TableField("company_id")
	private String companyId;
    /**
     * 施工公司名称
     */
	@TableField("company_name")
	private String companyName;
    /**
     * 产品种类数
     */
	@TableField("product_num")
	private Integer productNum;
    /**
     * 工人数量
     */
	@TableField("worker_num")
	private Integer workerNum;
    /**
     * 托管金额汇总
     */
	@TableField("deposit_cost_sum")
	private BigDecimal depositCostSum;
    /**
     * 已支付金额汇总
     */
	@TableField("paid_cost_sum")
	private BigDecimal paidCostSum;
    /**
     * 未支付金额汇总
     */
	@TableField("unpaid_cost_sum")
	private BigDecimal unpaidCostSum;
    /**
     * 未确认数量
     */
	@TableField("unconfirmed_num")
	private Integer unconfirmedNum;
    /**
     * 已确认数量
     */
	@TableField("confirmed_num")
	private Integer confirmedNum;
    /**
     * 未完成数量
     */
	@TableField("uncomplete_num")
	private Integer uncompleteNum;
    /**
     * 已完成数量
     */
	@TableField("complete_num")
	private Integer completeNum;
    /**
     * 工作项目描述
     */
	@TableField("work_description")
	private String workDescription;
    /**
     * 操作人客户id，关联user表id
     */
	@TableField("customer_id")
	private String customerId;
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

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
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

	public String getProjectType() {
		return projectType;
	}

	public void setProjectType(String projectType) {
		this.projectType = projectType;
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

	public BigDecimal getCityUnitPrice() {
		return cityUnitPrice;
	}

	public void setCityUnitPrice(BigDecimal cityUnitPrice) {
		this.cityUnitPrice = cityUnitPrice;
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

	public Integer getProductNum() {
		return productNum;
	}

	public void setProductNum(Integer productNum) {
		this.productNum = productNum;
	}

	public Integer getWorkerNum() {
		return workerNum;
	}

	public void setWorkerNum(Integer workerNum) {
		this.workerNum = workerNum;
	}

	public BigDecimal getDepositCostSum() {
		return depositCostSum;
	}

	public void setDepositCostSum(BigDecimal depositCostSum) {
		this.depositCostSum = depositCostSum;
	}

	public BigDecimal getPaidCostSum() {
		return paidCostSum;
	}

	public void setPaidCostSum(BigDecimal paidCostSum) {
		this.paidCostSum = paidCostSum;
	}

	public BigDecimal getUnpaidCostSum() {
		return unpaidCostSum;
	}

	public void setUnpaidCostSum(BigDecimal unpaidCostSum) {
		this.unpaidCostSum = unpaidCostSum;
	}

	public Integer getUnconfirmedNum() {
		return unconfirmedNum;
	}

	public void setUnconfirmedNum(Integer unconfirmedNum) {
		this.unconfirmedNum = unconfirmedNum;
	}

	public Integer getConfirmedNum() {
		return confirmedNum;
	}

	public void setConfirmedNum(Integer confirmedNum) {
		this.confirmedNum = confirmedNum;
	}

	public Integer getUncompleteNum() {
		return uncompleteNum;
	}

	public void setUncompleteNum(Integer uncompleteNum) {
		this.uncompleteNum = uncompleteNum;
	}

	public Integer getCompleteNum() {
		return completeNum;
	}

	public void setCompleteNum(Integer completeNum) {
		this.completeNum = completeNum;
	}

	public String getWorkDescription() {
		return workDescription;
	}

	public void setWorkDescription(String workDescription) {
		this.workDescription = workDescription;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
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
		return "ProjectWork{" +
			", id=" + id +
			", projectId=" + projectId +
			", workNo=" + workNo +
			", workName=" + workName +
			", projectType=" + projectType +
			", provincial=" + provincial +
			", city=" + city +
			", county=" + county +
			", address=" + address +
			", longitude=" + longitude +
			", latitude=" + latitude +
			", cityUnitPrice=" + cityUnitPrice +
			", companyId=" + companyId +
			", companyName=" + companyName +
			", productNum=" + productNum +
			", workerNum=" + workerNum +
			", depositCostSum=" + depositCostSum +
			", paidCostSum=" + paidCostSum +
			", unpaidCostSum=" + unpaidCostSum +
			", unconfirmedNum=" + unconfirmedNum +
			", confirmedNum=" + confirmedNum +
			", uncompleteNum=" + uncompleteNum +
			", completeNum=" + completeNum +
			", workDescription=" + workDescription +
			", customerId=" + customerId +
			", createTime=" + createTime +
			", updateTime=" + updateTime +
			"}";
	}
}
