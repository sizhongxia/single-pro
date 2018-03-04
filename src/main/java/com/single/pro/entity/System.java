package com.single.pro.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 系统基本信息
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-01
 */
@TableName("sp_system")
public class System implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.INPUT)
	private String id;
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


	public String getId() {
		return id;
	}

	public void setId(String id) {
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

	@Override
	public String toString() {
		return "System{" +
			", id=" + id +
			", title=" + title +
			", subtitle=" + subtitle +
			", logoUrl=" + logoUrl +
			", copyright=" + copyright +
			"}";
	}
}
