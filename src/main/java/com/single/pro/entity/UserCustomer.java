package com.single.pro.entity;

import java.math.BigDecimal;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 客户
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_user_customer")
public class UserCustomer implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
	private String id;
    /**
     * 用户ID
     */
	@TableField("user_id")
	private String userId;
    /**
     * 关联平台公司基础库
     */
	@TableField("company_id")
	private String companyId;
    /**
     * 行业
     */
	private String industry;
    /**
     * 用户评分
     */
	@TableField("grade_level")
	private BigDecimal gradeLevel;
    /**
     * 信誉保证金状态（Y:已缴纳，N:未缴纳）
     */
	@TableField("bond_status")
	private String bondStatus;
    /**
     * 注册时间
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public BigDecimal getGradeLevel() {
		return gradeLevel;
	}

	public void setGradeLevel(BigDecimal gradeLevel) {
		this.gradeLevel = gradeLevel;
	}

	public String getBondStatus() {
		return bondStatus;
	}

	public void setBondStatus(String bondStatus) {
		this.bondStatus = bondStatus;
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
		return "UserCustomer{" +
			", id=" + id +
			", userId=" + userId +
			", companyId=" + companyId +
			", industry=" + industry +
			", gradeLevel=" + gradeLevel +
			", bondStatus=" + bondStatus +
			", createTime=" + createTime +
			", updateTime=" + updateTime +
			"}";
	}
}
