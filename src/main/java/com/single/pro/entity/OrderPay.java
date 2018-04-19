package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 订单支付
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-04-19
 */
@TableName("sp_order_pay")
public class OrderPay implements Serializable {

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
     * 订单编号
     */
	@TableField("order_no")
	private String orderNo;
    /**
     * 订单金额（单位：分）
     */
	private Integer money;
    /**
     * 支付流水号
     */
	@TableField("pay_serial_num")
	private String paySerialNum;
    /**
     * 支付状态（Y:支付完成，N:支付失败）
     */
	private String status;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 最后操作时间
     */
	@TableField("last_operation_time")
	private Date lastOperationTime;


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

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}

	public String getPaySerialNum() {
		return paySerialNum;
	}

	public void setPaySerialNum(String paySerialNum) {
		this.paySerialNum = paySerialNum;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getLastOperationTime() {
		return lastOperationTime;
	}

	public void setLastOperationTime(Date lastOperationTime) {
		this.lastOperationTime = lastOperationTime;
	}

	@Override
	public String toString() {
		return "OrderPay{" +
			", id=" + id +
			", orderId=" + orderId +
			", orderNo=" + orderNo +
			", money=" + money +
			", paySerialNum=" + paySerialNum +
			", status=" + status +
			", createTime=" + createTime +
			", lastOperationTime=" + lastOperationTime +
			"}";
	}
}
