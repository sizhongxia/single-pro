package com.single.pro.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-05
 */
@TableName("sp_system_file")
public class SystemFile implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	private String id;
    /**
     * 文件原始名称
     */
	@TableField("original_name")
	private String originalName;
    /**
     * 文件访问路径
     */
	private String path;
    /**
     * 文件类型
     */
	private String type;
    /**
     * 文件大小
     */
	private Long size;
    /**
     * 文件描述
     */
	private String desc;
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

	public String getOriginalName() {
		return originalName;
	}

	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Long getSize() {
		return size;
	}

	public void setSize(Long size) {
		this.size = size;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	@Override
	public String toString() {
		return "SystemFile{" +
			", id=" + id +
			", originalName=" + originalName +
			", path=" + path +
			", type=" + type +
			", size=" + size +
			", desc=" + desc +
			", uploadTime=" + uploadTime +
			"}";
	}
}
