package com.single.pro.entity;

import java.math.BigDecimal;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 劳务工人项目关联订单
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_bond_record")
public class BondRecord implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 工人ID
     */
	@TableField("user_id")
	private String userId;
    /**
     * 项目ID
     */
	private BigDecimal money;
    /**
     * 是否赎回（Y:已赎回，N:未赎回）
     */
	private String redeem;
    /**
     * 缴纳时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 赎回时间
     */
	@TableField("redeem_time")
	private Date redeemTime;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public BigDecimal getMoney() {
		return money;
	}

	public void setMoney(BigDecimal money) {
		this.money = money;
	}

	public String getRedeem() {
		return redeem;
	}

	public void setRedeem(String redeem) {
		this.redeem = redeem;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getRedeemTime() {
		return redeemTime;
	}

	public void setRedeemTime(Date redeemTime) {
		this.redeemTime = redeemTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	public String toString() {
		return "BondRecord{" +
			", id=" + id +
			", userId=" + userId +
			", money=" + money +
			", redeem=" + redeem +
			", createTime=" + createTime +
			", redeemTime=" + redeemTime +
			", updateTime=" + updateTime +
			"}";
	}
}
