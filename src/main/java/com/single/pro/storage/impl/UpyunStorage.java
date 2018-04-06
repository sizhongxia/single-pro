package com.single.pro.storage.impl;

import java.io.File;

import org.springframework.beans.factory.InitializingBean;

import com.single.pro.storage.FileStorage;
import com.single.pro.util.Md5Util;

import main.java.com.UpYun;

public class UpyunStorage implements FileStorage, InitializingBean {

	private static UpYun upyun = null;

	private UpyunConfig upyunConfig;

	public void setUpyunConfig(UpyunConfig upyunConfig) {
		this.upyunConfig = upyunConfig;
	}

	@Override
	public boolean uploadImage(String path, File file) {
		if (file == null || upyun == null) {
			return false;
		}
		try {
			upyun.setContentMD5(UpYun.md5(file));
			return upyun.writeFile(path, file, true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean uploadImage(String path, byte[] bytes) {
		if (bytes == null || upyun == null) {
			return false;
		}
		try {
			upyun.setContentMD5(Md5Util.md5(bytes));
			return upyun.writeFile(path, bytes, true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		upyun = new UpYun(upyunConfig.getBucket(), upyunConfig.getOperator(), upyunConfig.getPassword());
		upyun.setDebug(upyunConfig.isDebug());
		upyun.setTimeout(upyunConfig.getTimeout());
		upyun.setApiDomain(UpYun.ED_AUTO);
	}

}
