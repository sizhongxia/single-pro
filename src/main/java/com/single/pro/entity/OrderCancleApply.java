package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 订单取消记录申请
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-04-20
 */
@TableName("sp_order_cancle_apply")
public class OrderCancleApply implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
	@TableField("order_id")
	private String orderId;
    /**
     * 申请状态（Y:已确认，N:驳回，D:申请中）
     */
	@TableField("apply_status")
	private String applyStatus;
    /**
     * 取消原因
     */
	@TableField("cancel_reason")
	private String cancelReason;
    /**
     * 取消申请时间
     */
	@TableField("apply_time")
	private Date applyTime;
    /**
     * （工人）处理确认时间
     */
	@TableField("handle_time")
	private Date handleTime;


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

	public String getApplyStatus() {
		return applyStatus;
	}

	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}

	public String getCancelReason() {
		return cancelReason;
	}

	public void setCancelReason(String cancelReason) {
		this.cancelReason = cancelReason;
	}

	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	public Date getHandleTime() {
		return handleTime;
	}

	public void setHandleTime(Date handleTime) {
		this.handleTime = handleTime;
	}

	@Override
	public String toString() {
		return "OrderCancleApply{" +
			", id=" + id +
			", orderId=" + orderId +
			", applyStatus=" + applyStatus +
			", cancelReason=" + cancelReason +
			", applyTime=" + applyTime +
			", handleTime=" + handleTime +
			"}";
	}
}
