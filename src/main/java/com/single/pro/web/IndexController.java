package com.single.pro.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.single.pro.cache.BaseDataCacheUtil;
import com.single.pro.entity.SystemFile;
import com.single.pro.entity.SystemUser;
import com.single.pro.service.SystemFileService;
import com.single.pro.storage.FileStorage;
import com.single.pro.util.IdUtil;
import com.single.pro.util.NidUtil;
import com.xiaoleilu.hutool.util.ArrayUtil;

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
	BaseDataCacheUtil baseDataCacheUtil;
	@Autowired
	FileStorage fileStorage;
	@Autowired
	SystemFileService systemFileService;

	@RequiresAuthentication
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("system", baseDataCacheUtil.getSystemInfo());
		return mav;
	}

	/***
	 * 后台欢迎页面
	 * 
	 * @param request
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value = "/welcome")
	public ModelAndView welcome(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("welcome");
		return mav;
	}

	/***
	 * 空页面
	 * 
	 * @param request
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value = "/empty")
	public ModelAndView empty(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("empty");
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
		ModelAndView view = new ModelAndView("error/un_authorized");
		return view;
	}

	@RequestMapping(value = "/page_not_found")
	public ModelAndView pageNotFound(HttpServletRequest request) {
		ModelAndView view = new ModelAndView("error/page_not_found");
		return view;
	}

	@RequestMapping(value = "/server_busy")
	public ModelAndView serverBusy(HttpServletRequest request) {
		ModelAndView view = new ModelAndView("error/server_busy");
		return view;
	}

	@RequestMapping(value = "/operation_timeout")
	public ModelAndView operationTimeout(HttpServletRequest request) {
		ModelAndView view = new ModelAndView("error/operation_timeout");
		return view;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/uploadPic")
	public Map<String, Object> uploadPic(HttpServletRequest request, @RequestParam("file") MultipartFile file) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String typeCode = request.getParameter("typeCode");
		if (StringUtils.isBlank(typeCode)) {
			typeCode = "";
		}

		if (file == null || file.isEmpty()) {
			res.put("msg", "未选择文件");
			return res;
		}
		String fileName = file.getOriginalFilename();
		String[] allowImageTypes = FileStorage.allowImageTypes;
		String type = fileName.substring(fileName.lastIndexOf("."), fileName.length()).toLowerCase();
		if (!ArrayUtil.contains(allowImageTypes, type)) {
			res.put("msg", "无效的图片类型");
			return res;
		}

		byte[] bytes = null;
		try {
			bytes = file.getBytes();
		} catch (IOException e) {
			res.put("msg", "无效的图片");
			return res;
		}
		int size = bytes.length;
		if (size > FileStorage.imageMaxSize) {
			res.put("msg", "图片大小 " + size + " 超出最大值 " + FileStorage.imageMaxSize);
			return res;
		}

		Date now = new Date();

		String path = "/" + new SimpleDateFormat("yyyy/MM/dd").format(now) + "/" + NidUtil.randomUUID19() + type;

		SystemFile systemFile = new SystemFile();
		systemFile.setId(IdUtil.id());

		if (fileName.length() > 60) {
			fileName = fileName.substring(0, 60) + "..." + type;
		}
		systemFile.setOriginalName(fileName);
		systemFile.setPath(path);
		systemFile.setSize((long) size);
		String contentType = file.getContentType();
		contentType = contentType + " (" + type + ")";
		if (contentType.length() > 20) {
			contentType = "(" + type + ")";
		}
		if (contentType.length() > 20) {
			contentType = "unknown";
		}
		systemFile.setType(contentType);
		systemFile.setDesc(typeCode);
		systemFile.setUploadUserId(((SystemUser) (SecurityUtils.getSubject().getPrincipal())).getId());
		systemFile.setUploadTime(now);
		if (!systemFileService.insert(systemFile)) {
			res.put("msg", "保存图片数据失败，请稍候重试");
			return res;
		}
		try {
			if (fileStorage.uploadImage(path, file.getBytes())) {
				res.put("statusCode", 200);
				res.put("filePath", path);
				return res;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		res.put("msg", "上传图片失败，请检查图片云存储服务配置");
		return res;
	}
	
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/uploadFile")
	public Map<String, Object> uploadFile(HttpServletRequest request, @RequestParam("file") MultipartFile file) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		String typeCode = request.getParameter("typeCode");
		if (StringUtils.isBlank(typeCode)) {
			typeCode = "";
		}

		if (file == null || file.isEmpty()) {
			res.put("msg", "未选择文件");
			return res;
		}
		String fileName = file.getOriginalFilename();
		String[] allowImageTypes = FileStorage.allowTypes;
		String type = fileName.substring(fileName.lastIndexOf("."), fileName.length()).toLowerCase();
		if (!ArrayUtil.contains(allowImageTypes, type)) {
			res.put("msg", "无效的文件类型");
			return res;
		}

		byte[] bytes = null;
		try {
			bytes = file.getBytes();
		} catch (IOException e) {
			res.put("msg", "无效的文件");
			return res;
		}
		int size = bytes.length;
		if (size > FileStorage.imageMaxSize) {
			res.put("msg", "文件大小 " + size + " 超出最大值 " + FileStorage.fileMaxSize);
			return res;
		}

		Date now = new Date();

		String path = "/" + new SimpleDateFormat("yyyy/MM/dd").format(now) + "/" + NidUtil.randomUUID19() + type;

		SystemFile systemFile = new SystemFile();
		systemFile.setId(IdUtil.id());

		if (fileName.length() > 60) {
			fileName = fileName.substring(0, 60) + "..." + type;
		}
		systemFile.setOriginalName(fileName);
		systemFile.setPath(path);
		systemFile.setSize((long) size);
		String contentType = file.getContentType();
		contentType = contentType + " (" + type + ")";
		if (contentType.length() > 20) {
			contentType = "(" + type + ")";
		}
		if (contentType.length() > 20) {
			contentType = "unknown";
		}
		systemFile.setType(contentType);
		systemFile.setDesc(typeCode);
		systemFile.setUploadUserId(((SystemUser) (SecurityUtils.getSubject().getPrincipal())).getId());
		systemFile.setUploadTime(now);
		if (!systemFileService.insert(systemFile)) {
			res.put("msg", "保存文件数据失败，请稍候重试");
			return res;
		}
		try {
			if (fileStorage.uploadImage(path, file.getBytes())) {
				res.put("statusCode", 200);
				res.put("filePath", path);
				return res;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		res.put("msg", "上传文件失败，请检查文件云存储服务配置");
		return res;
	}
}
