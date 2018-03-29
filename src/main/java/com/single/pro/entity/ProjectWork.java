package com.single.pro.entity;

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
 * @since 2018-03-29
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
     * 工作项目名称
     */
	@TableField("work_name")
	private String workName;
    /**
     * 工作项目描述
     */
	@TableField("work_description")
	private String workDescription;
    /**
     * 操作人客户ID
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
			", workDescription=" + workDescription +
			", customerId=" + customerId +
			", createTime=" + createTime +
			", updateTime=" + updateTime +
			"}";
	}
}
