package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 劳务工人资质申请
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_worker_aptitude")
public class WorkerAptitude implements Serializable {

    private static final long serialVersionUID = 1L;

	private String id;
    /**
     * 工人ID
     */
	@TableField("worker_id")
	private String workerId;
    /**
     * 学习产品关联ID
     */
	@TableField("product_id")
	private String productId;
    /**
     * 产品型号
     */
	private String model;
    /**
     * 申请说明
     */
	@TableField("apply_info")
	private String applyInfo;
    /**
     * 申请状态（Y:申请通过，N:申请驳回，D:待处理）
     */
	@TableField("apply_status")
	private String applyStatus;
    /**
     * 申请时间
     */
	@TableField("apply_time")
	private Date applyTime;
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

	public String getWorkerId() {
		return workerId;
	}

	public void setWorkerId(String workerId) {
		this.workerId = workerId;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getApplyInfo() {
		return applyInfo;
	}

	public void setApplyInfo(String applyInfo) {
		this.applyInfo = applyInfo;
	}

	public String getApplyStatus() {
		return applyStatus;
	}

	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}

	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	public String toString() {
		return "WorkerAptitude{" +
			", id=" + id +
			", workerId=" + workerId +
			", productId=" + productId +
			", model=" + model +
			", applyInfo=" + applyInfo +
			", applyStatus=" + applyStatus +
			", applyTime=" + applyTime +
			", updateTime=" + updateTime +
			"}";
	}
}
