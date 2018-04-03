package com.single.pro.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.single.pro.cache.BaseDataCacheUtil;
import com.single.pro.entity.SystemFile;
import com.single.pro.entity.SystemUser;
import com.single.pro.service.SystemFileService;
import com.single.pro.storage.FileStorage;
import com.single.pro.storage.RealHostReplace;
import com.single.pro.util.IdUtil;
import com.single.pro.util.NidUtil;
import com.xiaoleilu.hutool.util.ArrayUtil;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-05
 */
@Controller
@RequestMapping("/systemFile")
public class SystemFileController extends BaseController {

	@Autowired
	SystemFileService systemFileService;
	@Autowired
	BaseDataCacheUtil baseDataCacheUtil;
	@Autowired
	FileStorage fileStorage;

	/***
	 * 系统文件资源
	 * 
	 * @param request
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value = "/index")
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("system/file/index");
		return mav;
	}

	// 文件列表
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/list")
	public Map<String, Object> list(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();

		Wrapper<SystemFile> wrapper = new EntityWrapper<>();

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
		List<SystemFile> systemFiles = systemFileService.selectList(wrapper);
		PageInfo<SystemFile> pageInfo = new PageInfo<SystemFile>(systemFiles);

		List<Map<String, Object>> systemFileList = new ArrayList<>();
		if (systemFiles != null && !systemFiles.isEmpty()) {
			Map<String, Object> item = null;
			for (SystemFile systemFile : systemFiles) {
				item = new HashMap<>();
				item.put("id", systemFile.getId());
				item.put("originalName", systemFile.getOriginalName());
				item.put("type", systemFile.getType());
				item.put("size", systemFile.getSize());
				item.put("path", RealHostReplace.getResUrl(systemFile.getPath()));
				item.put("desc", systemFile.getDesc());
				item.put("uploadTime", systemFile.getUploadTime());
				systemFileList.add(item);
			}
		}

		res.put("rows", systemFileList);

		res.put("currentPage", pageInfo.getPageNum());
		res.put("firstPage", pageInfo.isIsFirstPage());
		res.put("lastPage", pageInfo.isIsLastPage());
		res.put("numPerPage", pageInfo.getPrePage());
		res.put("totalPage", pageInfo.getPages());
		res.put("total", pageInfo.getTotal());

		return res;
	}

	/***
	 * 保存
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/saveFile")
	public Map<String, Object> saveFile(HttpServletRequest request, @RequestParam("file") MultipartFile file) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");
		res.put("statusCode", 300);

		if (file != null) {

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
			systemFile.setDesc("系统上传");
			systemFile.setUploadUserId(((SystemUser) (SecurityUtils.getSubject().getPrincipal())).getId());
			systemFile.setUploadTime(now);
			if (!systemFileService.insert(systemFile)) {
				res.put("msg", "报错图片数据失败，请稍候重试");
				return res;
			}
			try {
				if (fileStorage.upload(path, file.getBytes())) {
					res.put("statusCode", 200);
					res.put("filePath", path);
					return res;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		res.put("message", "未知错误");
		return res;
	}

	/***
	 * 删除系统资源信息
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequiresAuthentication
	@RequestMapping(value = "/delete")
	public Map<String, Object> delete(HttpServletRequest request) {
		Map<String, Object> res = new HashMap<>();
		res.put("title", "操作提示");

		// String id = request.getParameter("id");
		//
		// if (StringUtils.isBlank(id)) {
		// res.put("statusCode", 300);
		// res.put("message", "无效的参数");
		// return res;
		// }
		//
		// String[] ids = id.split(",");
		//
		// Set<String> idList = new HashSet<>();
		// for (String idStr : ids) {
		// idList.add(idStr);
		// }
		//
		// if (!systemFileService.deleteBatchIds(idList)) {
		// res.put("statusCode", 300);
		res.put("message", "暂不支持删除文件");
		// return res;
		// }

		// res.put("statusCode", 200);
		// res.put("message", "操作成功");
		return res;
	}

}
