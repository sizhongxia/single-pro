package com.single.pro.util;

import com.xiaoleilu.hutool.crypto.digest.DigestAlgorithm;
import com.xiaoleilu.hutool.crypto.digest.Digester;

public class ShaUtil {
	public static String sha1(String str) {
		Digester sha = new Digester(DigestAlgorithm.SHA1);
		return sha.digestHex(str);
	}

	public static String sha256(String str) {
		Digester sha = new Digester(DigestAlgorithm.SHA256);
		return sha.digestHex(str);
	}

	public static String sha512(String str) {
		Digester sha = new Digester(DigestAlgorithm.SHA512);
		return sha.digestHex(str);
	}
}
