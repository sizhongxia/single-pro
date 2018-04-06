package com.single.pro.model;

import java.io.Serializable;
import java.util.Date;

public class ProductModel implements Serializable {

	private static final long serialVersionUID = 1L;
	private String id;
	private String name;
	/**
	 * 所属设备种类
	 */
	private String kindId;
	private String kindName;
	/**
	 * 产品类别
	 */
	private String typeId;
	private String typeName;
	/**
	 * 所属公司
	 */
	private String companyId;
	private String companyName;
	private String companyMechanismType;
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
	private String surveyItems;
	/**
	 * 安装调试
	 */
	private String installDebug;
	/**
	 * 设备维护
	 */
	private String deviceMaintain;
	/**
	 * 常见问题
	 */
	private String commonProblem;
	/**
	 * 文档访问链接
	 */
	private String docUrl;
	/**
	 * 操作手册访问链接
	 */
	private String manualUrl;
	/**
	 * 上下架（展示）状态（Y:上架，N:下架，D:待发布）
	 */
	private String showStatus;

	private String contacts;
	private String contactTel;
	/**
	 * 注册时间
	 */
	private Date createTime;
	/**
	 * 最后修改时间
	 */
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

	public String getKindName() {
		return kindName;
	}

	public void setKindName(String kindName) {
		this.kindName = kindName;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyMechanismType() {
		return companyMechanismType;
	}

	public void setCompanyMechanismType(String companyMechanismType) {
		this.companyMechanismType = companyMechanismType;
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
		return "ProductModel [id=" + id + ", name=" + name + ", kindId=" + kindId + ", kindName=" + kindName
				+ ", typeId=" + typeId + ", typeName=" + typeName + ", companyId=" + companyId + ", companyName="
				+ companyName + ", companyMechanismType=" + companyMechanismType + ", model=" + model + ", describe="
				+ describe + ", constituent=" + constituent + ", surveyItems=" + surveyItems + ", installDebug="
				+ installDebug + ", deviceMaintain=" + deviceMaintain + ", commonProblem=" + commonProblem + ", docUrl="
				+ docUrl + ", manualUrl=" + manualUrl + ", showStatus=" + showStatus + ", contacts=" + contacts
				+ ", contactTel=" + contactTel + ", createTime=" + createTime + ", updateTime=" + updateTime + "]";
	}

}
