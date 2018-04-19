package com.single.pro.entity;

import java.math.BigDecimal;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 订单评价记录
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-04-19
 */
@TableName("sp_order_evaluate")
public class OrderEvaluate implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 评价订单
     */
	@TableField("order_id")
	private String orderId;
    /**
     * 被评价人
     */
	@TableField("to_user_id")
	private String toUserId;
    /**
     * 服务态度评分
     */
	@TableField("ser_attitude_score")
	private BigDecimal serAttitudeScore;
    /**
     * 施工效率评分
     */
	@TableField("ser_efficiency_score")
	private BigDecimal serEfficiencyScore;
    /**
     * 施工质量评分
     */
	@TableField("ser_quality_score")
	private BigDecimal serQualityScore;
    /**
     * 服务评论文本
     */
	@TableField("ser_comment")
	private String serComment;
    /**
     * 评价人
     */
	@TableField("from_user_id")
	private String fromUserId;
    /**
     * 评论时间
     */
	@TableField("create_time")
	private Date createTime;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getToUserId() {
		return toUserId;
	}

	public void setToUserId(String toUserId) {
		this.toUserId = toUserId;
	}

	public BigDecimal getSerAttitudeScore() {
		return serAttitudeScore;
	}

	public void setSerAttitudeScore(BigDecimal serAttitudeScore) {
		this.serAttitudeScore = serAttitudeScore;
	}

	public BigDecimal getSerEfficiencyScore() {
		return serEfficiencyScore;
	}

	public void setSerEfficiencyScore(BigDecimal serEfficiencyScore) {
		this.serEfficiencyScore = serEfficiencyScore;
	}

	public BigDecimal getSerQualityScore() {
		return serQualityScore;
	}

	public void setSerQualityScore(BigDecimal serQualityScore) {
		this.serQualityScore = serQualityScore;
	}

	public String getSerComment() {
		return serComment;
	}

	public void setSerComment(String serComment) {
		this.serComment = serComment;
	}

	public String getFromUserId() {
		return fromUserId;
	}

	public void setFromUserId(String fromUserId) {
		this.fromUserId = fromUserId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "OrderEvaluate{" +
			", id=" + id +
			", orderId=" + orderId +
			", toUserId=" + toUserId +
			", serAttitudeScore=" + serAttitudeScore +
			", serEfficiencyScore=" + serEfficiencyScore +
			", serQualityScore=" + serQualityScore +
			", serComment=" + serComment +
			", fromUserId=" + fromUserId +
			", createTime=" + createTime +
			"}";
	}
}
