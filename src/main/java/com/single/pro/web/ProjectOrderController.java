package com.single.pro.web;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
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
import com.single.pro.cache.BaseDataCacheUtil;
import com.single.pro.entity.Order;
import com.single.pro.entity.Project;
import com.single.pro.entity.ProjectWork;
import com.single.pro.entity.User;
import com.single.pro.entity.UserWorker;
import com.single.pro.model.WorkerAptitudeUserModel;
import com.single.pro.service.OrderService;
import com.single.pro.service.ProjectService;
import com.single.pro.service.ProjectWorkService;
import com.single.pro.service.UserService;
import com.single.pro.service.UserWorkerService;
import com.single.pro.service.custom.WorkerAptitudeCustomService;
import com.xiaoleilu.hutool.date.DateUtil;

@Controller
@RequestMapping("project/order")
public class ProjectOrderController extends BaseController {

	@Autowired
	BaseDataCacheUtil baseDataCacheUtil;
	@Autowired
	OrderService orderService;
	@Autowired
	ProjectWorkService projectWorkService;
	@Autowired
	ProjectService projectService;
	@Autowired
	UserService userService;
	@Autowired
	UserWorkerService userWorkerService;
	@Autowired
	WorkerAptitudeCustomService workerAptitudeCustomService;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("project/order/index");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/data" }, method = { RequestMethod.POST })
	public Map<String, Object> data(HttpServletRequest request) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();

		String pageStr = request.getParameter("page");
		if (!NumberUtils.isDigits(pageStr) || new Integer(pageStr) < 1) {
			pageStr = "1";
		}
		String rowsStr = request.getParameter("rows");
		if (!NumberUtils.isDigits(rowsStr) || new Integer(rowsStr) > 1000 || new Integer(rowsStr) < 10) {
			rowsStr = "10";
		}

		Wrapper<Order> wrapper = new EntityWrapper<>();
		String orderNo = request.getParameter("orderNo");
		if (StringUtils.isNotBlank(orderNo)) {
			wrapper.eq("order_no", orderNo.trim());
		}
		String projectName = request.getParameter("projectName");
		if (StringUtils.isNotBlank(projectName)) {
			wrapper.like("project_name", projectName.trim());
		}
		String productCompany = request.getParameter("productCompany");
		if (StringUtils.isNotBlank(productCompany)) {
			wrapper.eq("product_company", productCompany.trim());
		}
		String productModel = request.getParameter("productModel");
		if (StringUtils.isNotBlank(productModel)) {
			wrapper.eq("product_model", productModel.trim());
		}
		String releaseStatus = request.getParameter("releaseStatus");
		if (StringUtils.isNotBlank(releaseStatus)) {
			wrapper.eq("release_status", releaseStatus.trim());
		}
		String orderStatus = request.getParameter("orderStatus");
		if (StringUtils.isNotBlank(orderStatus)) {
			wrapper.eq("order_status", orderStatus.trim());
		}
		String buildStatus = request.getParameter("buildStatus");
		if (StringUtils.isNotBlank(buildStatus)) {
			wrapper.eq("build_status", buildStatus.trim());
		}
		String rtime = request.getParameter("rtime");
		if (StringUtils.isNotBlank(rtime)) {
			String[] rtimes = rtime.split(" - ");
			if (rtimes.length == 2) {
				wrapper.ge("release_time", rtimes[0] + " 00:00:00");
				wrapper.le("release_time", rtimes[1] + " 23:59:59");
			}
		}
		String ctime = request.getParameter("ctime");
		if (StringUtils.isNotBlank(ctime)) {
			String[] ctimes = ctime.split(" - ");
			if (ctimes.length == 2) {
				wrapper.ge("create_time", ctimes[0] + " 00:00:00");
				wrapper.le("create_time", ctimes[1] + " 23:59:59");
			}
		}

		PageHelper.startPage(new Integer(pageStr), new Integer(rowsStr));
		List<Order> list = orderService.selectList(wrapper);
		PageInfo<Order> pageInfo = new PageInfo<Order>(list);
		List<Map<String, Object>> listMap = new ArrayList<>();

		if (list != null && list.size() > 0) {
			DecimalFormat df = new DecimalFormat("#0.00");
			Map<String, Object> _map = null;
			for (Order item : list) {
				_map = new HashMap<>();
				_map.put("id", item.getId());
				_map.put("projectName", item.getProjectName());

				_map.put("orderNo", item.getOrderNo());

				_map.put("customerId", item.getCustomerId());
				_map.put("customerName", item.getCustomerName());
				_map.put("workerId", item.getWorkerId());
				_map.put("workerName", item.getWorkerName());

				_map.put("productId", item.getProductId());
				_map.put("productName", item.getProductName());
				_map.put("productModel", item.getProductModel());
				_map.put("productCompany", item.getProductCompany());

				_map.put("orderCost", df.format(item.getOrderCost()));
				_map.put("depositCost", df.format(item.getDepositCost()));
				_map.put("paidCost", df.format(item.getPaidCost()));

				_map.put("releaseStatus", getReleaseStatusText(item.getReleaseStatus()));
				_map.put("orderStatus", getOrderStatusText(item.getOrderStatus()));
				_map.put("buildStatus", getBuildStatusText(item.getBuildStatus()));

				if ("Y".equals(item.getReleaseStatus())) {
					_map.put("releaseTime", DateUtil.format(item.getReleaseTime(), "yyyy-MM-dd HH:mm:ss"));
				} else {
					_map.put("releaseTime", "-");
				}

				_map.put("createTime", DateUtil.format(item.getCreateTime(), "yyyy-MM-dd HH:mm:ss"));
				listMap.add(_map);
			}
		}

		data.put("data", listMap);
		data.put("current", pageInfo.getPageNum());
		data.put("pageCount", pageInfo.getPages());

		return data;
	}

	private String getReleaseStatusText(String status) {
		switch (status) {
		case "Y":
			return "已发布";
		case "N":
			return "暂存";
		default:
			return "-";
		}
	}

	private String getBuildStatusText(String status) {
		switch (status) {
		case "Y":
			return "已完工";
		case "R":
			return "进行中";
		case "D":
			return "待施工";
		default:
			return "-";
		}
	}

	private String getOrderStatusText(String status) {
		switch (status) {
		case "Y":
			return "已完成";
		case "N":
			return "已取消";
		case "D":
			return "已接单";
		case "W":
			return "待工人确认";
		case "P":
			return "待平台确认";
		default:
			return "-";
		}
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/detail" }, method = { RequestMethod.GET })
	public ModelAndView detail(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("error/error");

		String id = request.getParameter("id");
		if (StringUtils.isBlank(id)) {
			mav.addObject("msg", "参数“id”丢失");
			return mav;
		}
		Order order = orderService.selectById(id);
		if (order == null) {
			mav.addObject("msg", "通过参数 id:" + id + " 未找到有效的订单信息");
			return mav;
		}

		ProjectWork projectWork = projectWorkService.selectById(order.getWorkId());
		if (projectWork == null) {
			mav.addObject("msg", "通过 id: " + order.getWorkId() + "未找到有效的项目工作批次");
			return mav;
		}
		Project project = projectService.selectById(projectWork.getProjectId());
		if (project == null) {
			mav.addObject("msg", "通过 id:" + projectWork.getProjectId() + " 未找到有效的项目");
			return mav;
		}

		User customerUser = userService.selectById(order.getCustomerId());
		if (customerUser == null) {
			mav.addObject("msg", "通过 id:" + order.getCustomerId() + " 未找到有效的客户");
			return mav;
		}
		if (StringUtils.isNotBlank(order.getWorkerId())) {
			User workerUser = userService.selectById(order.getWorkerId());
			if (workerUser == null) {
				mav.addObject("msg", "通过 id:" + order.getWorkerId() + " 未找到有效的工人");
				return mav;
			}
			mav.addObject("worker", workerUser);
		}

		project.setType(baseDataCacheUtil.getDictItemName(project.getType()));
		projectWork.setProvincial(baseDataCacheUtil.getCityName(projectWork.getProvincial()));
		projectWork.setCity(baseDataCacheUtil.getCityName(projectWork.getCity()));
		projectWork.setCounty(baseDataCacheUtil.getCityName(projectWork.getCounty()));

		Map<String, Object> orderSer = new HashMap<>();
		orderSer.put("survey", "Y".equals(order.getSerSurveyChoice()) ? "success" : "default");
		orderSer.put("surveyStatus", order.getSerSurveyStatus());
		orderSer.put("check", "Y".equals(order.getSerCheckChoice()) ? "success" : "default");
		orderSer.put("checkStatus", order.getSerCheckStatus());
		orderSer.put("construct", "Y".equals(order.getSerConstructChoice()) ? "success" : "default");
		orderSer.put("constructStatus", order.getSerConstructStatus());
		orderSer.put("train", "Y".equals(order.getSerTrainChoice()) ? "success" : "default");
		orderSer.put("trainStatus", order.getSerTrainStatus());
		orderSer.put("accept", "Y".equals(order.getSerAcceptChoice()) ? "success" : "default");
		orderSer.put("acceptStatus", order.getSerAcceptStatus());
		mav.addObject("orderSer", orderSer);

		order.setReleaseStatus(getReleaseStatusText(order.getReleaseStatus()));
		order.setBuildStatus(getBuildStatusText(order.getBuildStatus()));
		order.setOrderStatus(getOrderStatusText(order.getOrderStatus()));

		mav.addObject("order", order);
		mav.addObject("project", project);
		mav.addObject("projectWork", projectWork);
		mav.addObject("customer", customerUser);
		mav.setViewName("project/order/detail");
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/edit" }, method = { RequestMethod.GET })
	public ModelAndView edit(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("error/error");

		String id = request.getParameter("id");
		if (StringUtils.isBlank(id)) {
			mav.addObject("msg", "参数“id”丢失");
			return mav;
		}
		Order order = orderService.selectById(id);
		if (order == null) {
			mav.addObject("msg", "通过参数 id:" + id + " 未找到有效的订单信息");
			return mav;
		}

		Integer workerNo = 0;
		if (StringUtils.isNotBlank(order.getWorkerId())) {
			User workerUser = userService.selectById(order.getWorkerId());
			if (workerUser == null || !"W".equals(workerUser.getUserType())) {
				order.setWorkerId("");
				order.setWorkerName("");
				order.setWorkerAge(0);
				orderService.updateById(order);
				mav.addObject("msg", "无效劳务工人信息，并已清除劳务工人信息！");
				return mav;
			}
			Wrapper<UserWorker> workerWrapper = new EntityWrapper<>();
			workerWrapper.eq("user_id", workerUser.getId());
			UserWorker worker = userWorkerService.selectOne(workerWrapper);
			if (worker == null) {
				order.setWorkerId("");
				order.setWorkerName("");
				order.setWorkerAge(0);
				orderService.updateById(order);
				mav.addObject("msg", "无效劳务工人信息，并已清除劳务工人信息！");
				return mav;
			}
			workerNo = worker.getWorkerNo();
		}

		if (workerNo == null || workerNo.intValue() < 1) {
			mav.addObject("workerNo", "");
		} else {
			mav.addObject("workerNo", workerNo);
		}

		mav.addObject("surveyChoice", "Y".equals(order.getSerSurveyChoice()) ? "true" : "");
		mav.addObject("checkChoice", "Y".equals(order.getSerCheckChoice()) ? "true" : "");
		mav.addObject("constructChoice", "Y".equals(order.getSerConstructChoice()) ? "true" : "");
		mav.addObject("trainChoice", "Y".equals(order.getSerTrainChoice()) ? "true" : "");
		mav.addObject("acceptChoice", "Y".equals(order.getSerAcceptChoice()) ? "true" : "");

		mav.addObject("order", order);
		mav.addObject("csrf", baseDataCacheUtil.setPageCsrf("project_order_edit"));

		mav.setViewName("project/order/edit");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/workers" }, method = { RequestMethod.GET, RequestMethod.POST })
	public List<Map<String, Object>> workers(HttpServletRequest request) throws Exception {
		List<Map<String, Object>> list = new ArrayList<>();
		String query = request.getParameter("query");
		if (StringUtils.isBlank(query)) {
			return list;
		}
		String limit = request.getParameter("limit");
		Integer limitNum = NumberUtils.toInt(limit, 10);

		Map<String, Object> params = new HashMap<>();
		params.put("workerNo", query);
		params.put("offset", limitNum);
		List<WorkerAptitudeUserModel> workers = workerAptitudeCustomService.selectValidWorker(params);
		if (workers == null || workers.isEmpty()) {
			return list;
		}
		Map<String, Object> item = null;
		for (WorkerAptitudeUserModel user : workers) {
			item = new HashMap<>();
			item.put("label", user.getUserName());
			item.put("value", user.getWorkerNo());
			item.put("phoneNo", user.getPhoneNo());
			item.put("age", user.getAge());
			item.put("gradeLevel", user.getGradeLevel());
			item.put("evaluateTimes", user.getEvaluateTimes());
			list.add(item);
		}
		return list;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/update")
	public Map<String, Object> update(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String csrf = request.getParameter("csrf");
		if (StringUtils.isBlank(csrf)) {
			res.put("message", "无效的表单，E:01，请刷新页面后重试");
			return res;
		}
		String _csrf = baseDataCacheUtil.getPageCsrf("project_order_edit");
		if (_csrf == null) {
			res.put("message", "表单已失效，请刷新页面后重试");
			return res;
		}
		if (!csrf.equals(_csrf)) {
			res.put("message", "表单已失效，你可能在其他页面已打开该页面");
			return res;
		}

		String id = request.getParameter("id");
		if (StringUtils.isBlank(id)) {
			res.put("message", "未传入订单记录ID");
			return res;
		}

		String workerNo = request.getParameter("workerNo");
		if (StringUtils.isNotBlank(workerNo) && !NumberUtils.isDigits(workerNo)) {
			res.put("message", "工人编号格式不正确");
			return res;
		}

		String productNum = request.getParameter("productNum");
		if (StringUtils.isBlank(productNum)) {
			res.put("message", "请输入产品数量描述");
			return res;
		}

		String surveyChoice = request.getParameter("surveyChoice");
		if (StringUtils.isBlank(surveyChoice)) {
			surveyChoice = "false";
		}
		boolean surveyChoiceFlag = new Boolean(surveyChoice);

		String checkChoice = request.getParameter("checkChoice");
		if (StringUtils.isBlank(checkChoice)) {
			checkChoice = "false";
		}
		boolean checkChoiceFlag = new Boolean(checkChoice);

		String constructChoice = request.getParameter("constructChoice");
		if (StringUtils.isBlank(constructChoice)) {
			constructChoice = "false";
		}
		boolean constructChoiceFlag = new Boolean(constructChoice);
		if (!constructChoiceFlag) {
			res.put("message", "施工服务为必选项");
			return res;
		}

		String trainChoice = request.getParameter("trainChoice");
		if (StringUtils.isBlank(trainChoice)) {
			trainChoice = "false";
		}
		boolean trainChoiceFlag = new Boolean(trainChoice);
		if (!trainChoiceFlag) {
			res.put("message", "培训服务为必选项");
			return res;
		}

		String acceptChoice = request.getParameter("acceptChoice");
		if (StringUtils.isBlank(acceptChoice)) {
			acceptChoice = "false";
		}
		boolean acceptChoiceFlag = new Boolean(acceptChoice);
		if (!acceptChoiceFlag) {
			res.put("message", "验收服务为必选项");
			return res;
		}

		String expectTime = request.getParameter("expectTime");
		if (StringUtils.isBlank(expectTime)) {
			res.put("message", "请选择一个施工开始时间");
			return res;
		}

		String expectDays = request.getParameter("expectDays");
		if (!NumberUtils.isDigits(expectDays)) {
			res.put("message", "请输入施工天数");
			return res;
		}

		String remarks = request.getParameter("remarks");
		if (StringUtils.isBlank(remarks)) {
			remarks = "";
		}

		Order order = orderService.selectById(id);
		if (order == null) {
			res.put("message", "无效的订单ID");
			return res;
		}

		if (NumberUtils.isDigits(workerNo)) {
			Wrapper<UserWorker> wrapper = new EntityWrapper<>();
			wrapper.eq("worker_no", new Integer(workerNo));
			UserWorker userWorker = userWorkerService.selectOne(wrapper);
			if (userWorker == null) {
				res.put("message", "无效的工人编号");
				return res;
			}
			User user = userService.selectById(userWorker.getUserId());
			if (user == null) {
				res.put("message", "无效的用户信息");
				return res;
			}
			order.setWorkerId(user.getId());
			order.setWorkerAge(user.getAge());
			order.setWorkerName(user.getUserName());
		} else {
			order.setWorkerId("");
			order.setWorkerAge(0);
			order.setWorkerName("");
		}

		order.setProductNum(productNum);
		order.setSerSurveyChoice(surveyChoiceFlag ? "Y" : "N");
		order.setSerCheckChoice(checkChoiceFlag ? "Y" : "N");
		order.setSerConstructChoice(constructChoiceFlag ? "Y" : "N");
		order.setSerTrainChoice(trainChoiceFlag ? "Y" : "N");
		order.setSerAcceptChoice(acceptChoiceFlag ? "Y" : "N");
		order.setExpectTime(expectTime);
		order.setExpectDays(new Integer(expectDays));
		order.setRemarks(remarks);

		if (!orderService.updateById(order)) {
			res.put("message", "未知错误01");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

}
