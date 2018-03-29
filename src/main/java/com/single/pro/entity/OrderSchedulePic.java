package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 订单进度表图片资源
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_order_schedule_pic")
public class OrderSchedulePic implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 订单进度ID
     */
	@TableField("schedule_id")
	private String scheduleId;
    /**
     * 图片访问路径
     */
	@TableField("image_url")
	private String imageUrl;
    /**
     * 上传时间
     */
	@TableField("upload_time")
	private Date uploadTime;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(String scheduleId) {
		this.scheduleId = scheduleId;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	@Override
	public String toString() {
		return "OrderSchedulePic{" +
			", id=" + id +
			", scheduleId=" + scheduleId +
			", imageUrl=" + imageUrl +
			", uploadTime=" + uploadTime +
			"}";
	}
}
