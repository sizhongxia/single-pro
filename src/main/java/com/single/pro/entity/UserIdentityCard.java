package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 用户身份证信息表
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_user_identity_card")
public class UserIdentityCard implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 用户ID
     */
	@TableField("user_id")
	private String userId;
    /**
     * 身份证号
     */
	@TableField("identity_card")
	private String identityCard;
    /**
     * 身份证正面图片
     */
	@TableField("identity_card_front_pic")
	private String identityCardFrontPic;
    /**
     * 身份证背面图片
     */
	@TableField("identity_card_back_pic")
	private String identityCardBackPic;
    /**
     * 上传时间
     */
	@TableField("upload_time")
	private Date uploadTime;
    /**
     * 审核状态（Y:审核通过，N:审核未通过，D:审核中，W:未认证）
     */
	@TableField("audit_state")
	private String auditState;
    /**
     * 审核时间
     */
	@TableField("audit_time")
	private Date auditTime;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getIdentityCard() {
		return identityCard;
	}

	public void setIdentityCard(String identityCard) {
		this.identityCard = identityCard;
	}

	public String getIdentityCardFrontPic() {
		return identityCardFrontPic;
	}

	public void setIdentityCardFrontPic(String identityCardFrontPic) {
		this.identityCardFrontPic = identityCardFrontPic;
	}

	public String getIdentityCardBackPic() {
		return identityCardBackPic;
	}

	public void setIdentityCardBackPic(String identityCardBackPic) {
		this.identityCardBackPic = identityCardBackPic;
	}

	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public String getAuditState() {
		return auditState;
	}

	public void setAuditState(String auditState) {
		this.auditState = auditState;
	}

	public Date getAuditTime() {
		return auditTime;
	}

	public void setAuditTime(Date auditTime) {
		this.auditTime = auditTime;
	}

	@Override
	public String toString() {
		return "UserIdentityCard{" +
			", id=" + id +
			", userId=" + userId +
			", identityCard=" + identityCard +
			", identityCardFrontPic=" + identityCardFrontPic +
			", identityCardBackPic=" + identityCardBackPic +
			", uploadTime=" + uploadTime +
			", auditState=" + auditState +
			", auditTime=" + auditTime +
			"}";
	}
}
