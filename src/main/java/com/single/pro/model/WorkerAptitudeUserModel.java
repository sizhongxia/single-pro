package com.single.pro.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class WorkerAptitudeUserModel implements Serializable {

	private static final long serialVersionUID = 1L;

	private String workerId;
	private String userName;
	private Integer age;
	private Integer gender;
	private String phoneNo;
	private String workerNo;
	private BigDecimal gradeLevel;
	private Integer evaluateTimes;

	public String getWorkerId() {
		return workerId;
	}

	public void setWorkerId(String workerId) {
		this.workerId = workerId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getWorkerNo() {
		return workerNo;
	}

	public void setWorkerNo(String workerNo) {
		this.workerNo = workerNo;
	}

	public BigDecimal getGradeLevel() {
		return gradeLevel;
	}

	public void setGradeLevel(BigDecimal gradeLevel) {
		this.gradeLevel = gradeLevel;
	}

	public Integer getEvaluateTimes() {
		return evaluateTimes;
	}

	public void setEvaluateTimes(Integer evaluateTimes) {
		this.evaluateTimes = evaluateTimes;
	}

	@Override
	public String toString() {
		return "WorkerAptitudeUserModel [workerId=" + workerId + ", userName=" + userName + ", age=" + age + ", gender="
				+ gender + ", phoneNo=" + phoneNo + ", workerNo=" + workerNo + ", gradeLevel=" + gradeLevel
				+ ", evaluateTimes=" + evaluateTimes + "]";
	}

}
