package com.single.pro.entity;

import java.math.BigDecimal;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 劳务工人
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-04-15
 */
@TableName("sp_user_worker")
public class UserWorker implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
	private String id;
    /**
     * 用户ID
     */
	@TableField("user_id")
	private String userId;
    /**
     * 工号ID
     */
	@TableField("worker_no")
	private Integer workerNo;
    /**
     * 工种（字典）
     */
	@TableField("worker_type")
	private String workerType;
    /**
     * 用户评分
     */
	@TableField("grade_level")
	private BigDecimal gradeLevel;
    /**
     * 施工保证金缴纳状态（Y:已缴纳，N:未缴纳）
     */
	@TableField("bond_status")
	private String bondStatus;
    /**
     * 余额
     */
	private BigDecimal balance;
    /**
     * 描述
     */
	private String remarks;
    /**
     * 最后接单时间
     */
	@TableField("last_order_time")
	private Date lastOrderTime;
    /**
     * 注册时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 最后修改时间
     */
	@TableField("update_time")
	private Date updateTime;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Integer getWorkerNo() {
		return workerNo;
	}

	public void setWorkerNo(Integer workerNo) {
		this.workerNo = workerNo;
	}

	public String getWorkerType() {
		return workerType;
	}

	public void setWorkerType(String workerType) {
		this.workerType = workerType;
	}

	public BigDecimal getGradeLevel() {
		return gradeLevel;
	}

	public void setGradeLevel(BigDecimal gradeLevel) {
		this.gradeLevel = gradeLevel;
	}

	public String getBondStatus() {
		return bondStatus;
	}

	public void setBondStatus(String bondStatus) {
		this.bondStatus = bondStatus;
	}

	public BigDecimal getBalance() {
		return balance;
	}

	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Date getLastOrderTime() {
		return lastOrderTime;
	}

	public void setLastOrderTime(Date lastOrderTime) {
		this.lastOrderTime = lastOrderTime;
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
		return "UserWorker{" +
			", id=" + id +
			", userId=" + userId +
			", workerNo=" + workerNo +
			", workerType=" + workerType +
			", gradeLevel=" + gradeLevel +
			", bondStatus=" + bondStatus +
			", balance=" + balance +
			", remarks=" + remarks +
			", lastOrderTime=" + lastOrderTime +
			", createTime=" + createTime +
			", updateTime=" + updateTime +
			"}";
	}
}
