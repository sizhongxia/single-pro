package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 城市基础数据
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-30
 */
@TableName("sp_basic_city")
public class BasicCity implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 城市名称
     */
	private String name;
    /**
     * 拼音
     */
	private String pinyin;
    /**
     * 简拼
     */
	private String jianpin;
    /**
     * 父级编码
     */
	private String pcode;
    /**
     * 城市编码
     */
	private String code;
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

	public String getPinyin() {
		return pinyin;
	}

	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}

	public String getJianpin() {
		return jianpin;
	}

	public void setJianpin(String jianpin) {
		this.jianpin = jianpin;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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
		return "BasicCity{" +
			", id=" + id +
			", name=" + name +
			", pinyin=" + pinyin +
			", jianpin=" + jianpin +
			", pcode=" + pcode +
			", code=" + code +
			", createTime=" + createTime +
			", updateTime=" + updateTime +
			"}";
	}
}
