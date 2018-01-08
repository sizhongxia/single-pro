package com.single.pro.quartz;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.SchedulerException;
import org.quartz.Trigger.TriggerState;
import org.quartz.TriggerBuilder;
import org.quartz.TriggerKey;
import org.quartz.impl.StdScheduler;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.support.CronSequenceGenerator;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.single.pro.entity.Job;
import com.single.pro.entity.JobGroup;
import com.single.pro.service.JobGroupService;
import com.single.pro.service.JobService;
import com.single.pro.util.JsonUtil;

/**
 * 任务调度管理器， 实现任务的动态操作
 */
public class JobManager implements InitializingBean {

	@Autowired
	private JobService jobService;
	@Autowired
	private JobGroupService jobGroupService;

	private DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	// 调度名称
	public static final String SCHEDULER_NAME = "scheduler";
	// 为调度管理器注入工厂bean
	private StdScheduler scheduler;

	public void setScheduler(StdScheduler scheduler) {
		this.scheduler = scheduler;
	}

	// 添加任务
	public void addJob(QuartzJob job) throws SchedulerException {
		if (job == null)
			return;
		if (StringUtils.isBlank(job.getJobId()))
			return;
		if (StringUtils.isBlank(job.getJobGroup()))
			return;
		if (StringUtils.isBlank(job.getCronExpression()))
			return;
		if (StringUtils.isBlank(job.getJobClassName()))
			return;
		addCronJob(job);
	}

	// 添加 cron 表达式任务
	private void addCronJob(QuartzJob job) throws SchedulerException {
		// 根据任务id和任务组Id创建触发器key
		TriggerKey triggerKey = TriggerKey.triggerKey(job.getJobId(), job.getJobGroup());
		// 获取触发器对象
		CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);
		// 不存在，创建一个
		if (null == trigger) {
			JobDetail jobDetail = JobBuilder
					.newJob("Y".equals(job.getConcurrent()) ? AllowConcurrentJobFactory.class
							: DisallowConcurrentJobFactory.class)
					.withIdentity(job.getJobId(), job.getJobGroup()).build();
			jobDetail.getJobDataMap().put(SCHEDULER_NAME, JsonUtil.objToJson(job));
			trigger = TriggerBuilder.newTrigger().withIdentity(triggerKey)
					.withSchedule(CronScheduleBuilder.cronSchedule(job.getCronExpression())).build();
			scheduler.scheduleJob(jobDetail, trigger);
		}
	}

	/**
	 * 获取所有计划中的任务列表
	 * 
	 * @return
	 * @throws SchedulerException
	 **/
	public List<QuartzJob> getAllJobs() throws SchedulerException {
		List<QuartzJob> jobs = transformationJobs();

		if (jobs == null || jobs.isEmpty()) {
			return null;
		}
		CronSequenceGenerator cronGenerator = null;
		for (QuartzJob job : jobs) {
			job.setJobStatus(getJobStatus(job));
			cronGenerator = new CronSequenceGenerator(job.getCronExpression());
			if (job.getJobStatus().equals("NORMAL") || job.getJobStatus().equals("BLOCKED")
					|| job.getJobStatus().equals("COMPLETE")) {
				job.setNextExecureTime(dateFormat.format(cronGenerator.next(new Date()).getTime()));
			} else {
				job.setNextExecureTime("-");
			}
		}
		return jobs;
	}

	private List<QuartzJob> transformationJobs() {
		List<QuartzJob> jobs = new ArrayList<>();
		List<Job> _jobs = jobService.selectList(null);
		if (_jobs != null && !_jobs.isEmpty()) {
			CronSequenceGenerator cronGenerator = null;
			for (Job job : _jobs) {
				QuartzJob jb = new QuartzJob();
				jb.setDescription(job.getDescription());
				jb.setJobId(job.getJobId());
				jb.setJobName(job.getJobName());
				JobGroup jobGroup = jobGroupService.selectById(job.getGroupId());
				jb.setJobGroup(jobGroup.getGroupId());
				jb.setJobGroupName(jobGroup.getGroupName());
				jb.setJobStatus(job.getStatus());
				jb.setJobClassName(job.getClazzName());
				jb.setCronExpression(job.getCron());
				cronGenerator = new CronSequenceGenerator(job.getCron());
				jb.setNextExecureTime(dateFormat.format(cronGenerator.next(new Date())));
				jb.setConcurrent(job.getIsConcurrent() == 1 ? "Y" : "N");
				jb.setStartupExecution(job.getIsStartupExecution() == 1 ? "Y" : "N");
				jb.setCreateTime(dateFormat.format(new Date(job.getCreateTime())));
				jb.setUpdateTime(dateFormat.format(new Date(job.getUpdateTime())));
				jobs.add(jb);
			}
		}
		return jobs;
	}

	// 更新调度任务的调度时间
	public boolean updateJobCron(QuartzJob job) throws SchedulerException {
		TriggerKey triggerKey = TriggerKey.triggerKey(job.getJobId(), job.getJobGroup());
		if (scheduler.checkExists(triggerKey)) {
			CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);
			trigger = trigger.getTriggerBuilder().withIdentity(triggerKey)
					.withSchedule(CronScheduleBuilder.cronSchedule(job.getCronExpression())).build();
			scheduler.rescheduleJob(triggerKey, trigger);
			Job _job = jobService.selectById(job.getJobId());
			_job.setCron(job.getCronExpression());
			_job.setIsConcurrent("Y".equals(job.getConcurrent()) ? 1 : 0);
			_job.setIsStartupExecution("Y".equals(job.getStartupExecution()) ? 1 : 0);
			if (jobService.updateById(_job)) {
				return true;
			}
		}
		return false;
	}

	// 暂停一个调度任务
	public boolean pauseJob(QuartzJob job) throws SchedulerException {
		JobKey jobKey = JobKey.jobKey(job.getJobId(), job.getJobGroup());
		if (scheduler.checkExists(jobKey)) {
			scheduler.pauseJob(jobKey);
			return true;
		}
		return false;
	}

	// 恢复一个调度任务
	public boolean resumeJob(QuartzJob job) throws SchedulerException {
		JobKey jobKey = JobKey.jobKey(job.getJobId(), job.getJobGroup());
		if (scheduler.checkExists(jobKey)) {
			scheduler.resumeJob(jobKey);
		} else {
			if (StringUtils.isBlank(job.getCronExpression())) {
				return false;
			}
			Job _job = jobService.selectById(job.getJobId());
			job.setJobClassName(_job.getClazzName());
			addJob(job);
		}
		return true;
	}

	// 删除一个调度任务
	public boolean deleteJob(QuartzJob scheduleJob) throws SchedulerException {
		JobKey jobKey = JobKey.jobKey(scheduleJob.getJobId(), scheduleJob.getJobGroup());
		if (scheduler.checkExists(jobKey)) {
			scheduler.deleteJob(jobKey);
			return true;
		}
		return false;
	}

	// 立即执行默个调度任务
	public boolean triggerJob(QuartzJob job) throws SchedulerException {
		JobKey jobKey = JobKey.jobKey(job.getJobId(), job.getJobGroup());
		if (scheduler.checkExists(jobKey)) {
			scheduler.triggerJob(jobKey);
			return true;
		}
		return false;
	}

	// 获取Job状态
	public String getJobStatus(QuartzJob job) throws SchedulerException {
		TriggerKey triggerKey = new TriggerKey(job.getJobId(), job.getJobGroup());
		if (scheduler.checkExists(triggerKey)) {
			TriggerState state = scheduler.getTriggerState(triggerKey);
			return state.name();
		}
		return TriggerState.NONE.name();
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		Job entity = new Job();
		entity.setIsStartupExecution(1);
		Wrapper<Job> wrapper = new EntityWrapper<Job>(entity);
		List<Job> jobs = jobService.selectList(wrapper);
		if (jobs != null && !jobs.isEmpty()) {
			for (Job job : jobs) {
				QuartzJob jb = new QuartzJob();
				jb.setJobId(job.getJobId());
				JobGroup jobGroup = jobGroupService.selectById(job.getGroupId());
				jb.setJobGroup(jobGroup.getGroupId());
				jb.setJobClassName(job.getClazzName());
				jb.setCronExpression(job.getCron());
				jb.setConcurrent(job.getIsConcurrent() == 1 ? "Y" : "N");
				addJob(jb);
			}
		}
	}

}
