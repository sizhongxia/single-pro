package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 工人预约记录表
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-04-19
 */
@TableName("sp_worker_bespeak")
public class WorkerBespeak implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 工人ID
     */
	@TableField("worker_id")
	private String workerId;
    /**
     * 项目ID
     */
	@TableField("project_id")
	private String projectId;
    /**
     * 订单ID
     */
	@TableField("order_id")
	private String orderId;
    /**
     * 施工开始时间
     */
	@TableField("construct_start_time")
	private Date constructStartTime;
    /**
     * 预约施工接
     */
	@TableField("construct_end_time")
	private Date constructEndTime;
    /**
     * 施工天数
     */
	@TableField("construct_days")
	private Integer constructDays;
    /**
     * 预约状态（Y:已接单，D:待确认，N:已取消）
     */
	@TableField("bespeak_status")
	private String bespeakStatus;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 处理时间
     */
	@TableField("handle_time")
	private Date handleTime;


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

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public Date getConstructStartTime() {
		return constructStartTime;
	}

	public void setConstructStartTime(Date constructStartTime) {
		this.constructStartTime = constructStartTime;
	}

	public Date getConstructEndTime() {
		return constructEndTime;
	}

	public void setConstructEndTime(Date constructEndTime) {
		this.constructEndTime = constructEndTime;
	}

	public Integer getConstructDays() {
		return constructDays;
	}

	public void setConstructDays(Integer constructDays) {
		this.constructDays = constructDays;
	}

	public String getBespeakStatus() {
		return bespeakStatus;
	}

	public void setBespeakStatus(String bespeakStatus) {
		this.bespeakStatus = bespeakStatus;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getHandleTime() {
		return handleTime;
	}

	public void setHandleTime(Date handleTime) {
		this.handleTime = handleTime;
	}

	@Override
	public String toString() {
		return "WorkerBespeak{" +
			", id=" + id +
			", workerId=" + workerId +
			", projectId=" + projectId +
			", orderId=" + orderId +
			", constructStartTime=" + constructStartTime +
			", constructEndTime=" + constructEndTime +
			", constructDays=" + constructDays +
			", bespeakStatus=" + bespeakStatus +
			", createTime=" + createTime +
			", handleTime=" + handleTime +
			"}";
	}
}
