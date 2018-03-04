package com.single.pro.util;

import java.io.File;
import java.io.InputStream;

import com.xiaoleilu.hutool.crypto.digest.DigestAlgorithm;
import com.xiaoleilu.hutool.crypto.digest.Digester;
import com.xiaoleilu.hutool.crypto.digest.HMac;
import com.xiaoleilu.hutool.crypto.digest.HmacAlgorithm;

public class Md5Util {
	final static Digester md5 = new Digester(DigestAlgorithm.MD5);

	public static String md5(File file) {
		return md5.digestHex(file);
	}

	public static String md5(byte[] bytes) {
		return md5.digestHex(bytes);
	}

	public static String md5(InputStream is) {
		return md5.digestHex(is);
	}

	public static String md5(String str) {
		HMac mac = new HMac(HmacAlgorithm.HmacMD5, "zhongxia_Nwvxske67MfT5Y2t".getBytes());
		return mac.digestHex(str);
	}
	
	public static void main(String[] args) {
		System.out.println(md5("123456"));
	}

}
