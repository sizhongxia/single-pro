package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 系统用户操作记录表（记录关键数据）
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_operation_log")
public class OperationLog implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 操作用户ID
     */
	@TableField("user_id")
	private String userId;
    /**
     * 操作类型（C:创建，U：更新，D：删除）
     */
	@TableField("operate_type")
	private String operateType;
    /**
     * 操作对象名称
     */
	@TableField("obj_name")
	private String objName;
    /**
     * 操作内容
     */
	@TableField("operate_content")
	private String operateContent;
    /**
     * 操作时间
     */
	@TableField("operate_time")
	private Date operateTime;


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

	public String getOperateType() {
		return operateType;
	}

	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}

	public String getObjName() {
		return objName;
	}

	public void setObjName(String objName) {
		this.objName = objName;
	}

	public String getOperateContent() {
		return operateContent;
	}

	public void setOperateContent(String operateContent) {
		this.operateContent = operateContent;
	}

	public Date getOperateTime() {
		return operateTime;
	}

	public void setOperateTime(Date operateTime) {
		this.operateTime = operateTime;
	}

	@Override
	public String toString() {
		return "OperationLog{" +
			", id=" + id +
			", userId=" + userId +
			", operateType=" + operateType +
			", objName=" + objName +
			", operateContent=" + operateContent +
			", operateTime=" + operateTime +
			"}";
	}
}
