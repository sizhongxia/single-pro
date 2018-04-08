package com.single.pro.service.custom;

import java.util.List;
import java.util.Map;

import com.single.pro.model.ProjectModel;

public interface ProjectCustomService {

	List<ProjectModel> selectProjectList(Map<String, Object> params);

}
