package com.single.pro.entity;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-01-08
 */
@TableName("sp_application")
public class Application implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 网站标题
     */
	private String title;
    /**
     * 副标题
     */
	private String subtitle;
    /**
     * 网站Logo地址
     */
	@TableField("logo_url")
	private String logoUrl;
    /**
     * 版权信息
     */
	private String copyright;
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


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getLogoUrl() {
		return logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}

	public String getCopyright() {
		return copyright;
	}

	public void setCopyright(String copyright) {
		this.copyright = copyright;
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
		return "Application{" +
			", id=" + id +
			", title=" + title +
			", subtitle=" + subtitle +
			", logoUrl=" + logoUrl +
			", copyright=" + copyright +
			", status=" + status +
			", createTime=" + createTime +
			", updateTime=" + updateTime +
			"}";
	}
}
