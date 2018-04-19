package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 产品表
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-04-19
 */
@TableName("sp_product")
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
	private String name;
    /**
     * 所属设备种类
     */
	@TableField("kind_id")
	private String kindId;
    /**
     * 产品类别
     */
	@TableField("type_id")
	private String typeId;
    /**
     * 所属公司
     */
	@TableField("company_id")
	private String companyId;
    /**
     * 产品型号
     */
	private String model;
    /**
     * 产品描述
     */
	private String describe;
    /**
     * 产品组成
     */
	private String constituent;
    /**
     * 勘测事项
     */
	@TableField("survey_items")
	private String surveyItems;
    /**
     * 安装调试
     */
	@TableField("install_debug")
	private String installDebug;
    /**
     * 设备维护
     */
	@TableField("device_maintain")
	private String deviceMaintain;
    /**
     * 常见问题
     */
	@TableField("common_problem")
	private String commonProblem;
    /**
     * 文档访问链接
     */
	@TableField("doc_url")
	private String docUrl;
    /**
     * 操作手册访问链接
     */
	@TableField("manual_url")
	private String manualUrl;
    /**
     * 产品封面图片
     */
	@TableField("cover_pic_url")
	private String coverPicUrl;
    /**
     * 申请人ID
     */
	@TableField("apply_user_id")
	private String applyUserId;
    /**
     * 上下架（展示）状态（Y:上架，N:下架，D:待发布）
     */
	@TableField("show_status")
	private String showStatus;
    /**
     * 产品联系人
     */
	private String contacts;
    /**
     * 联系电话
     */
	@TableField("contact_tel")
	private String contactTel;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getKindId() {
		return kindId;
	}

	public void setKindId(String kindId) {
		this.kindId = kindId;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getConstituent() {
		return constituent;
	}

	public void setConstituent(String constituent) {
		this.constituent = constituent;
	}

	public String getSurveyItems() {
		return surveyItems;
	}

	public void setSurveyItems(String surveyItems) {
		this.surveyItems = surveyItems;
	}

	public String getInstallDebug() {
		return installDebug;
	}

	public void setInstallDebug(String installDebug) {
		this.installDebug = installDebug;
	}

	public String getDeviceMaintain() {
		return deviceMaintain;
	}

	public void setDeviceMaintain(String deviceMaintain) {
		this.deviceMaintain = deviceMaintain;
	}

	public String getCommonProblem() {
		return commonProblem;
	}

	public void setCommonProblem(String commonProblem) {
		this.commonProblem = commonProblem;
	}

	public String getDocUrl() {
		return docUrl;
	}

	public void setDocUrl(String docUrl) {
		this.docUrl = docUrl;
	}

	public String getManualUrl() {
		return manualUrl;
	}

	public void setManualUrl(String manualUrl) {
		this.manualUrl = manualUrl;
	}

	public String getCoverPicUrl() {
		return coverPicUrl;
	}

	public void setCoverPicUrl(String coverPicUrl) {
		this.coverPicUrl = coverPicUrl;
	}

	public String getApplyUserId() {
		return applyUserId;
	}

	public void setApplyUserId(String applyUserId) {
		this.applyUserId = applyUserId;
	}

	public String getShowStatus() {
		return showStatus;
	}

	public void setShowStatus(String showStatus) {
		this.showStatus = showStatus;
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
		return "Product{" +
			", id=" + id +
			", name=" + name +
			", kindId=" + kindId +
			", typeId=" + typeId +
			", companyId=" + companyId +
			", model=" + model +
			", describe=" + describe +
			", constituent=" + constituent +
			", surveyItems=" + surveyItems +
			", installDebug=" + installDebug +
			", deviceMaintain=" + deviceMaintain +
			", commonProblem=" + commonProblem +
			", docUrl=" + docUrl +
			", manualUrl=" + manualUrl +
			", coverPicUrl=" + coverPicUrl +
			", applyUserId=" + applyUserId +
			", showStatus=" + showStatus +
			", contacts=" + contacts +
			", contactTel=" + contactTel +
			", createTime=" + createTime +
			", updateTime=" + updateTime +
			"}";
	}
}
