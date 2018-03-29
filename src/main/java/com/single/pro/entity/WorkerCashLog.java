package com.single.pro.entity;

import java.math.BigDecimal;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 劳务工人提现记录表
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_worker_cash_log")
public class WorkerCashLog implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 提现金额
     */
	@TableField("cash_cost")
	private BigDecimal cashCost;
    /**
     * 提现流水号
     */
	@TableField("serial_number")
	private String serialNumber;
    /**
     * 提现状态（Y:已到账，D:进行中，N:已撤销）
     */
	@TableField("cash_status")
	private String cashStatus;
    /**
     * 提现备注
     */
	@TableField("cash_remarks")
	private String cashRemarks;
    /**
     * 工人ID
     */
	@TableField("worker_id")
	private String workerId;
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

	public BigDecimal getCashCost() {
		return cashCost;
	}

	public void setCashCost(BigDecimal cashCost) {
		this.cashCost = cashCost;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public String getCashStatus() {
		return cashStatus;
	}

	public void setCashStatus(String cashStatus) {
		this.cashStatus = cashStatus;
	}

	public String getCashRemarks() {
		return cashRemarks;
	}

	public void setCashRemarks(String cashRemarks) {
		this.cashRemarks = cashRemarks;
	}

	public String getWorkerId() {
		return workerId;
	}

	public void setWorkerId(String workerId) {
		this.workerId = workerId;
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
		return "WorkerCashLog{" +
			", id=" + id +
			", cashCost=" + cashCost +
			", serialNumber=" + serialNumber +
			", cashStatus=" + cashStatus +
			", cashRemarks=" + cashRemarks +
			", workerId=" + workerId +
			", createTime=" + createTime +
			", handleTime=" + handleTime +
			"}";
	}
}
