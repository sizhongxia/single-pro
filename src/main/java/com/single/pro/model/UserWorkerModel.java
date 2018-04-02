package com.single.pro.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class UserWorkerModel extends UserModel implements Serializable {
	private static final long serialVersionUID = 1L;

	private String workerId;
	private Integer workerNo;
	private BigDecimal gradeLevel;
	private String bondStatus;
	private BigDecimal balance;
	private String remarks;
	private Date lastOrderTime;

	public String getWorkerId() {
		return workerId;
	}

	public void setWorkerId(String workerId) {
		this.workerId = workerId;
	}

	public Integer getWorkerNo() {
		return workerNo;
	}

	public void setWorkerNo(Integer workerNo) {
		this.workerNo = workerNo;
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

}
