package com.single.pro.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.single.pro.entity.Job;
import com.single.pro.quartz.JobManager;
import com.single.pro.service.JobService;

@Controller
@RequestMapping("timedTask")
public class TimedTaskController extends BaseController {

	@Autowired
	JobService jobService;
	@Autowired
	JobManager jobManager;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("timedTask/index");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/list" }, method = { RequestMethod.POST })
	public Map<String, Object> list(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();

		Wrapper<Job> wrapper = new EntityWrapper<>();

		String pageStr = request.getParameter("page");
		if (!NumberUtils.isDigits(pageStr)) {
			pageStr = "1";
		}
		String rowsStr = request.getParameter("rows");
		if (!NumberUtils.isDigits(rowsStr)) {
			rowsStr = "20";
		}
		String sort = request.getParameter("sort");
		String order = request.getParameter("order");

		if (StringUtils.isNotBlank(sort) && StringUtils.isNotBlank(order)) {
			wrapper.orderBy(sort, "asc".equals(order));
		}

		PageHelper.startPage(new Integer(pageStr), new Integer(rowsStr));
		List<Job> jobs = jobService.selectList(wrapper);
		PageInfo<Job> pageInfo = new PageInfo<>(jobs);

		List<Map<String, Object>> systemJobList = new ArrayList<>();
		if (jobs != null && !jobs.isEmpty()) {
			Map<String, Object> item = null;
			for (Job job : jobs) {
				item = new HashMap<>();
				item.put("id", job.getId());
				item.put("name", job.getName());
				item.put("group", job.getGroup());
				String status = jobManager.getJobStatus(job.getId(), job.getGroup());
				item.put("run_status", status);
				item.put("cron", job.getCron());
				// NONE, NORMAL, PAUSED, COMPLETE, ERROR, BLOCKED
				if ("NORMAL".equals(status) || "COMPLETE".equals(status) || "BLOCKED".equals(status)) {
					item.put("next_execure_time", jobManager.nextExecureTime(job.getCron()));
				} else {
					item.put("next_execure_time", "-");
				}
				item.put("clazz_name", job.getClazzName());
				item.put("is_concurrent", job.getIsConcurrent());
				item.put("is_startup_execution", job.getIsStartupExecution());
				item.put("description", job.getDescription());
				item.put("create_time", job.getCreateTime());
				item.put("update_time", job.getUpdateTime());
				systemJobList.add(item);
			}
		}

		res.put("rows", systemJobList);

		res.put("currentPage", pageInfo.getPageNum());
		res.put("firstPage", pageInfo.isIsFirstPage());
		res.put("lastPage", pageInfo.isIsLastPage());
		res.put("numPerPage", pageInfo.getPrePage());
		res.put("totalPage", pageInfo.getPages());
		res.put("total", pageInfo.getTotal());

		return res;
	}

	/***
	 * 暂停任务
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/stop")
	public Map<String, Object> stop(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			res.put("message", "无效的参数");
			return res;
		}

		Job job = jobService.selectById(id);
		if (job == null) {
			res.put("message", "无效的参数");
			return res;
		}
		try {
			if (jobManager.pauseJob(job.getId(), job.getGroup())) {
				res.put("statusCode", 200);
				res.put("message", "已暂停");
				return res;
			}
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
		res.put("message", "操作失败，可能任务已停止运行");
		return res;
	}

	/***
	 * 启动任务
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/start")
	public Map<String, Object> start(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			res.put("message", "无效的参数");
			return res;
		}

		Job job = jobService.selectById(id);
		if (job == null) {
			res.put("message", "无效的参数");
			return res;
		}
		try {
			if (jobManager.resumeJob(job.getId(), job.getGroup(), job.getCron())) {
				res.put("statusCode", 200);
				res.put("message", "已启动");
				return res;
			}
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
		res.put("message", "操作失败");
		return res;
	}

	/***
	 * 立即执行任务
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/run")
	public Map<String, Object> run(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			res.put("message", "无效的参数");
			return res;
		}

		Job job = jobService.selectById(id);
		if (job == null) {
			res.put("message", "无效的参数");
			return res;
		}
		try {
			if (jobManager.triggerJob(job.getId(), job.getGroup())) {
				res.put("statusCode", 200);
				res.put("message", "立即执行");
				return res;
			}
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
		res.put("message", "操作失败，可能任务未启动");
		return res;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/form" }, method = { RequestMethod.GET })
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("timedTask/form");
		return mav;
	}

	/***
	 * 任务详情
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/detail")
	public Job detail(HttpServletRequest request) {
		Job job = null;
		String id = request.getParameter("id");
		job = jobService.selectById(id);
		if (job == null) {
			job = new Job();
		}
		return job;
	}

	/***
	 * 更新任务
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/update")
	public Map<String, Object> update(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			res.put("message", "无效的参数");
			return res;
		}

		Job job = jobService.selectById(id);
		if (job == null) {
			res.put("message", "无效的参数");
			return res;
		}

		job.setName(request.getParameter("name"));
		job.setGroup(request.getParameter("group"));
		job.setCron(request.getParameter("cron"));
		String isConcurrent = request.getParameter("isConcurrent");
		if (NumberUtils.isDigits(isConcurrent)) {
			job.setIsConcurrent(new Integer(isConcurrent));
		} else {
			job.setIsConcurrent(0);
		}
		String isStartupExecution = request.getParameter("isStartupExecution");
		if (NumberUtils.isDigits(isStartupExecution)) {
			job.setIsStartupExecution(new Integer(isStartupExecution));
		} else {
			job.setIsStartupExecution(0);
		}
		job.setDescription(request.getParameter("description"));
		Date now = new Date();
		job.setUpdateTime(now);

		if (!jobService.updateById(job)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

}
