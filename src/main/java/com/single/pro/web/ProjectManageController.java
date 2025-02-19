package com.single.pro.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.subject.Subject;
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
import com.github.stuxuhai.jpinyin.PinyinException;
import com.github.stuxuhai.jpinyin.PinyinFormat;
import com.github.stuxuhai.jpinyin.PinyinHelper;
import com.single.pro.cache.BaseDataCacheUtil;
import com.single.pro.entity.Order;
import com.single.pro.entity.Project;
import com.single.pro.entity.ProjectDraw;
import com.single.pro.entity.ProjectWork;
import com.single.pro.entity.SystemUser;
import com.single.pro.model.DictionaryItemModel;
import com.single.pro.model.ProjectModel;
import com.single.pro.service.OrderService;
import com.single.pro.service.ProjectDrawService;
import com.single.pro.service.ProjectService;
import com.single.pro.service.ProjectWorkService;
import com.single.pro.service.custom.ProjectCustomService;
import com.single.pro.storage.RealHostReplace;
import com.single.pro.util.IdUtil;
import com.xiaoleilu.hutool.date.DateUtil;

@Controller
@RequestMapping("project/manage")
public class ProjectManageController extends BaseController {

	@Autowired
	BaseDataCacheUtil baseDataCacheUtil;
	@Autowired
	ProjectService projectService;
	@Autowired
	ProjectDrawService projectDrawService;
	@Autowired
	ProjectWorkService projectWorkService;
	@Autowired
	ProjectCustomService projectCustomService;
	@Autowired
	OrderService orderService;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("project/manage/index");
		List<DictionaryItemModel> types = baseDataCacheUtil.getDictItems("XMLX");
		mav.addObject("types", types);
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
		String name = request.getParameter("name");
		if (StringUtils.isNotBlank(name)) {
			params.put("name", name.trim());
		}
		String type = request.getParameter("type");
		if (StringUtils.isNotBlank(type)) {
			params.put("type", type.trim());
		}
		String status = request.getParameter("status");
		if (StringUtils.isNotBlank(status)) {
			params.put("status", status.trim());
		}
		String contacts = request.getParameter("contacts");
		if (StringUtils.isNotBlank(contacts)) {
			params.put("contacts", contacts.trim());
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
		List<ProjectModel> list = projectCustomService.selectProjectList(params);
		PageInfo<ProjectModel> pageInfo = new PageInfo<ProjectModel>(list);
		List<Map<String, Object>> listMap = new ArrayList<>();

		if (list != null && list.size() > 0) {
			Map<String, Object> _map = null;
			for (ProjectModel item : list) {
				_map = new HashMap<>();
				_map.put("id", item.getId());
				_map.put("name", item.getName());
				_map.put("type", baseDataCacheUtil.getDictItemName(item.getType()));
				_map.put("address", item.getAddress());
				_map.put("companyName", item.getCompanyName());
				_map.put("workerNum", item.getWorkerNum());
				_map.put("coveredArea", item.getCoveredArea());
				_map.put("contacts", item.getContacts());
				_map.put("contactTel", item.getContactTel());
				_map.put("status", getProjectStatusText(item.getStatus()));
				_map.put("createTime", DateUtil.format(item.getCreateTime(), "yyyy-MM-dd HH:mm"));
				listMap.add(_map);
			}
		}

		data.put("data", listMap);
		data.put("current", pageInfo.getPageNum());
		data.put("pageCount", pageInfo.getPages());

		return data;
	}

	private String getProjectStatusText(String status) {
		switch (status) {
		case "Y":
			return "上线";
		case "N":
			return "下线";
		default:
			return "";
		}
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/create" }, method = { RequestMethod.GET })
	public ModelAndView create(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("project/manage/create");

		List<DictionaryItemModel> types = baseDataCacheUtil.getDictItems("XMLX");
		mav.addObject("types", types);
		
		mav.addObject("csrf", baseDataCacheUtil.setPageCsrf("project_manage_create"));
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/edit" }, method = { RequestMethod.GET })
	public ModelAndView edit(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("project/manage/edit");
		String id = request.getParameter("id");
		if (StringUtils.isBlank(id)) {
			return new ModelAndView("error/invalid_parameter");
		}
		Project project = projectService.selectById(id);
		if (project == null) {
			return new ModelAndView("error/invalid_parameter");
		}

		List<DictionaryItemModel> types = baseDataCacheUtil.getDictItems("XMLX");
		mav.addObject("types", types);

		mav.addObject("csrf", baseDataCacheUtil.setPageCsrf("project_manage_edit"));
		mav.addObject("project", project);
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/detail" }, method = { RequestMethod.GET })
	public ModelAndView detail(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("project/manage/detail");
		String id = request.getParameter("id");
		if (StringUtils.isBlank(id)) {
			return new ModelAndView("error/invalid_parameter");
		}
		Project project = projectService.selectById(id);
		if (project == null) {
			return new ModelAndView("error/invalid_parameter");
		}

		mav.addObject("project", project);
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/addr" }, method = { RequestMethod.GET })
	public ModelAndView addr(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("project/manage/addr");
		String id = request.getParameter("id");
		if (StringUtils.isBlank(id)) {
			return new ModelAndView("error/invalid_parameter");
		}
		Project project = projectService.selectById(id);
		if (project == null) {
			return new ModelAndView("error/invalid_parameter");
		}
		mav.addObject("csrf", baseDataCacheUtil.setPageCsrf("project_manage_addr"));
		mav.addObject("project", project);
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/attachment" }, method = { RequestMethod.GET })
	public ModelAndView attachment(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("project/manage/attachment");
		String id = request.getParameter("id");
		if (StringUtils.isBlank(id)) {
			return new ModelAndView("error/invalid_parameter");
		}
		Project project = projectService.selectById(id);
		if (project == null) {
			return new ModelAndView("error/invalid_parameter");
		}

		Wrapper<ProjectDraw> wrapper = new EntityWrapper<>();
		wrapper.eq("project_id", project.getId());
		wrapper.orderBy("upload_time", true);
		List<ProjectDraw> draws = projectDrawService.selectList(wrapper);
		if (draws == null) {
			draws = new ArrayList<>();
		}
		List<Map<String, Object>> drawListMaps = new ArrayList<>();
		Map<String, Object> item = null;
		for (ProjectDraw draw : draws) {
			item = new HashMap<>();
			item.put("id", draw.getId());
			item.put("url", RealHostReplace.getResUrl(draw.getDrawingUrl()));
			item.put("path", draw.getDrawingUrl());
			item.put("time", DateUtil.format(draw.getUploadTime(), "yyyy-MM-dd HH:mm:ss"));
			drawListMaps.add(item);
		}

		mav.addObject("projectId", project.getId());
		mav.addObject("draws", drawListMaps);
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/work" }, method = { RequestMethod.GET })
	public ModelAndView work(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("project/manage/work");
		String id = request.getParameter("id");
		if (StringUtils.isBlank(id)) {
			return new ModelAndView("error/invalid_parameter");
		}
		Project project = projectService.selectById(id);
		if (project == null) {
			return new ModelAndView("error/invalid_parameter");
		}
		mav.addObject("projectId", project.getId());
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/works" }, method = { RequestMethod.POST })
	public Map<String, Object> works(HttpServletRequest request) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("suc", false);

		String pageStr = request.getParameter("page");
		if (!NumberUtils.isDigits(pageStr) || new Integer(pageStr) < 1) {
			pageStr = "1";
		}
		String rowsStr = request.getParameter("rows");
		if (!NumberUtils.isDigits(rowsStr) || new Integer(rowsStr) > 1000 || new Integer(rowsStr) < 2) {
			rowsStr = "10";
		}

		String projectId = request.getParameter("projectId");
		if (StringUtils.isBlank(projectId)) {
			data.put("msg", "参数错误，无效的ID");
			return data;
		}
		Project project = projectService.selectById(projectId);
		if (project == null) {
			data.put("msg", "无效的ID");
			return data;
		}

		Wrapper<ProjectWork> wrapper = new EntityWrapper<>();
		wrapper.eq("project_id", projectId);

		String workNo = request.getParameter("workNo");
		if (StringUtils.isNotBlank(workNo)) {
			wrapper.eq("work_no", workNo.trim());
		}

		wrapper.orderBy("create_time", false);
		PageHelper.startPage(new Integer(pageStr), new Integer(rowsStr));
		List<ProjectWork> list = projectWorkService.selectList(wrapper);
		PageInfo<ProjectWork> pageInfo = new PageInfo<ProjectWork>(list);
		List<Map<String, Object>> listMap = new ArrayList<>();

		if (list != null && list.size() > 0) {
			Map<String, Object> _map = null;
			for (ProjectWork item : list) {
				_map = new HashMap<>();
				_map.put("id", item.getId());
				_map.put("workNo", item.getWorkNo());
				_map.put("workName", item.getWorkName());
				_map.put("cityUnitPrice", item.getCityUnitPrice());
				_map.put("productNum", item.getProductNum());
				_map.put("workerNum", item.getWorkerNum());
				_map.put("arrearageNum", item.getArrearageNum());
				_map.put("unconfirmedNum", item.getUnconfirmedNum());
				_map.put("confirmedNum", item.getConfirmedNum());
				_map.put("uncompleteNum", item.getUncompleteNum());
				_map.put("completeNum", item.getCompleteNum());
				_map.put("createTime", DateUtil.format(item.getCreateTime(), "yyyy-MM-dd HH:mm:ss"));
				listMap.add(_map);
			}
		}

		data.put("suc", true);
		data.put("data", listMap);
		data.put("current", pageInfo.getPageNum());
		data.put("pageCount", pageInfo.getPages());

		return data;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/order" }, method = { RequestMethod.GET })
	public ModelAndView order(HttpServletRequest request) throws Exception {
		ModelAndView mav = null;
		String workId = request.getParameter("workId");
		if (StringUtils.isBlank(workId)) {
			mav = new ModelAndView("error/error");
			mav.addObject("msg", "缺失参数：workId");
			return mav;
		}
		ProjectWork projectWork = projectWorkService.selectById(workId);
		if (projectWork == null) {
			mav = new ModelAndView("error/error");
			mav.addObject("msg", "通过参数 workId:" + workId + " 未找到有效的项目批次");
			return mav;
		}
		Wrapper<Order> wrapper = new EntityWrapper<>();
		wrapper.eq("work_id", projectWork.getId());
		wrapper.orderBy("create_time", true);
		List<Order> orders = orderService.selectList(wrapper);

		List<Map<String, Object>> listMap = new ArrayList<>();
		if (orders != null && orders.size() > 0) {
			Map<String, Object> _map = null;
			for (Order item : orders) {
				_map = new HashMap<>();
				_map.put("id", item.getId());
				_map.put("orderNo", item.getOrderNo());

				_map.put("customerId", item.getCustomerId());
				_map.put("customerName", item.getCustomerName());

				_map.put("workerId", item.getWorkerId());
				_map.put("workerName", item.getWorkerName());

				_map.put("productName", item.getProductName());
				_map.put("productCompany", item.getProductCompany());

				_map.put("expectTime", item.getExpectTime());
				_map.put("expectDays", item.getExpectDays());

				_map.put("orderCost", item.getOrderCost());
				_map.put("depositCost", item.getDepositCost());
				_map.put("paidCost", item.getPaidCost());

				_map.put("survey", "Y".equals(item.getSerSurveyChoice()) ? "success" : "default");
				_map.put("surveyStatus", item.getSerSurveyStatus());
				_map.put("check", "Y".equals(item.getSerCheckChoice()) ? "success" : "default");
				_map.put("checkStatus", item.getSerCheckStatus());
				_map.put("construct", "Y".equals(item.getSerConstructChoice()) ? "success" : "default");
				_map.put("constructStatus", item.getSerConstructStatus());
				_map.put("train", "Y".equals(item.getSerTrainChoice()) ? "success" : "default");
				_map.put("trainStatus", item.getSerTrainStatus());
				_map.put("accept", "Y".equals(item.getSerAcceptChoice()) ? "success" : "default");
				_map.put("acceptStatus", item.getSerAcceptStatus());

				String releaseStatus = item.getReleaseStatus();
				String releaseStatusTxt = "暂存，未发布";
				_map.put("releaseTime", "-");
				if ("Y".equals(releaseStatus)) {
					releaseStatusTxt = "已发布";
					_map.put("releaseTime", DateUtil.format(item.getReleaseTime(), "yyyy-MM-dd HH:mm:ss"));
				}
				_map.put("releaseStatus", releaseStatusTxt);

				String buildStatus = item.getBuildStatus();
				String buildStatusTxt = "待施工";
				if ("Y".equals(buildStatus)) {
					buildStatusTxt = "已完工";
				} else if ("R".equals(buildStatus)) {
					buildStatusTxt = "进行中";
				}
				_map.put("buildStatus", buildStatusTxt);

				String orderStatus = item.getOrderStatus();
				String orderStatusTxt = "待工人确认";
				if ("Y".equals(orderStatus)) {
					orderStatusTxt = "已完成";
				} else if ("D".equals(orderStatus)) {
					orderStatusTxt = "工人已接单";
				} else if ("N".equals(orderStatus)) {
					orderStatusTxt = "已取消";
				} else if ("P".equals(orderStatus)) {
					orderStatusTxt = "待平台确认";
				}
				_map.put("orderStatus", orderStatusTxt);

				_map.put("remarks", item.getRemarks());
				_map.put("createTime", DateUtil.format(item.getCreateTime(), "yyyy-MM-dd HH:mm:ss"));
				listMap.add(_map);
			}
		}

		projectWork.setProjectType(baseDataCacheUtil.getDictItemName(projectWork.getProjectType()));
		projectWork.setProvincial(baseDataCacheUtil.getCityName(projectWork.getProvincial()));
		projectWork.setCity(baseDataCacheUtil.getCityName(projectWork.getCity()));
		projectWork.setCounty(baseDataCacheUtil.getCityName(projectWork.getCounty()));

		mav = new ModelAndView("project/manage/order");
		mav.addObject("projectWork", projectWork);
		mav.addObject("orders", listMap);
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/save" }, method = { RequestMethod.POST })
	public Map<String, Object> save(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String csrf = request.getParameter("csrf");
		if (StringUtils.isBlank(csrf)) {
			res.put("message", "无效的表单，E:01，请刷新页面后重试");
			return res;
		}
		String _csrf = baseDataCacheUtil.getPageCsrf("project_manage_create");
		if (_csrf == null) {
			res.put("message", "表单已失效，请刷新页面后重试");
			return res;
		}
		if (!csrf.equals(_csrf)) {
			res.put("message", "表单已失效，你可能在其他页面已打开该页面");
			return res;
		}

		String name = request.getParameter("name");
		if (StringUtils.isBlank(name)) {
			res.put("message", "请输入项目名称");
			return res;
		}
		String type = request.getParameter("type");
		if (StringUtils.isBlank(type)) {
			res.put("message", "请选择一个项目类型");
			return res;
		}
		String coveredArea = request.getParameter("coveredArea");
		if (StringUtils.isBlank(coveredArea)) {
			coveredArea = "";
		}
		String workerNum = request.getParameter("workerNum");
		if (!NumberUtils.isDigits(workerNum)) {
			workerNum = "0";
		}
		String companyId = request.getParameter("companyId");
		if (StringUtils.isBlank(companyId)) {
			res.put("message", "请选择一个公司，如果不存在请先创建");
			return res;
		}
		String branchCompanyId = request.getParameter("branchCompanyId");
		if (StringUtils.isBlank(branchCompanyId)) {
			branchCompanyId = "";
		}
		String contacts = request.getParameter("contacts");
		if (StringUtils.isBlank(contacts)) {
			res.put("message", "请输入项目联系人名称");
			return res;
		}
		String contactTel = request.getParameter("contactTel");
		if (StringUtils.isBlank(contactTel)) {
			res.put("message", "请输入项目联系人联系方式");
			return res;
		}
		String provincial = request.getParameter("provincial");
		if (StringUtils.isBlank(provincial)) {
			res.put("message", "请选择项目所在省");
			return res;
		}

		String city = request.getParameter("city");
		if (StringUtils.isBlank(city)) {
			res.put("message", "请选择项目所在市");
			return res;
		}

		String county = request.getParameter("county");
		if (StringUtils.isBlank(county)) {
			res.put("message", "请选择项目所在区(县)");
			return res;
		}

		String address = request.getParameter("address");
		if (StringUtils.isBlank(address)) {
			res.put("message", "请输入项目地址");
			return res;
		}
		String longitude = request.getParameter("longitude");
		if (StringUtils.isBlank(longitude)) {
			longitude = "0";
		}
		String latitude = request.getParameter("latitude");
		if (StringUtils.isBlank(latitude)) {
			latitude = "0";
		}

		String remarks = request.getParameter("remarks");
		if (StringUtils.isBlank(remarks)) {
			remarks = "";
		}

		Wrapper<Project> wrapper = new EntityWrapper<>();
		wrapper.eq("name", name);
		Project project = projectService.selectOne(wrapper);
		if (project != null) {
			res.put("message", "项目名称已存在，请核对后重新输入");
			return res;
		}
		project = new Project();
		project.setId(IdUtil.id());
		project.setName(name);
		try {
			project.setPinyin(PinyinHelper.convertToPinyinString(name, "", PinyinFormat.WITHOUT_TONE));
		} catch (PinyinException e) {
			res.put("message", "拼音数据转换失败");
			return res;
		}
		project.setType(type);
		project.setWorkerNum(new Integer(workerNum));
		project.setCoveredArea(coveredArea);
		project.setContacts(contacts);
		project.setContactTel(contactTel);
		project.setProvincial(provincial);
		project.setCity(city);
		project.setCounty(county);
		project.setAddress(address);
		project.setLongitude(longitude);
		project.setLatitude(latitude);
		project.setCompanyId(companyId);
		project.setBranchCompanyId(branchCompanyId);
		project.setStatus("Y");
		project.setRemarks(remarks);
		Subject subject = SecurityUtils.getSubject();
		SystemUser user = (SystemUser) subject.getPrincipal();
		project.setCreateUserId(user.getId());
		project.setCreateTime(DateUtil.date());
		project.setUpdateTime(DateUtil.date());
		if (!projectService.insert(project)) {
			res.put("message", "未知错误，请联系网站管理员");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "保存成功");
		return res;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/update" }, method = { RequestMethod.POST })
	public Map<String, Object> update(HttpServletRequest request) throws Exception {
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String csrf = request.getParameter("csrf");
		if (StringUtils.isBlank(csrf)) {
			res.put("message", "无效的表单，E:01");
			return res;
		}

		String _csrf = baseDataCacheUtil.getPageCsrf("project_manage_edit");
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
			res.put("message", "无效的表单，E:04");
			return res;
		}
		Project project = projectService.selectById(id);
		if (project == null) {
			res.put("message", "无效的表单，E:05");
			return res;
		}

		String name = request.getParameter("name");
		if (StringUtils.isBlank(name)) {
			res.put("message", "请输入项目名称");
			return res;
		}
		try {
			project.setPinyin(PinyinHelper.convertToPinyinString(name, "", PinyinFormat.WITHOUT_TONE));
		} catch (PinyinException e) {
			res.put("message", "拼音数据转换失败");
			return res;
		}
		String type = request.getParameter("type");
		if (StringUtils.isBlank(type)) {
			res.put("message", "请选择一个项目类型");
			return res;
		}
		String coveredArea = request.getParameter("coveredArea");
		if (StringUtils.isBlank(coveredArea)) {
			coveredArea = "";
		}
		String workerNum = request.getParameter("workerNum");
		if (!NumberUtils.isDigits(workerNum)) {
			workerNum = "0";
		}
		String companyId = request.getParameter("companyId");
		if (StringUtils.isBlank(companyId)) {
			res.put("message", "请选择一个公司，如果不存在请先创建");
			return res;
		}
		String branchCompanyId = request.getParameter("branchCompanyId");
		if (StringUtils.isBlank(branchCompanyId)) {
			branchCompanyId = "";
		}
		String contacts = request.getParameter("contacts");
		if (StringUtils.isBlank(contacts)) {
			res.put("message", "请输入项目联系人名称");
			return res;
		}
		String contactTel = request.getParameter("contactTel");
		if (StringUtils.isBlank(contactTel)) {
			res.put("message", "请输入项目联系人联系方式");
			return res;
		}
		String status = request.getParameter("status");
		if (StringUtils.isBlank(status)) {
			res.put("message", "请选择一个项目状态");
			return res;
		}
		String remarks = request.getParameter("remarks");
		if (StringUtils.isBlank(remarks)) {
			remarks = "";
		}
		project.setName(name);
		project.setType(type);
		project.setWorkerNum(new Integer(workerNum));
		project.setCoveredArea(coveredArea);
		project.setCompanyId(companyId);
		project.setBranchCompanyId(branchCompanyId);
		project.setContacts(contacts);
		project.setContactTel(contactTel);
		project.setStatus(status);
		project.setRemarks(remarks);
		project.setUpdateTime(DateUtil.date());
		if (!projectService.updateById(project)) {
			res.put("message", "未知错误，请联系网站管理员");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更改成功");
		return res;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/updateAddr" }, method = { RequestMethod.POST })
	public Map<String, Object> updateAddr(HttpServletRequest request) throws Exception {
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String csrf = request.getParameter("csrf");
		if (StringUtils.isBlank(csrf)) {
			res.put("message", "无效的表单，E:01");
			return res;
		}

		String _csrf = baseDataCacheUtil.getPageCsrf("project_manage_addr");
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
			res.put("message", "无效的表单，E:04");
			return res;
		}
		Project project = projectService.selectById(id);
		if (project == null) {
			res.put("message", "无效的表单，E:05");
			return res;
		}

		String provincial = request.getParameter("provincial");
		if (StringUtils.isBlank(provincial)) {
			res.put("message", "请选择项目所在省");
			return res;
		}

		String city = request.getParameter("city");
		if (StringUtils.isBlank(city)) {
			res.put("message", "请选择项目所在市");
			return res;
		}

		String county = request.getParameter("county");
		if (StringUtils.isBlank(county)) {
			res.put("message", "请选择项目所在区(县)");
			return res;
		}

		String address = request.getParameter("address");
		if (StringUtils.isBlank(address)) {
			res.put("message", "请输入项目地址");
			return res;
		}
		String longitude = request.getParameter("longitude");
		if (StringUtils.isBlank(longitude)) {
			longitude = "0";
		}
		String latitude = request.getParameter("latitude");
		if (StringUtils.isBlank(latitude)) {
			latitude = "0";
		}
		project.setProvincial(provincial);
		project.setCity(city);
		project.setCounty(county);
		project.setAddress(address);
		project.setLongitude(longitude);
		project.setLatitude(latitude);
		project.setUpdateTime(DateUtil.date());
		if (!projectService.updateById(project)) {
			res.put("message", "未知错误，请联系网站管理员");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更改成功");
		return res;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/saveAttachment" }, method = { RequestMethod.POST })
	public Map<String, Object> saveAttachment(HttpServletRequest request) throws Exception {
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String projectId = request.getParameter("projectId");
		if (StringUtils.isBlank(projectId)) {
			res.put("message", "无效的表单，E:01");
			return res;
		}
		Project project = projectService.selectById(projectId);
		if (project == null) {
			res.put("message", "无效的表单，E:02");
			return res;
		}

		String drawingUrl = request.getParameter("path");
		if (StringUtils.isBlank(drawingUrl)) {
			res.put("message", "上传路径错误");
			return res;
		}
		ProjectDraw projectDraw = new ProjectDraw();
		projectDraw.setId(IdUtil.id());
		projectDraw.setProjectId(projectId);
		projectDraw.setDrawingUrl(drawingUrl);
		projectDraw.setUploadTime(DateUtil.date());
		if (!projectDrawService.insert(projectDraw)) {
			res.put("message", "未知错误，请联系网站管理员");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "上传成功");
		return res;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/removeAttachment" }, method = { RequestMethod.POST })
	public Map<String, Object> removeAttachment(HttpServletRequest request) throws Exception {
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String id = request.getParameter("id");
		if (StringUtils.isBlank(id)) {
			res.put("message", "无效的表单，E:01");
			return res;
		}
		ProjectDraw projectDraw = projectDrawService.selectById(id);
		if (projectDraw == null) {
			res.put("message", "无效的表单，E:02");
			return res;
		}

		if (!projectDrawService.deleteById(id)) {
			res.put("message", "未知错误，请联系网站管理员");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "删除成功");
		return res;
	}

}
