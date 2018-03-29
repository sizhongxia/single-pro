package com.single.pro.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 系统应用
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_system_app")
public class SystemApp implements Serializable {

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
     * 图标
     */
	private String icon;
    /**
     * 排序
     */
	@TableField("sort_no")
	private Integer sortNo;


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

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Integer getSortNo() {
		return sortNo;
	}

	public void setSortNo(Integer sortNo) {
		this.sortNo = sortNo;
	}

	@Override
	public String toString() {
		return "SystemApp{" +
			", id=" + id +
			", name=" + name +
			", icon=" + icon +
			", sortNo=" + sortNo +
			"}";
	}
}
