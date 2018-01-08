package com.single.pro.quartz;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.apache.commons.lang3.StringUtils;

import com.single.pro.util.SpringBeanUtil;

public class AbstractJobFactory {

	public void invoke(QuartzJob job) {
		if (!StringUtils.isBlank(job.getJobClassName())) {
			try {
				Class<?> clazz = Class.forName(job.getJobClassName());
				Object obj = SpringBeanUtil.getBeanByType(clazz);
				Method method = obj.getClass().getDeclaredMethod("run");
				method.invoke(obj);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
		}
	}
}