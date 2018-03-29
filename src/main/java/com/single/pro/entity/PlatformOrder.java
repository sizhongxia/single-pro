package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 转至平台订单
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_platform_order")
public class PlatformOrder implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 订单ID
     */
	@TableField("order_id")
	private String orderId;
    /**
     * 订单来源类型（C:客户\系统转平台，W:劳务工人转平台）
     */
	@TableField("order_source")
	private String orderSource;
    /**
     * 来源关联ID
     */
	@TableField("source_id")
	private String sourceId;
    /**
     * 订单状态（Y:已转接至工人，N:已取消，D:待处理）
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
     * 系统用户,操作人ID
     */
	@TableField("operator_id")
	private String operatorId;
    /**
     * 操作时间
     */
	@TableField("operate_time")
	private Date operateTime;


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

	public String getOperatorId() {
		return operatorId;
	}

	public void setOperatorId(String operatorId) {
		this.operatorId = operatorId;
	}

	public Date getOperateTime() {
		return operateTime;
	}

	public void setOperateTime(Date operateTime) {
		this.operateTime = operateTime;
	}

	@Override
	public String toString() {
		return "PlatformOrder{" +
			", id=" + id +
			", orderId=" + orderId +
			", orderSource=" + orderSource +
			", sourceId=" + sourceId +
			", orderStatus=" + orderStatus +
			", destinationId=" + destinationId +
			", remarks=" + remarks +
			", createTime=" + createTime +
			", operatorId=" + operatorId +
			", operateTime=" + operateTime +
			"}";
	}
}
