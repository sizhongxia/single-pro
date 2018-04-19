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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.single.pro.cache.BaseDataCacheUtil;
import com.single.pro.entity.Company;
import com.single.pro.entity.Product;
import com.single.pro.entity.User;
import com.single.pro.entity.WorkerAptitude;
import com.single.pro.model.WorkerAptitudeModel;
import com.single.pro.service.CompanyService;
import com.single.pro.service.ProductService;
import com.single.pro.service.UserService;
import com.single.pro.service.WorkerAptitudeService;
import com.single.pro.service.custom.WorkerAptitudeCustomService;
import com.xiaoleilu.hutool.date.DateUtil;

@Controller
@RequestMapping("worker/aptitude")
public class WorkerAptitudeController extends BaseController {

	@Autowired
	WorkerAptitudeService workerAptitudeService;
	@Autowired
	WorkerAptitudeCustomService workerAptitudeCustomService;
	@Autowired
	UserService userService;
	@Autowired
	ProductService productService;
	@Autowired
	CompanyService companyService;
	@Autowired
	BaseDataCacheUtil baseDataCacheUtil;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("worker/aptitude/index");
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
		String phoneNo = request.getParameter("phoneNo");
		if (StringUtils.isNotBlank(phoneNo)) {
			params.put("phoneNo", phoneNo.trim());
		}
		String applyStatus = request.getParameter("applyStatus");
		if (StringUtils.isNotBlank(applyStatus)) {
			params.put("applyStatus", applyStatus.trim());
		}
		String atime = request.getParameter("atime");
		if (StringUtils.isNotBlank(atime)) {
			params.put("applyTimeStart", atime + " 00:00:00");
			params.put("applyTimeEnd", atime + " 23:59:59");
		}

		PageHelper.startPage(new Integer(pageStr), new Integer(rowsStr));
		List<WorkerAptitudeModel> list = workerAptitudeCustomService.findWorkerAptitudes(params);
		PageInfo<WorkerAptitudeModel> pageInfo = new PageInfo<WorkerAptitudeModel>(list);

		List<Map<String, Object>> listMap = new ArrayList<>();

		if (list != null && list.size() > 0) {
			Map<String, Object> _map = null;
			for (WorkerAptitudeModel item : list) {
				_map = new HashMap<>();
				_map.put("id", item.getId());
				_map.put("userName", item.getUserName());
				_map.put("phoneNo", item.getPhoneNo());
				_map.put("gender", item.getGender() == 0 ? "女" : "男");
				_map.put("productName", item.getProductName());
				_map.put("productModel", item.getProductModel());
				_map.put("kindName", baseDataCacheUtil.getProductKindNameById(item.getKindId()));
				_map.put("typeName", baseDataCacheUtil.getProductTypeNameById(item.getTypeId()));
				_map.put("city", baseDataCacheUtil.getCityName(item.getCity()));
				_map.put("companyName", item.getCompanyName());
				_map.put("applyStatus", getWorkerAptitudeApplyStatusTxt(item.getApplyStatus()));
				if (("Y".equals(item.getApplyStatus()) || "N".equals(item.getApplyStatus()))
						&& item.getHandleTime() != null) {
					_map.put("canToApproval", 0);
					_map.put("approvalTime", DateUtil.format(item.getHandleTime(), "yyyy-MM-dd"));
				} else {
					_map.put("canToApproval", 1);
					_map.put("approvalTime", "-");
				}

				_map.put("applyTime", DateUtil.format(item.getApplyTime(), "yyyy-MM-dd"));
				listMap.add(_map);
			}
		}

		data.put("data", listMap);
		data.put("current", pageInfo.getPageNum());
		data.put("pageCount", pageInfo.getPages());

		return data;
	}

	private String getWorkerAptitudeApplyStatusTxt(String applyStatus) {
		if ("Y".equals(applyStatus)) {
			return "申请通过";
		} else if ("N".equals(applyStatus)) {
			return "申请驳回";
		} else if ("D".equals(applyStatus)) {
			return "待处理";
		}
		return "-";
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/detail" }, method = { RequestMethod.GET })
	public ModelAndView detail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("worker/aptitude/detail");

		String id = request.getParameter("id");
		if (StringUtils.isBlank(id)) {
			mav = new ModelAndView("error/error");
			mav.addObject("msg", "缺失参数：id");
			return mav;
		}
		WorkerAptitude workerAptitude = workerAptitudeService.selectById(id);
		if (workerAptitude == null) {
			mav = new ModelAndView("error/error");
			mav.addObject("msg", "通过参数 id:" + id + " 未找到有效的资质申请记录");
			return mav;
		}
		User worker = userService.selectById(workerAptitude.getWorkerId());
		if (worker == null) {
			mav = new ModelAndView("error/error");
			mav.addObject("msg", "无效的工人信息");
			return mav;
		}
		Product product = productService.selectById(workerAptitude.getProductId());
		if (product == null) {
			mav = new ModelAndView("error/error");
			mav.addObject("msg", "无效的产品信息");
			return mav;
		}
		Company company = companyService.selectById(product.getCompanyId());
		if (company == null) {
			mav = new ModelAndView("error/error");
			mav.addObject("msg", "无效的产品厂商信息");
			return mav;
		}
		mav.addObject("workerAptitude", workerAptitude);
		mav.addObject("city", baseDataCacheUtil.getCityName(workerAptitude.getCity()));
		mav.addObject("worker", worker);
		mav.addObject("gender", worker.getGender() == 0 ? "女" : "男");
		mav.addObject("product", product);
		mav.addObject("kindName", baseDataCacheUtil.getProductKindNameById(product.getKindId()));
		mav.addObject("typeName", baseDataCacheUtil.getProductTypeNameById(product.getTypeId()));
		mav.addObject("company", company);
		mav.addObject("applyStatus", getWorkerAptitudeApplyStatusTxt(workerAptitude.getApplyStatus()));
		mav.addObject("applyTime", DateUtil.format(workerAptitude.getApplyTime(), "yyyy-MM-dd"));
		return mav;
	}

	/***
	 * 申请审批处理
	 * 
	 * @param request
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value = { "/approval" }, method = { RequestMethod.GET })
	public ModelAndView approval(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("worker/aptitude/approval");
		String id = request.getParameter("id");
		if (StringUtils.isBlank(id)) {
			mav = new ModelAndView("error/error");
			mav.addObject("msg", "缺失参数：id");
			return mav;
		}
		WorkerAptitude workerAptitude = workerAptitudeService.selectById(id);
		if (workerAptitude == null) {
			mav = new ModelAndView("error/error");
			mav.addObject("msg", "通过参数 id:" + id + " 未找到有效的资质申请记录");
			return mav;
		}
		if ("Y".equals(workerAptitude.getApplyStatus()) || "N".equals(workerAptitude.getApplyStatus())) {
			mav = new ModelAndView("error/error");
			mav.addObject("msg", "当前申请记录已被处理");
			return mav;
		}
		mav.addObject("id", workerAptitude.getId());
		mav.addObject("applyTime", DateUtil.format(workerAptitude.getApplyTime(), "yyyy-MM-dd"));
		mav.addObject("applyStatus", workerAptitude.getApplyStatus());
		mav.addObject("applyStatusTxt", getWorkerAptitudeApplyStatusTxt(workerAptitude.getApplyStatus()));
		mav.addObject("applyInfo", workerAptitude.getApplyInfo());
		mav.addObject("csrf", baseDataCacheUtil.setPageCsrf("worker_aptitude_approval"));
		return mav;
	}

	/***
	 * 处理
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/handle")
	public Map<String, Object> handle(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String csrf = request.getParameter("csrf");
		if (StringUtils.isBlank(csrf)) {
			res.put("message", "无效的表单，E:01，请刷新页面后重试");
			return res;
		}
		String _csrf = baseDataCacheUtil.getPageCsrf("worker_aptitude_approval");
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
			res.put("message", "无效的参数");
			return res;
		}

		WorkerAptitude workerAptitude = workerAptitudeService.selectById(id);
		if (workerAptitude == null) {
			res.put("message", "无效的参数");
			return res;
		}

		if ("Y".equals(workerAptitude.getApplyStatus()) || "N".equals(workerAptitude.getApplyStatus())) {
			res.put("message", "状态已被更改");
			res.put("applyStatus", workerAptitude.getApplyStatus());
			return res;
		}

		String applyStatus = request.getParameter("applyStatus");
		if (workerAptitude.getApplyStatus().equals(applyStatus)) {
			res.put("message", "状态未改变");
			return res;
		}
		workerAptitude.setApplyStatus(applyStatus);
		workerAptitude.setUpdateTime(new Date());

		if (!workerAptitudeService.updateById(workerAptitude)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

}
