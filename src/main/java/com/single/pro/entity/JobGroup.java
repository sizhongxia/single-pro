package com.single.pro.entity;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 定时任务组
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-01-08
 */
@TableName("sp_job_group")
public class JobGroup implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 任务（作业）组ID
     */
	@TableField("group_id")
	private String groupId;
    /**
     * 任务（作业）组名称
     */
	@TableField("group_name")
	private String groupName;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	@Override
	public String toString() {
		return "JobGroup{" +
			", id=" + id +
			", groupId=" + groupId +
			", groupName=" + groupName +
			"}";
	}
}
