package com.single.pro.entity;

import java.math.BigDecimal;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 基础劳务费
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_basic_cost")
public class BasicCost implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 城市编码
     */
	@TableField("city_code")
	private String cityCode;
    /**
     * 城市名称
     */
	@TableField("city_name")
	private String cityName;
    /**
     * 基础劳务费
     */
	@TableField("basic_cost")
	private BigDecimal basicCost;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
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

	public String getCityCode() {
		return cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public BigDecimal getBasicCost() {
		return basicCost;
	}

	public void setBasicCost(BigDecimal basicCost) {
		this.basicCost = basicCost;
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
		return "BasicCost{" +
			", id=" + id +
			", cityCode=" + cityCode +
			", cityName=" + cityName +
			", basicCost=" + basicCost +
			", createTime=" + createTime +
			", updateTime=" + updateTime +
			"}";
	}
}
