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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.single.pro.cache.BaseDataCacheUtil;
import com.single.pro.entity.Order;
import com.single.pro.service.CompanyService;
import com.single.pro.service.OrderService;
import com.single.pro.service.ProjectService;
import com.single.pro.service.ProjectWorkService;
import com.single.pro.service.UserService;
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
	CompanyService companyService;
	@Autowired
	UserService userService;

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

		Map<String, Object> params = new HashMap<>();
		String orderNo = request.getParameter("orderNo");
		if (StringUtils.isNotBlank(orderNo)) {
			params.put("orderNo", orderNo.trim());
		}
		String workNo = request.getParameter("workNo");
		if (StringUtils.isNotBlank(workNo)) {
			params.put("workNo", workNo.trim());
		}
		String productKind = request.getParameter("productKind");
		if (StringUtils.isNotBlank(productKind)) {
			params.put("productKind", productKind.trim());
		}
		String productType = request.getParameter("productType");
		if (StringUtils.isNotBlank(productType)) {
			params.put("productType", productType.trim());
		}
		String orderStatus = request.getParameter("orderStatus");
		if (StringUtils.isNotBlank(orderStatus)) {
			params.put("orderStatus", orderStatus.trim());
		}
		String buildStatus = request.getParameter("buildStatus");
		if (StringUtils.isNotBlank(buildStatus)) {
			params.put("buildStatus", buildStatus.trim());
		}
		String projectName = request.getParameter("projectName");
		if (StringUtils.isNotBlank(projectName)) {
			params.put("projectName", projectName.trim());
		}
		String ctime = request.getParameter("ctime");
		if (StringUtils.isNotBlank(ctime)) {
			String[] ctimes = ctime.split(" - ");
			if (ctimes.length == 2) {
				params.put("ctimeStart", ctimes[0] + " 00:00:00");
				params.put("ctimeEnd", ctimes[1] + " 23:59:59");
			}
		}

		PageHelper.startPage(new Integer(pageStr), new Integer(rowsStr));
		List<Order> list = orderService.selectList(null);
		PageInfo<Order> pageInfo = new PageInfo<Order>(list);
		List<Map<String, Object>> listMap = new ArrayList<>();

		if (list != null && list.size() > 0) {
			DecimalFormat df = new DecimalFormat("#0.00");
			Map<String, Object> _map = null;
			for (Order item : list) {
				_map = new HashMap<>();
				_map.put("id", item.getId());
				_map.put("orderNo", item.getOrderNo());
				_map.put("customerId", item.getCustomerId());
				_map.put("workerId", item.getWorkerId());
				_map.put("projectName", item.getProjectName());
				_map.put("productId", item.getProductId());
				_map.put("productName", item.getProductName());
				/*
				 * _map.put("productKind", item.getProductKind()); _map.put("productType",
				 * item.getProductType()); _map.put("productModel", item.getProductModel());
				 */
				_map.put("expectTime", item.getExpectTime());
				_map.put("expectDays", item.getExpectDays());
				_map.put("orderCost", df.format(item.getOrderCost()));
				_map.put("depositCost", df.format(item.getDepositCost()));
				_map.put("paidCost", df.format(item.getPaidCost()));
				_map.put("orderStatus", getOrderStatusText(item.getOrderStatus()));
				_map.put("buildStatus", getBuildStatusText(item.getBuildStatus()));
				_map.put("createTime", DateUtil.format(item.getCreateTime(), "yyyy-MM-dd HH:mm"));
				listMap.add(_map);
			}
		}

		data.put("data", listMap);
		data.put("current", pageInfo.getPageNum());
		data.put("pageCount", pageInfo.getPages());

		return data;
	}

	private Object getBuildStatusText(String status) {
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

//		ProjectProduct projectProduct = projectProductService.selectById(order.getProjectProductId());
//		if (projectProduct == null) {
//			mav.addObject("msg", "通过 id:" + order.getProjectProductId() + " 未找到有效的项目产品记录");
//			return mav;
//		}
//
//		ProjectWork projectWork = projectWorkService.selectById(projectProduct.getWorkNo());
//		if (projectWork == null) {
//			mav.addObject("msg", "通过 id: " + projectProduct.getWorkNo() + " 未找到有效的项目工作批次");
//			return mav;
//		}
//
//		Project project = projectService.selectById(projectWork.getProjectId());
//		if (project == null) {
//			mav.addObject("msg", "通过 id:" + projectWork.getProjectId() + " 未找到有效的项目");
//			return mav;
//		}

//		Company company = companyService.selectById(project.getCompanyId());
//		if (company == null) {
//			mav.addObject("msg", "通过 id:" + project.getCompanyId() + " 未找到有效的公司单位");
//			return mav;
//		}
//
//		User customerUser = userService.selectById(order.getCustomerId());
//		if (customerUser == null) {
//			mav.addObject("msg", "通过 id:" + order.getCustomerId() + " 未找到有效的客户");
//			return mav;
//		}
//		User workerUser = userService.selectById(order.getWorkerId());
//		if (workerUser == null) {
//			mav.addObject("msg", "通过 id:" + order.getWorkerId() + " 未找到有效的工人");
//			return mav;
//		}
//
//		mav.addObject("orderNo", order.getOrderNo());
//		mav.addObject("orderTime", DateUtil.format(order.getCreateTime(), "yyyy-MM-dd HH:mm:ss"));
//		mav.addObject("projectName", project.getName());
//		mav.addObject("workNo", projectWork.getWorkNo());
//		mav.addObject("city", baseDataCacheUtil.getCityName(project.getCity()));
//		mav.addObject("address", project.getAddress());
//		mav.addObject("companyName", company.getName());
//		mav.addObject("companyContacts", company.getContacts());
//		mav.addObject("companyContactTel", company.getContactTel());
//		mav.addObject("customerName", customerUser.getUserName());
//		mav.addObject("customerTel", customerUser.getPhoneNo());
//		mav.addObject("workerName", workerUser.getUserName());
//		mav.addObject("workerTel", workerUser.getPhoneNo());
//		mav.addObject("productName", order.getProductName());
//		mav.addObject("productModel", order.getProductModel());
//		mav.addObject("productKindName", order.getProductKind());
//		mav.addObject("productTypeName", order.getProductType());
//		mav.addObject("expectStime", DateUtil.format(order.getExpectStime(), "yyyy-MM-dd"));
//		mav.addObject("expectDays", order.getExpectDays());
//		mav.addObject("orderCost", order.getOrderCost());
//		mav.addObject("depositCost", order.getDepositCost());
//		mav.addObject("paidCost", order.getPaidCost());
//		mav.addObject("orderStatus", getOrderStatusText(order.getOrderStatus()));
//		mav.addObject("buildStatus", getBuildStatusText(order.getBuildStatus()));
//		mav.addObject("cancleReason", order.getCancleReason());
//		mav.addObject("remarks", order.getRemarks());
//		mav.addObject("workerGrade", order.getWorkerGrade());
//		mav.addObject("workerCtime", DateUtil.format(order.getWorkerCTime(), "yyyy-MM-dd HH:mm:ss"));
//		mav.addObject("workerComment", order.getWorkerComment());
//		mav.addObject("customerGrade", order.getCustomerGrade());
//		mav.addObject("customerCtime", DateUtil.format(order.getCustomerCTime(), "yyyy-MM-dd HH:mm:ss"));
//		mav.addObject("customerComment", order.getCustomerComment());
//		mav.setViewName("project/order/detail");
		return mav;
	}

}
