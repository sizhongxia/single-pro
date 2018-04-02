package com.single.pro.web;

import java.text.SimpleDateFormat;
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
import com.single.pro.entity.ProductClue;
import com.single.pro.service.ProductClueService;

@Controller
@RequestMapping("product/clue")
public class ProductClueController extends BaseController {

	@Autowired
	ProductClueService productClueService;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("product/clue/index");
		return mav;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = { "/list" }, method = { RequestMethod.POST })
	public Map<String, Object> list(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();

		Wrapper<ProductClue> wrapper = new EntityWrapper<>();
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
		List<ProductClue> productClues = productClueService.selectList(wrapper);
		PageInfo<ProductClue> pageInfo = new PageInfo<ProductClue>(productClues);

		List<Map<String, Object>> productClueList = new ArrayList<>();
		if (productClues != null && !productClues.isEmpty()) {
			Map<String, Object> item = null;
			for (ProductClue productClue : productClues) {
				item = new HashMap<>();
				item.put("id", productClue.getId());
				item.put("product_name", productClue.getProductName());
				item.put("company", productClue.getCompany());
				item.put("contacts", productClue.getContacts());
				item.put("contact_tel", productClue.getContactTel());
				item.put("apply_time", productClue.getApplyTime());
				item.put("handle_status", productClue.getHandleStatus());
				productClueList.add(item);
			}
		}

		res.put("rows", productClueList);

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
		ModelAndView mav = new ModelAndView("product/clue/form");
		return mav;
	}

	@RequiresAuthentication
	@RequestMapping(value = { "/handleForm" }, method = { RequestMethod.GET })
	public ModelAndView handleForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("product/clue/handleForm");
		return mav;
	}

	/***
	 * 线索详情
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/detail")
	public ProductClue detail(HttpServletRequest request) {
		ProductClue productClue = null;

		String id = request.getParameter("id");

		productClue = productClueService.selectById(id);
		if (productClue == null) {
			productClue = new ProductClue();
		}
		
		return productClue;
	}

	/***
	 * 线索处理
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/handleDetail")
	public Map<String, Object> handleDetail(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		ProductClue productClue = null;
		String id = request.getParameter("id");
		productClue = productClueService.selectById(id);
		if (productClue == null) {
			return map;
		}
		map.put("id", productClue.getId());
		map.put("handleStatus", productClue.getHandleStatus());
		Date handleTime = productClue.getHandleTime();
		if (handleTime != null) {
			map.put("handleTime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(handleTime));
		} else {
			map.put("handleTime", "暂无处理");
		}
		return map;
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

		ProductClue productClue = productClueService.selectById(id);
		if (productClue == null) {
			res.put("message", "无效的参数");
			return res;
		}
		String handleStatus = request.getParameter("handleStatus");
		if (productClue.getHandleStatus().equals(handleStatus)) {
			res.put("message", "状态未改变");
			return res;
		}
		productClue.setHandleStatus(handleStatus);
		productClue.setHandleTime(new Date());

		if (!productClueService.updateById(productClue)) {
			res.put("message", "未知错误");
			return res;
		}

		res.put("statusCode", 200);
		res.put("message", "更新成功");
		return res;
	}

}
