package com.single.pro.web;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author HJP_SiZhongxia
 * @since 2017-12-27
 */
@Controller
@RequestMapping("/")
public class IndexController extends BaseController {

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("index");
		return mav;
	}

	/***
	 * 后台欢迎页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/welcome")
	public ModelAndView welcome(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("welcome");
		return mav;
	}

	/***
	 * 不兼容提示
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/ie")
	public ModelAndView ie(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("ie");
		return mav;
	}

	/***
	 * 登录页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/login")
	public ModelAndView login(HttpServletRequest request, RedirectAttributes attr) {
		ModelAndView mav = new ModelAndView("login");
		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated()) {
			mav.setViewName("redirect:/index");
			return mav;
		}
		Session session = subject.getSession(true);
		Object referer = session.getAttribute("referer");
		if (referer != null) {
			mav.addObject("referer", referer);
		} else {
			mav.addObject("referer", "index");
		}
		return mav;
	}

	@RequestMapping(value = "/un_authorized")
	public ModelAndView unAuthorized(HttpServletRequest request) {
		ModelAndView view = new ModelAndView("un_authorized");
		return view;
	}

	@RequestMapping(value = "/page_not_found")
	public ModelAndView pageNotFound(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		if (request.getHeader("Referer") != null) {
			view.setViewName("page_not_found");
		} else {
			view.setViewName("to_skip_index");
		}
		return view;
	}

	@RequestMapping(value = "/server_busy")
	public ModelAndView serverBusy(HttpServletRequest request) {
		ModelAndView view = new ModelAndView("server_busy");
		return view;
	}

	@RequestMapping(value = "/operation_timeout")
	public ModelAndView operationTimeout(HttpServletRequest request) {
		ModelAndView view = new ModelAndView("operation_timeout");
		return view;
	}

	/**
	 * 菜单未配置访问路径
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/no_config_url")
	public ModelAndView noConfigUrl(HttpServletRequest request) {
		ModelAndView view = new ModelAndView("no_config_url");
		return view;
	}
}
