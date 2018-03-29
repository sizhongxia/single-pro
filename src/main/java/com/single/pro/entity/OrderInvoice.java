package com.single.pro.entity;

import java.math.BigDecimal;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 订单发票
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_order_invoice")
public class OrderInvoice implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 订单编号
     */
	@TableField("order_no")
	private String orderNo;
    /**
     * 公司名称
     */
	@TableField("company_name")
	private String companyName;
    /**
     * 纳税人识别号
     */
	@TableField("company_tax_no")
	private String companyTaxNo;
    /**
     * 发票金额
     */
	@TableField("invoice_cost")
	private BigDecimal invoiceCost;
    /**
     * 电子邮箱
     */
	private String email;
    /**
     * 备注说明
     */
	private String remarks;
    /**
     * 发票状态（Y:已完成）
     */
	private String status;
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

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyTaxNo() {
		return companyTaxNo;
	}

	public void setCompanyTaxNo(String companyTaxNo) {
		this.companyTaxNo = companyTaxNo;
	}

	public BigDecimal getInvoiceCost() {
		return invoiceCost;
	}

	public void setInvoiceCost(BigDecimal invoiceCost) {
		this.invoiceCost = invoiceCost;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
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

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	public String toString() {
		return "OrderInvoice{" +
			", id=" + id +
			", orderNo=" + orderNo +
			", companyName=" + companyName +
			", companyTaxNo=" + companyTaxNo +
			", invoiceCost=" + invoiceCost +
			", email=" + email +
			", remarks=" + remarks +
			", status=" + status +
			", createTime=" + createTime +
			", updateTime=" + updateTime +
			"}";
	}
}
