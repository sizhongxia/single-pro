package com.single.pro.speech;

import org.json.JSONObject;

import com.baidu.aip.speech.AipSpeech;

public class BaiduAiSpeakUtil {
	public static final String APP_ID = "10461080";
	public static final String API_KEY = "FSIAkqtEHdNvtV5V9vIKzoQ9";
	public static final String SECRET_KEY = "PtQQCAGqBNeAvHMv0tgcGywyPLOR23oz";

	public static void main(String[] args) {
		// 初始化一个AipSpeech
		AipSpeech client = new AipSpeech(APP_ID, API_KEY, SECRET_KEY);

		// 可选：设置网络连接参数
		client.setConnectionTimeoutInMillis(2000);
		client.setSocketTimeoutInMillis(60000);

		// 调用接口
		//JSONObject res = client.asr("C:\\Users\\sizho\\Downloads\\public\\public\\16k.pcm", "pcm", 16000, null);
		
		JSONObject res2 = client.asr("D:\\REC003.wav", "wav", 16000, null);
		//System.out.println(res);
		System.out.println(res2);

	}
}
