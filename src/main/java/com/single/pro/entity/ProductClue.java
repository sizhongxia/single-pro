package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 产品（申请）线索记录表
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_product_clue")
public class ProductClue implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 产品名称
     */
	@TableField("product_name")
	private String productName;
    /**
     * 所属公司
     */
	private String company;
    /**
     * 联系人
     */
	private String contacts;
    /**
     * 联系电话
     */
	@TableField("contact_tel")
	private String contactTel;
    /**
     * 概述
     */
	private String summary;
    /**
     * 产品类别
     */
	@TableField("file_name")
	private String fileName;
	@TableField("file_url")
	private String fileUrl;
    /**
     * 申请人、关联用户
     */
	@TableField("user_id")
	private String userId;
    /**
     * 申请时间
     */
	@TableField("apply_time")
	private Date applyTime;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getContactTel() {
		return contactTel;
	}

	public void setContactTel(String contactTel) {
		this.contactTel = contactTel;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	@Override
	public String toString() {
		return "ProductClue{" +
			", id=" + id +
			", productName=" + productName +
			", company=" + company +
			", contacts=" + contacts +
			", contactTel=" + contactTel +
			", summary=" + summary +
			", fileName=" + fileName +
			", fileUrl=" + fileUrl +
			", userId=" + userId +
			", applyTime=" + applyTime +
			"}";
	}
}
