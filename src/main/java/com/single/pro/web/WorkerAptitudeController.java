package com.single.pro.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import com.single.pro.entity.WorkerAptitude;
import com.single.pro.model.WorkerAptitudeModel;
import com.single.pro.service.WorkerAptitudeService;
import com.single.pro.service.custom.WorkerAptitudeCustomService;
import com.single.pro.util.AdvanceFilterUtil;

@Controller
@RequestMapping("worker/aptitude")
public class WorkerAptitudeController extends BaseController {

	@Autowired
	WorkerAptitudeService workerAptitudeService;
	@Autowired
	WorkerAptitudeCustomService workerAptitudeCustomService;
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
	@RequestMapping(value = { "/list" }, method = { RequestMethod.POST })
	public Map<String, Object> list(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();

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

		Map<String, Object> params = new HashMap<>();
		if (StringUtils.isNotBlank(sort) && StringUtils.isNotBlank(order)) {
			params.put("orderByClause", sort + " " + order);
		} else {
			params.put("orderByClause", "wa.apply_status asc, wa.apply_time asc");
		}

		Set<String> exclusionFields = new HashSet<>();
		exclusionFields.add("u.province");
		exclusionFields.add("provinceName");
		exclusionFields.add("u.city");
		exclusionFields.add("cityName");
		exclusionFields.add("p.kind_id");
		exclusionFields.add("kind_name");
		exclusionFields.add("p.type_id");
		exclusionFields.add("type_name");

		String advanceFilter = request.getParameter("advanceFilter");
		params = AdvanceFilterUtil.initSerachParams(advanceFilter, exclusionFields, "", params);

		PageHelper.startPage(new Integer(pageStr), new Integer(rowsStr));
		List<WorkerAptitudeModel> workerAptitudeModels = workerAptitudeCustomService.findWorkerAptitudes(params);
		PageInfo<WorkerAptitudeModel> pageInfo = new PageInfo<WorkerAptitudeModel>(workerAptitudeModels);

		List<Map<String, Object>> systemRoleList = new ArrayList<>();
		if (workerAptitudeModels != null && !workerAptitudeModels.isEmpty()) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Map<String, Object> item = null;
			for (WorkerAptitudeModel workerAptitudeModel : workerAptitudeModels) {
				item = new HashMap<>();
				item.put("wa.id", workerAptitudeModel.getId());
				item.put("wa.worker_id", workerAptitudeModel.getWorkerId());
				String cityCode = workerAptitudeModel.getCity();
				item.put("u.city", cityCode);
				item.put("cityName", "");
				if (StringUtils.isNotBlank(cityCode)) {
					String cityName = baseDataCacheUtil.getCityName(cityCode);
					if (StringUtils.isNotBlank(cityName)) {
						item.put("cityName", cityName);
					}
				}
				item.put("wa.product_id", workerAptitudeModel.getProductId());
				item.put("p.name", workerAptitudeModel.getProductName());
				String kindId = workerAptitudeModel.getKindId();
				item.put("p.kind_id", kindId);
				item.put("kind_name", "");
				if (StringUtils.isNotBlank(kindId)) {
					String kindName = baseDataCacheUtil.getProductKindNameById(kindId);
					if (StringUtils.isNotBlank(kindName)) {
						item.put("kind_name", kindName);
					}
				}
				String typeId = workerAptitudeModel.getTypeId();
				item.put("p.type_id", typeId);
				item.put("type_name", "");
				if (StringUtils.isNotBlank(typeId)) {
					String typeName = baseDataCacheUtil.getProductTypeNameById(typeId);
					if (StringUtils.isNotBlank(typeName)) {
						item.put("type_name", typeName);
					}
				}
				item.put("wa.model", workerAptitudeModel.getProductModel());
				item.put("wa.apply_info", workerAptitudeModel.getApplyInfo());
				item.put("wa.apply_status", workerAptitudeModel.getApplyStatus());

				item.put("wa.apply_time", dateFormat.format(workerAptitudeModel.getApplyTime()));
				systemRoleList.add(item);
			}

		}

		res.put("rows", systemRoleList);

		res.put("currentPage", pageInfo.getPageNum());
		res.put("firstPage", pageInfo.isIsFirstPage());
		res.put("lastPage", pageInfo.isIsLastPage());
		res.put("numPerPage", pageInfo.getPrePage());
		res.put("totalPage", pageInfo.getPages());
		res.put("total", pageInfo.getTotal());

		return res;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/handleForm" }, method = { RequestMethod.GET })
	public ModelAndView handleForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("worker/aptitude/handleForm");
		return mav;
	}

	/***
	 * 申请处理详情
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/handleDetail")
	public Map<String, Object> handleDetail(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		String id = request.getParameter("id");
		WorkerAptitude workerAptitude = workerAptitudeService.selectById(id);
		if (workerAptitude == null) {
			return res;
		}
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String ct = dateFormat.format(workerAptitude.getApplyTime());
		String ut = dateFormat.format(workerAptitude.getUpdateTime());
		if (ct.equals(ut)) {
			res.put("updateTime", "未处理");
		} else {
			res.put("updateTime", ut);
		}
		res.put("id", workerAptitude.getId());
		res.put("applyStatus", workerAptitude.getApplyStatus());
		return res;
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
