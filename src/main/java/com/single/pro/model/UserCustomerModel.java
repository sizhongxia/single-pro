package com.single.pro.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class UserCustomerModel extends UserModel implements Serializable {
	private static final long serialVersionUID = 1L;

	private String customerId;
	private String companyId;
	private String companyName;
	private String industry;
	private BigDecimal gradeLevel;
	private String bondStatus;

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
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

}
