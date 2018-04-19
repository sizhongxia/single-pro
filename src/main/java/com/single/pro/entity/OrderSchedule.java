package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 订单进度表
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-04-19
 */
@TableName("sp_order_schedule")
public class OrderSchedule implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 订单编号
     */
	@TableField("order_id")
	private String orderId;
    /**
     * 劳务工人ID
     */
	@TableField("worker_id")
	private String workerId;
    /**
     * 施工阶段,字典
     */
	private String stage;
    /**
     * 施工天数
     */
	private Integer days;
    /**
     * 工作状态（Y:已完成，D:进行中）
     */
	@TableField("worker_status")
	private String workerStatus;
    /**
     * 工作内容说明，工人
     */
	@TableField("work_content")
	private String workContent;
    /**
     * 确认状态（Y:已确认，N:已驳回，D:待确认）
     */
	@TableField("ack_status")
	private String ackStatus;
    /**
     * 确认时间
     */
	@TableField("ack_time")
	private Date ackTime;
    /**
     * 评语，客户
     */
	private String comment;
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

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getWorkerId() {
		return workerId;
	}

	public void setWorkerId(String workerId) {
		this.workerId = workerId;
	}

	public String getStage() {
		return stage;
	}

	public void setStage(String stage) {
		this.stage = stage;
	}

	public Integer getDays() {
		return days;
	}

	public void setDays(Integer days) {
		this.days = days;
	}

	public String getWorkerStatus() {
		return workerStatus;
	}

	public void setWorkerStatus(String workerStatus) {
		this.workerStatus = workerStatus;
	}

	public String getWorkContent() {
		return workContent;
	}

	public void setWorkContent(String workContent) {
		this.workContent = workContent;
	}

	public String getAckStatus() {
		return ackStatus;
	}

	public void setAckStatus(String ackStatus) {
		this.ackStatus = ackStatus;
	}

	public Date getAckTime() {
		return ackTime;
	}

	public void setAckTime(Date ackTime) {
		this.ackTime = ackTime;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
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
		return "OrderSchedule{" +
			", id=" + id +
			", orderId=" + orderId +
			", workerId=" + workerId +
			", stage=" + stage +
			", days=" + days +
			", workerStatus=" + workerStatus +
			", workContent=" + workContent +
			", ackStatus=" + ackStatus +
			", ackTime=" + ackTime +
			", comment=" + comment +
			", createTime=" + createTime +
			", updateTime=" + updateTime +
			"}";
	}
}
