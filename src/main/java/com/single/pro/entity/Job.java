package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 定时任务
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-07
 */
@TableName("sp_job")
public class Job implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
	private String id;
    /**
     * 任务（作业）名称
     */
	private String name;
    /**
     * 所在组
     */
	private String group;
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
	private Date createTime;
    /**
     * 修改时间
     */
	@TableField("update_time")
	private Date updateTime;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
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
		return "Job{" +
			", id=" + id +
			", name=" + name +
			", group=" + group +
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
