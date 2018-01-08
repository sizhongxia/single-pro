package com.single.pro.web.wap;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/wap")
public class WapHomeController {

	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("wap/index");
		return mav;
	}

	@RequestMapping(value = { "/home" }, method = { RequestMethod.GET })
	public ModelAndView home(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("wap/home");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		mav.addObject("time", dateFormat.format(new Date()));
		return mav;
	}

	@RequestMapping(value = { "/types" }, method = { RequestMethod.GET })
	public ModelAndView types(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("wap/types");
		List<String> list = new ArrayList<>();
		list.add("测试1");
		list.add("测试2");
		list.add("测试3");
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = { "/my" }, method = { RequestMethod.GET })
	public ModelAndView my(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("wap/my");
		return mav;
	}

	@RequestMapping(value = { "/notFount" }, method = { RequestMethod.GET })
	public ModelAndView notFount(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("wap/notFount");
		return mav;
	}
}
