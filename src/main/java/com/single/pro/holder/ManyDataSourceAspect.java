package com.single.pro.holder;

import java.lang.reflect.Method;

import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.reflect.MethodSignature;

import com.single.pro.anno.DataSource;

public class ManyDataSourceAspect {
	public void switchDB(JoinPoint point) throws Exception {
		Signature signature = point.getSignature();
		// 拦截的参数
		Class<?>[] parameterTypes = ((MethodSignature) signature).getMethod().getParameterTypes();
		// 拦截的实体类
		Object target = point.getTarget();
		Class<?>[] clazzs = target.getClass().getInterfaces();
		Class<?> clazz = null;
		if (clazzs != null && clazzs.length > 0) {
			clazz = clazzs[0];
		}
		// 拦截的方法
		String methodName = signature.getName();
		// 拿到类的方法级别注解
		Method m = target.getClass().getMethod(methodName, parameterTypes);
		if (m != null && m.isAnnotationPresent(DataSource.class)) {
			// 注解对象
			DataSource ds = m.getAnnotation(DataSource.class);
			if (ds != null && StringUtils.isNotBlank(ds.value())) {
				CustomerContextHolder.setCustomerType(ds.value());
				return;
			}
		}
		// 拿接口中的方法级别的注解
		m = clazz.getMethod(methodName, parameterTypes);
		if (m != null && m.isAnnotationPresent(DataSource.class)) {
			DataSource ds = m.getAnnotation(DataSource.class);
			if (ds != null && StringUtils.isNotBlank(ds.value())) {
				CustomerContextHolder.setCustomerType(ds.value());
				return;
			}
		}
		// 拿到类级别的注解
		DataSource ds = (DataSource) clazz.getAnnotation(DataSource.class);
		if (ds != null && StringUtils.isNotBlank(ds.value())) {
			CustomerContextHolder.setCustomerType(ds.value());
			return;
		}
	}
}
