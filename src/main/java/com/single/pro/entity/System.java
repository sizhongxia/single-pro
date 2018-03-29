package com.single.pro.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 系统基本信息
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_system")
public class System implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
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
     * 网站主页
     */
	private String website;
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

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
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
			", website=" + website +
			", logoUrl=" + logoUrl +
			", copyright=" + copyright +
			"}";
	}
}
