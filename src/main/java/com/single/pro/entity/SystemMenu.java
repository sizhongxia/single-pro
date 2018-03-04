package com.single.pro.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 系统菜单
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-01
 */
@TableName("sp_system_menu")
public class SystemMenu implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.INPUT)
	private String id;
    /**
     * 父级ID
     */
	private String pid;
    /**
     * 应用ID
     */
	@TableField("app_id")
	private String appId;
    /**
     * 排序编号
     */
	@TableField("sort_no")
	private Integer sortNo;
    /**
     * 标题名称
     */
	private String text;
    /**
     * 图标
     */
	private String icon;
    /**
     * 站内链接
     */
	private String url;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public Integer getSortNo() {
		return sortNo;
	}

	public void setSortNo(Integer sortNo) {
		this.sortNo = sortNo;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "SystemMenu{" +
			", id=" + id +
			", pid=" + pid +
			", appId=" + appId +
			", sortNo=" + sortNo +
			", text=" + text +
			", icon=" + icon +
			", url=" + url +
			"}";
	}
}
