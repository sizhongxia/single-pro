package com.single.pro.quartz;

import org.apache.commons.lang3.StringUtils;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.single.pro.util.JsonUtil;

public class AllowConcurrentJobFactory extends AbstractJobFactory implements org.quartz.Job {

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		String scheduleJob = (String) context.getMergedJobDataMap().get(JobManager.SCHEDULER_NAME);
		if (!StringUtils.isBlank(scheduleJob)) {
			QuartzJob job = JsonUtil.jsonToObj(scheduleJob, QuartzJob.class);
			invoke(job);
		}
	}

}
