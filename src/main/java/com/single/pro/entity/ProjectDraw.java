package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 项目图纸
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@TableName("sp_project_draw")
public class ProjectDraw implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 项目关联ID
     */
	@TableField("project_id")
	private String projectId;
    /**
     * 图纸地址
     */
	@TableField("drawing_url")
	private String drawingUrl;
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

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getDrawingUrl() {
		return drawingUrl;
	}

	public void setDrawingUrl(String drawingUrl) {
		this.drawingUrl = drawingUrl;
	}

	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	@Override
	public String toString() {
		return "ProjectDraw{" +
			", id=" + id +
			", projectId=" + projectId +
			", drawingUrl=" + drawingUrl +
			", uploadTime=" + uploadTime +
			"}";
	}
}
