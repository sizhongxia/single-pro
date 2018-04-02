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
 * @since 2018-04-02
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
     * 产品资料名称
     */
	@TableField("file_name")
	private String fileName;
    /**
     * 产品资料地址
     */
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
    /**
     * 处理状态（Y:已处理，N:无效数据，D:待处理）
     */
	@TableField("handle_status")
	private String handleStatus;
    /**
     * 处理时间
     */
	@TableField("handle_time")
	private Date handleTime;


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

	public String getHandleStatus() {
		return handleStatus;
	}

	public void setHandleStatus(String handleStatus) {
		this.handleStatus = handleStatus;
	}

	public Date getHandleTime() {
		return handleTime;
	}

	public void setHandleTime(Date handleTime) {
		this.handleTime = handleTime;
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
			", handleStatus=" + handleStatus +
			", handleTime=" + handleTime +
			"}";
	}
}
