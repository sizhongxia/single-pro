package com.single.pro.speech;

import java.util.HashMap;

import org.json.JSONObject;

import com.baidu.aip.nlp.AipNlp;
import com.baidu.aip.nlp.ESimnetType;
import com.baidu.aip.speech.AipSpeech;

public class BaiduAiSpeakUtil {
	public static final String APP_ID = "10461080";
	public static final String API_KEY = "FSIAkqtEHdNvtV5V9vIKzoQ9";
	public static final String SECRET_KEY = "PtQQCAGqBNeAvHMv0tgcGywyPLOR23oz";

	public static void main(String[] args) {
		sample();
		// // 初始化一个AipSpeech
		// AipSpeech client = new AipSpeech(APP_ID, API_KEY, SECRET_KEY);
		//
		// // 可选：设置网络连接参数
		// client.setConnectionTimeoutInMillis(2000);
		// client.setSocketTimeoutInMillis(60000);
		//
		// // 调用接口
		// //JSONObject res =
		// client.asr("C:\\Users\\sizho\\Downloads\\public\\public\\16k.pcm", "pcm",
		// 16000, null);
		//
		// JSONObject res2 = client.asr("D:\\REC003.wav", "wav", 16000, null);
		// //System.out.println(res);
		// System.out.println(res2);

	}

	public static void sample() {

		String clientId = "lr9cEWvOsqd0fdjH5DbaNwXO";
		// 官网获取的 Secret Key 更新为你注册的
		String clientSecret = "GASfaiBexnXCsmCF0CmGIRIBQHcRZYlu";

		AipNlp client = new AipNlp("9207972", clientId, clientSecret);

		// 传入可选参数调用接口
		HashMap<String, Object> options = new HashMap<String, Object>();
		options.put("model", "CNN");

		// 短文本相似度

		JSONObject res2 = client.depParser("你们这个项目便宜吗", null);

		// System.out.println(res2);

		// String target = "项目位置";
		// String target = "你们公司叫什么";
		String target = "这个酒店很不错";
		System.out.println(client.simnet("不可以", target, options).getDouble("score"));
		// System.out.println(client.simnet("你们这个项目的单价", target,
		// options).getDouble("score"));
		// System.out.println(client.simnet("你们这个项目多少钱", target,
		// options).getDouble("score"));
		// System.out.println(client.simnet("你们这个项目有优惠吗", target,
		// options).getDouble("score"));
		// System.out.println(client.simnet("你们项目在哪", target,
		// options).getDouble("score"));
		// System.out.println(client.simnet("你们公司在哪", target,
		// options).getDouble("score"));
		// System.out.println(client.simnet("你们公司叫啥", target,
		// options).getDouble("score"));

		String text = "百度是一家高科技公司";
		// 词法分析
		JSONObject res = client.lexer(text, new HashMap<String, Object>());
		System.out.println(res.toString(2));

		res = client.commentTag(target, ESimnetType.HOTEL, new HashMap<>());
		System.out.println(res.toString(2));

		String word1 = "北京";
		String word2 = "上海";

		// 传入可选参数调用接口
		HashMap<String, Object> options2 = new HashMap<String, Object>();
		options2.put("mode", 0);

		// 词义相似度
		res = client.wordSimEmbedding(word1, word2, options2);
		System.out.println(res.toString(2));

	}

}
