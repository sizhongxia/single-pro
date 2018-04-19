package com.single.pro.entity;

import java.math.BigDecimal;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 劳务工人待付款申请
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-04-19
 */
@TableName("sp_order_pending_apply")
public class OrderPendingApply implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 订单主键
     */
	@TableField("order_id")
	private String orderId;
    /**
     * 工人ID
     */
	@TableField("worker_id")
	private String workerId;
    /**
     * 客户ID
     */
	@TableField("customer_id")
	private String customerId;
    /**
     * 申请时间
     */
	@TableField("apply_time")
	private Date applyTime;
    /**
     * 申请金额
     */
	@TableField("apply_money")
	private BigDecimal applyMoney;
    /**
     * 申请状态（N:待确认，Y:已确认,未支付，D:已付款，C:已驳回）
     */
	@TableField("apply_status")
	private String applyStatus;
    /**
     * 处理确认时间
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

	public String getWorkerId() {
		return workerId;
	}

	public void setWorkerId(String workerId) {
		this.workerId = workerId;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	public BigDecimal getApplyMoney() {
		return applyMoney;
	}

	public void setApplyMoney(BigDecimal applyMoney) {
		this.applyMoney = applyMoney;
	}

	public String getApplyStatus() {
		return applyStatus;
	}

	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}

	public Date getHandleTime() {
		return handleTime;
	}

	public void setHandleTime(Date handleTime) {
		this.handleTime = handleTime;
	}

	@Override
	public String toString() {
		return "OrderPendingApply{" +
			", id=" + id +
			", orderId=" + orderId +
			", workerId=" + workerId +
			", customerId=" + customerId +
			", applyTime=" + applyTime +
			", applyMoney=" + applyMoney +
			", applyStatus=" + applyStatus +
			", handleTime=" + handleTime +
			"}";
	}
}
