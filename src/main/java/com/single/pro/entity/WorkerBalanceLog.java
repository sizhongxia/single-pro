package com.single.pro.entity;

import java.math.BigDecimal;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 劳务工人余额变更表
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_worker_balance_log")
public class WorkerBalanceLog implements Serializable {

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
     * 订单编号
     */
	@TableField("order_no")
	private String orderNo;
    /**
     * 之前余额
     */
	@TableField("bef_balance")
	private BigDecimal befBalance;
    /**
     * 变更金额
     */
	@TableField("change_money")
	private BigDecimal changeMoney;
    /**
     * 之后余额
     */
	@TableField("aft_balance")
	private BigDecimal aftBalance;
    /**
     * 变更状态（Y:已入账，N:已取消，D:未入账）
     */
	private String status;
    /**
     * 提现备注
     */
	private String remarks;
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

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public BigDecimal getBefBalance() {
		return befBalance;
	}

	public void setBefBalance(BigDecimal befBalance) {
		this.befBalance = befBalance;
	}

	public BigDecimal getChangeMoney() {
		return changeMoney;
	}

	public void setChangeMoney(BigDecimal changeMoney) {
		this.changeMoney = changeMoney;
	}

	public BigDecimal getAftBalance() {
		return aftBalance;
	}

	public void setAftBalance(BigDecimal aftBalance) {
		this.aftBalance = aftBalance;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public Date getHandleTime() {
		return handleTime;
	}

	public void setHandleTime(Date handleTime) {
		this.handleTime = handleTime;
	}

	@Override
	public String toString() {
		return "WorkerBalanceLog{" +
			", id=" + id +
			", workerId=" + workerId +
			", orderNo=" + orderNo +
			", befBalance=" + befBalance +
			", changeMoney=" + changeMoney +
			", aftBalance=" + aftBalance +
			", status=" + status +
			", remarks=" + remarks +
			", createTime=" + createTime +
			", handleTime=" + handleTime +
			"}";
	}
}
