package com.single.pro.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.single.pro.entity.Role;
import com.single.pro.entity.RoleApp;
import com.single.pro.entity.RoleAuthword;
import com.single.pro.entity.RoleMenu;
import com.single.pro.entity.SystemApp;
import com.single.pro.entity.SystemAuthword;
import com.single.pro.entity.SystemMenu;
import com.single.pro.entity.WorkerAptitude;
import com.single.pro.service.WorkerAptitudeService;
import com.single.pro.util.IdUtil;

@Controller
@RequestMapping("worker/aptitude")
public class WorkerAptitudeController extends BaseController {

	@Autowired
	WorkerAptitudeService workerAptitudeService;

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

		Wrapper<WorkerAptitude> wrapper = new EntityWrapper<>();
		// wrapper.eq("status", "Y");

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
		List<WorkerAptitude> workerAptitudes = workerAptitudeService.selectList(wrapper);
		PageInfo<WorkerAptitude> pageInfo = new PageInfo<WorkerAptitude>(workerAptitudes);

		List<Map<String, Object>> systemRoleList = new ArrayList<>();
		if (workerAptitudes != null && !workerAptitudes.isEmpty()) {
			Map<String, Object> item = null;
			for (WorkerAptitude workerAptitude : workerAptitudes) {
				item = new HashMap<>();
				item.put("id", workerAptitude.getId());
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
	@RequestMapping(value = { "/form" }, method = { RequestMethod.GET })
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("role/form");
		return mav;
	}

	/***
	 * 申请详情
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/detail")
	public WorkerAptitude detail(HttpServletRequest request) {
		WorkerAptitude workerAptitude = null;

		String id = request.getParameter("id");

		workerAptitude = workerAptitudeService.selectById(id);
		if (workerAptitude == null) {
			workerAptitude = new WorkerAptitude();
		}
		return workerAptitude;
	}
}
