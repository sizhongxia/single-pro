package com.single.pro.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.single.pro.cache.BaseDataCacheUtil;
import com.single.pro.model.DictionaryItemModel;

@Controller
@RequestMapping("project/manage")
public class ProjectManageController extends BaseController {

	@Autowired
	BaseDataCacheUtil baseDataCacheUtil;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("project/manage/index");

		List<DictionaryItemModel> types = baseDataCacheUtil.getDictItems("XMLX");
		mav.addObject("types", types);

		return mav;
	}

}
