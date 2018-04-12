package com.single.pro.service.custom;

import java.util.List;
import java.util.Map;

import com.single.pro.model.ProjectOrderModel;

public interface ProjectOrderCustomService {

	List<ProjectOrderModel> selectProjectOrderList(Map<String, Object> params);

}
