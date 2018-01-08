package com.single.pro.quartz;

import org.apache.commons.lang3.StringUtils;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.single.pro.util.JsonUtil;
// 禁止并发执行多个相同定义的JobDetail
@DisallowConcurrentExecution
public class DisallowConcurrentJobFactory extends AbstractJobFactory implements org.quartz.Job {

	public void execute(JobExecutionContext context) throws JobExecutionException {
		String scheduleJob = (String) context.getMergedJobDataMap().get(JobManager.SCHEDULER_NAME);
		if (!StringUtils.isBlank(scheduleJob)) {
			QuartzJob job = JsonUtil.jsonToObj(scheduleJob, QuartzJob.class);
			invoke(job);
		}
	}
}