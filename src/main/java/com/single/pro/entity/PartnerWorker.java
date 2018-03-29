package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 城市合伙人和工人关联信息表
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_partner_worker")
public class PartnerWorker implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 城市合伙人
     */
	@TableField("partner_id")
	private String partnerId;
    /**
     * 劳务工人
     */
	@TableField("worker_id")
	private String workerId;
    /**
     * 关联时间
     */
	@TableField("link_time")
	private Date linkTime;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPartnerId() {
		return partnerId;
	}

	public void setPartnerId(String partnerId) {
		this.partnerId = partnerId;
	}

	public String getWorkerId() {
		return workerId;
	}

	public void setWorkerId(String workerId) {
		this.workerId = workerId;
	}

	public Date getLinkTime() {
		return linkTime;
	}

	public void setLinkTime(Date linkTime) {
		this.linkTime = linkTime;
	}

	@Override
	public String toString() {
		return "PartnerWorker{" +
			", id=" + id +
			", partnerId=" + partnerId +
			", workerId=" + workerId +
			", linkTime=" + linkTime +
			"}";
	}
}
