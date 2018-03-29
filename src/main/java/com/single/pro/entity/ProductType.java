package com.single.pro.entity;

import java.math.BigDecimal;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 产品类型，例：人脸识别，塔吊
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_product_type")
public class ProductType implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 名称
     */
	private String name;
    /**
     * 产品种类
     */
	@TableField("kind_id")
	private String kindId;
    /**
     * 产品图片
     */
	@TableField("pic_url")
	private String picUrl;
    /**
     * 概述
     */
	private String summary;
    /**
     * 施工申请条件
     */
	@TableField("sgsq_condition")
	private String sgsqCondition;
    /**
     * 勘测
     */
	@TableField("ser_survey")
	private String serSurvey;
    /**
     * 验货
     */
	@TableField("ser_check")
	private String serCheck;
    /**
     * 施工
     */
	@TableField("ser_construct")
	private String serConstruct;
    /**
     * 培训
     */
	@TableField("ser_train")
	private String serTrain;
    /**
     * 验收
     */
	@TableField("ser_accept")
	private String serAccept;
    /**
     * 数量单位
     */
	private String unit;
    /**
     * 施工难度
     */
	private BigDecimal difficulty;
    /**
     * 状态（Y:正常，N:禁用）
     */
	private String status;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 最后修改时间
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

	public String getKindId() {
		return kindId;
	}

	public void setKindId(String kindId) {
		this.kindId = kindId;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getSgsqCondition() {
		return sgsqCondition;
	}

	public void setSgsqCondition(String sgsqCondition) {
		this.sgsqCondition = sgsqCondition;
	}

	public String getSerSurvey() {
		return serSurvey;
	}

	public void setSerSurvey(String serSurvey) {
		this.serSurvey = serSurvey;
	}

	public String getSerCheck() {
		return serCheck;
	}

	public void setSerCheck(String serCheck) {
		this.serCheck = serCheck;
	}

	public String getSerConstruct() {
		return serConstruct;
	}

	public void setSerConstruct(String serConstruct) {
		this.serConstruct = serConstruct;
	}

	public String getSerTrain() {
		return serTrain;
	}

	public void setSerTrain(String serTrain) {
		this.serTrain = serTrain;
	}

	public String getSerAccept() {
		return serAccept;
	}

	public void setSerAccept(String serAccept) {
		this.serAccept = serAccept;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public BigDecimal getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(BigDecimal difficulty) {
		this.difficulty = difficulty;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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
		return "ProductType{" +
			", id=" + id +
			", name=" + name +
			", kindId=" + kindId +
			", picUrl=" + picUrl +
			", summary=" + summary +
			", sgsqCondition=" + sgsqCondition +
			", serSurvey=" + serSurvey +
			", serCheck=" + serCheck +
			", serConstruct=" + serConstruct +
			", serTrain=" + serTrain +
			", serAccept=" + serAccept +
			", unit=" + unit +
			", difficulty=" + difficulty +
			", status=" + status +
			", createTime=" + createTime +
			", updateTime=" + updateTime +
			"}";
	}
}
