package com.single.pro.util;

import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.xiaoleilu.hutool.json.JSONUtil;

/**
 * FastJson 序列化工具
 */
public final class JsonUtil {

	private static final SerializerFeature[] features = { SerializerFeature.WriteMapNullValue,
			SerializerFeature.WriteNullBooleanAsFalse, SerializerFeature.WriteNullStringAsEmpty,
			SerializerFeature.WriteNullListAsEmpty, SerializerFeature.WriteNullNumberAsZero };

	// 对象转换成json
	public static String objToJson(Object obj) {
		return JSON.toJSONString(obj, features);
	}

	// json 转换成对象
	@SuppressWarnings("unchecked")
	public static <T> T jsonToObj(String json, Class<?> clazz) {
		return (T) JSON.parseObject(json, clazz);
	}
	
	public static String mapToJson(Map<String, Object> map) {
		return JSONUtil.parseFromMap(map).toString();
	}
}