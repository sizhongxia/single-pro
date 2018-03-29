package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 项目关联产品
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_project_product")
public class ProjectProduct implements Serializable {

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
     * 项目工作ID关联
     */
	@TableField("work_no")
	private String workNo;
    /**
     * 关联产品
     */
	@TableField("product_id")
	private String productId;
    /**
     * 产品型号
     */
	private String model;
    /**
     * 清单文件链接
     */
	@TableField("detail_list_url")
	private String detailListUrl;
    /**
     * 产品数量
     */
	private Integer number;
    /**
     * 勘测服务选择（Y:选择，N:未选择）
     */
	@TableField("ser_survey_choice")
	private String serSurveyChoice;
    /**
     * 验货服务选择（Y:选择，N:未选择）
     */
	@TableField("ser_check_choice")
	private String serCheckChoice;
    /**
     * 施工服务选择（Y:选择，N:未选择）
     */
	@TableField("ser_construct_choice")
	private String serConstructChoice;
    /**
     * 培训服务选择（Y:选择，N:未选择）
     */
	@TableField("ser_train_choice")
	private String serTrainChoice;
    /**
     * 验收服务选择（Y:选择，N:未选择）
     */
	@TableField("ser_accept_choice")
	private String serAcceptChoice;
    /**
     * 施工备注
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

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getDetailListUrl() {
		return detailListUrl;
	}

	public void setDetailListUrl(String detailListUrl) {
		this.detailListUrl = detailListUrl;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getSerSurveyChoice() {
		return serSurveyChoice;
	}

	public void setSerSurveyChoice(String serSurveyChoice) {
		this.serSurveyChoice = serSurveyChoice;
	}

	public String getSerCheckChoice() {
		return serCheckChoice;
	}

	public void setSerCheckChoice(String serCheckChoice) {
		this.serCheckChoice = serCheckChoice;
	}

	public String getSerConstructChoice() {
		return serConstructChoice;
	}

	public void setSerConstructChoice(String serConstructChoice) {
		this.serConstructChoice = serConstructChoice;
	}

	public String getSerTrainChoice() {
		return serTrainChoice;
	}

	public void setSerTrainChoice(String serTrainChoice) {
		this.serTrainChoice = serTrainChoice;
	}

	public String getSerAcceptChoice() {
		return serAcceptChoice;
	}

	public void setSerAcceptChoice(String serAcceptChoice) {
		this.serAcceptChoice = serAcceptChoice;
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
		return "ProjectProduct{" +
			", id=" + id +
			", projectId=" + projectId +
			", workNo=" + workNo +
			", productId=" + productId +
			", model=" + model +
			", detailListUrl=" + detailListUrl +
			", number=" + number +
			", serSurveyChoice=" + serSurveyChoice +
			", serCheckChoice=" + serCheckChoice +
			", serConstructChoice=" + serConstructChoice +
			", serTrainChoice=" + serTrainChoice +
			", serAcceptChoice=" + serAcceptChoice +
			", remarks=" + remarks +
			", createTime=" + createTime +
			", updateTime=" + updateTime +
			"}";
	}
}
