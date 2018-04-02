package com.single.pro.model;

import java.io.Serializable;

public class SqlSearchModel implements Serializable {
	private static final long serialVersionUID = 1L;
	private String field;
	private String operator;
	private String value;

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "SqlSearchModel [field=" + field + ", operator=" + operator + ", value=" + value + "]";
	}

}
