package com.single.pro.storage;

import java.io.File;

public interface FileStorage {

	// 允许图片格式
	String[] allowImageTypes = new String[] { ".jpg", ".png" };
	// 允许其他格式
	String[] allowTypes = new String[] { ".jpg", ".png", ".doc", ".docx", ".pdf", ".xls", ".xlsx", ".txt", ".zip", ".rar", ".7z" };
	// 最大图片大小
	int imageMaxSize = 1024 * 1024 * 2;
	// 最大文件大小
	int fileMaxSize = 1024 * 1024 * 20;

	boolean upload(String path, File file);

	boolean upload(String path, byte[] bytes);

}
