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

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.single.pro.cache.BaseDataCacheUtil;
import com.single.pro.cache.CacheUtil;
import com.single.pro.entity.Project;
import com.single.pro.entity.ProjectWork;
import com.single.pro.model.DictionaryItemModel;
import com.single.pro.model.ProjectModel;
import com.single.pro.service.ProjectService;
import com.single.pro.service.ProjectWorkService;
import com.single.pro.service.custom.ProjectCustomService;
import com.single.pro.util.IdUtil;
import com.xiaoleilu.hutool.date.DateUtil;

import net.oschina.j2cache.CacheObject;

@Controller
@RequestMapping("project/manage")
public class ProjectManageController extends BaseController {

	@Autowired
	BaseDataCacheUtil baseDataCacheUtil;
	@Autowired
	ProjectService projectService;
	@Autowired
	ProjectWorkService projectWorkService;
	@Autowired
	ProjectCustomService projectCustomService;

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
				_map.put("createTime", DateUtil.format(item.getCreateTime(), "yyyy-MM-dd HH:mm"));
				listMap.add(_map);
			}
		}

		data.put("data", listMap);
		data.put("current", pageInfo.getPageNum());
		data.put("pageCount", pageInfo.getPages());

		return data;
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

		String csrf = IdUtil.id();
		CacheUtil.set("single:system:form", "project_manage_csrf", csrf);
		mav.addObject("csrf", csrf);
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

		String csrf = IdUtil.id();
		CacheUtil.set("single:system:form", "project_manage_csrf", csrf);
		mav.addObject("csrf", csrf);

		mav.addObject("project", project);
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
			wrapper.like("work_no", workNo);
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
				_map.put("workName", item.getWorkName());
				_map.put("workNo", item.getWorkNo());
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

		CacheObject cacheObject = CacheUtil.get("single:system:form", "project_manage_csrf");
		if (cacheObject == null) {
			res.put("message", "无效的表单，E:02");
			return res;
		}

		if (!csrf.equals(cacheObject.asString())) {
			res.put("message", "无效的表单，E:03");
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
		// String address = request.getParameter("address");
		// if (StringUtils.isBlank(address)) {
		// res.put("message", "请输入项目地址");
		// return res;
		// }
		// String longitude = request.getParameter("longitude");
		// if (StringUtils.isBlank(longitude)) {
		// longitude = "0";
		// }
		// String latitude = request.getParameter("latitude");
		// if (StringUtils.isBlank(latitude)) {
		// latitude = "0";
		// }

		String remarks = request.getParameter("remarks");
		if (StringUtils.isBlank(remarks)) {
			remarks = "";
		}
		project.setName(name);
		project.setType(type);
		project.setWorkerNum(new Integer(workerNum));
		project.setCoveredArea(coveredArea);
		project.setContacts(contacts);
		project.setContactTel(contactTel);
		// project.setAddress(address);
		// project.setLongitude(longitude);
		// project.setLatitude(latitude);
		project.setRemarks(remarks);
		project.setUpdateTime(new Date());
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

		CacheObject cacheObject = CacheUtil.get("single:system:form", "project_manage_csrf");
		if (cacheObject == null) {
			res.put("message", "无效的表单，E:02");
			return res;
		}

		if (!csrf.equals(cacheObject.asString())) {
			res.put("message", "无效的表单，E:03");
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

		project.setAddress(address);
		project.setLongitude(longitude);
		project.setLatitude(latitude);
		project.setUpdateTime(new Date());
		if (!projectService.updateById(project)) {
			res.put("message", "未知错误，请联系网站管理员");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更改成功");
		return res;
	}

}
