package com.single.pro.entity;

import java.math.BigDecimal;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 劳务工人项目关联订单
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_worker_order")
public class WorkerOrder implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 项目产品关联ID
     */
	@TableField("order_id")
	private String orderId;
    /**
     * 工人ID
     */
	@TableField("worker_id")
	private String workerId;
    /**
     * 订单来源类型（C:系统派单，W:劳务工人转接，P:平台转接，U:个人接单）
     */
	@TableField("order_source")
	private String orderSource;
    /**
     * 来源关联ID
     */
	@TableField("source_id")
	private String sourceId;
    /**
     * 参考人天费用
     */
	@TableField("reference_cost")
	private BigDecimal referenceCost;
    /**
     * 订单状态（Y:已接收，P:已取消（转平台），W:已取消（转工人），D:待处理）
     */
	@TableField("order_status")
	private String orderStatus;
    /**
     * 目标工人ID
     */
	@TableField("destination_id")
	private String destinationId;
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

	public String getOrderSource() {
		return orderSource;
	}

	public void setOrderSource(String orderSource) {
		this.orderSource = orderSource;
	}

	public String getSourceId() {
		return sourceId;
	}

	public void setSourceId(String sourceId) {
		this.sourceId = sourceId;
	}

	public BigDecimal getReferenceCost() {
		return referenceCost;
	}

	public void setReferenceCost(BigDecimal referenceCost) {
		this.referenceCost = referenceCost;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getDestinationId() {
		return destinationId;
	}

	public void setDestinationId(String destinationId) {
		this.destinationId = destinationId;
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
		return "WorkerOrder{" +
			", id=" + id +
			", orderId=" + orderId +
			", workerId=" + workerId +
			", orderSource=" + orderSource +
			", sourceId=" + sourceId +
			", referenceCost=" + referenceCost +
			", orderStatus=" + orderStatus +
			", destinationId=" + destinationId +
			", remarks=" + remarks +
			", createTime=" + createTime +
			", updateTime=" + updateTime +
			"}";
	}
}
