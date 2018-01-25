package com.single.pro.web;

import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.code.kaptcha.Producer;
import com.single.pro.cache.BaseDataCacheUtil;
import com.single.pro.cache.CacheUtil;

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

	@Autowired
	Producer captchaProducer;
	@Autowired
	BaseDataCacheUtil baseDataCacheUtil;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("index");
		List<Map<String, Object>> menuList = baseDataCacheUtil.getMenuList();
		mav.addObject("menuList", menuList);
		mav.addObject("application", baseDataCacheUtil.getApplication());
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
		
		CacheUtil.set("user", "name", "sizhongxia");
		
		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated()) {
			mav.setViewName("redirect:/index");
			return mav;
		}
		Session session = subject.getSession(true);
		Object referer = session.getAttribute("referer");
		mav.addObject("referer", referer);
		Object msg = session.getAttribute("login_fail_msg");
		mav.addObject("msg", msg);
		// 清除
		session.removeAttribute("referer");
		session.removeAttribute("login_fail_msg");
		
		mav.addObject("application", baseDataCacheUtil.getApplication());
		return mav;
	}

	/***
	 * 验证码
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("image-verify")
	public void imageVerify(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setDateHeader("Expires", 0);
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");
		response.setHeader("Pragma", "no-cache");
		response.setContentType("image/jpeg");
		ServletOutputStream out = response.getOutputStream();
		ImageIO.write(captchaProducer.createImage(captchaProducer.createText()), "jpg", out);
		try {
			out.flush();
		} finally {
			out.close();
		}
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
