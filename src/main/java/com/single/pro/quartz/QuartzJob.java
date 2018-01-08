package com.single.pro.quartz;

/**
 * 任务
 */
public final class QuartzJob implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private String jobId; // 任务ID
	private String jobName; // 任务名称
	private String jobGroup; // 任务组
	private String jobGroupName;// 任务分组名称
	private String jobStatus; // 任务状态
	private String cronExpression; // 任务调度时间表达式
	private String jobClassName; // 调度任务（作业）类名
	private String concurrent; // 是否允许并发执行同一个任务
	private String startupExecution; // 是否系统启动自执行
	private String description; // 任务描述
	private String createTime; // 创建时间
	private String updateTime; // 更新时间
	private String nextExecureTime; // 下次执行时间

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public String getJobGroup() {
		return jobGroup;
	}

	public void setJobGroup(String jobGroup) {
		this.jobGroup = jobGroup;
	}

	public String getJobStatus() {
		return jobStatus;
	}

	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}

	public String getCronExpression() {
		return cronExpression;
	}

	public void setCronExpression(String cronExpression) {
		this.cronExpression = cronExpression;
	}

	public String getJobClassName() {
		return jobClassName;
	}

	public void setJobClassName(String jobClassName) {
		this.jobClassName = jobClassName;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getJobGroupName() {
		return jobGroupName;
	}

	public void setJobGroupName(String jobGroupName) {
		this.jobGroupName = jobGroupName;
	}

	public String getConcurrent() {
		return concurrent;
	}

	public void setConcurrent(String concurrent) {
		this.concurrent = concurrent;
	}

	public String getStartupExecution() {
		return startupExecution;
	}

	public void setStartupExecution(String startupExecution) {
		this.startupExecution = startupExecution;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getNextExecureTime() {
		return nextExecureTime;
	}

	public void setNextExecureTime(String nextExecureTime) {
		this.nextExecureTime = nextExecureTime;
	}

}