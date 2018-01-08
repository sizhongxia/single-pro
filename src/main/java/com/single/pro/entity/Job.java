package com.single.pro.entity;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 定时任务
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-01-08
 */
@TableName("sp_job")
public class Job implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 任务ID
     */
	@TableField("job_id")
	private String jobId;
    /**
     * 任务（作业）名称
     */
	@TableField("job_name")
	private String jobName;
    /**
     * 所在组
     */
	@TableField("group_id")
	private Integer groupId;
    /**
     * 任务状态
     */
	private String status;
    /**
     * 定时任务时间表达式
     */
	private String cron;
    /**
     * 作业类
     */
	@TableField("clazz_name")
	private String clazzName;
    /**
     * 是否允许并发执行同一个任务
     */
	@TableField("is_concurrent")
	private Integer isConcurrent;
    /**
     * 是否项目启动时自执行
     */
	@TableField("is_startup_execution")
	private Integer isStartupExecution;
    /**
     * 描述
     */
	private String description;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Long createTime;
    /**
     * 修改时间
     */
	@TableField("update_time")
	private Long updateTime;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCron() {
		return cron;
	}

	public void setCron(String cron) {
		this.cron = cron;
	}

	public String getClazzName() {
		return clazzName;
	}

	public void setClazzName(String clazzName) {
		this.clazzName = clazzName;
	}

	public Integer getIsConcurrent() {
		return isConcurrent;
	}

	public void setIsConcurrent(Integer isConcurrent) {
		this.isConcurrent = isConcurrent;
	}

	public Integer getIsStartupExecution() {
		return isStartupExecution;
	}

	public void setIsStartupExecution(Integer isStartupExecution) {
		this.isStartupExecution = isStartupExecution;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Long createTime) {
		this.createTime = createTime;
	}

	public Long getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Long updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	public String toString() {
		return "Job{" +
			", id=" + id +
			", jobId=" + jobId +
			", jobName=" + jobName +
			", groupId=" + groupId +
			", status=" + status +
			", cron=" + cron +
			", clazzName=" + clazzName +
			", isConcurrent=" + isConcurrent +
			", isStartupExecution=" + isStartupExecution +
			", description=" + description +
			", createTime=" + createTime +
			", updateTime=" + updateTime +
			"}";
	}
}
