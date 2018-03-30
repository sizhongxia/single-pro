package com.single.pro.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.single.pro.model.SqlSearchModel;

public class AdvanceFilterUtil {

	public static Map<String, Object> initSerachParams(String advanceFilter, Set<String> exclusionFields, String alias,
			Map<String, Object> params) {

		if (StringUtils.isBlank(advanceFilter)) {
			return params;
		}

		JSONArray filters = JSONArray.parseArray(advanceFilter);
		if (filters == null) {
			return params;
		}
		List<SqlSearchModel> searchParams = new ArrayList<>();
		SqlSearchModel model = null;
		for (int i = 0; i < filters.size(); i++) {
			JSONObject obj = (JSONObject) filters.get(i);
			model = new SqlSearchModel();
			String field = obj.getString("field");
			String value = obj.getString("value");
			String op = obj.getString("op");

			if (StringUtils.isNotBlank(field) && StringUtils.isNotBlank(value) && !exclusionFields.contains(field)) {
				model.setField(alias + field);
				model.setValue(value);
				switch (op) {
				case "contains":
					model.setOperator("like");
					model.setValue("%" + value + "%");
					break;
				case "equal":
					model.setOperator("=");
					break;
				case "notequal":
					model.setOperator("!=");
					break;
				case "greater":
					model.setOperator(">");
					break;
				case "greaterorequal":
					model.setOperator(">=");
					break;
				case "less":
					model.setOperator("<");
					break;
				case "lessorequal":
					model.setOperator("<=");
					break;
				case "beginwith":
					model.setOperator("like");
					model.setValue(value + "%");
					break;
				case "endwith":
					model.setOperator("like");
					model.setValue("%" + value);
					break;
				default:
					model.setOperator("like");
					model.setValue("%" + value + "%");
					break;
				}
				searchParams.add(model);
			}
		}

		params.put("searchParams", searchParams);
		return params;
	}

}
