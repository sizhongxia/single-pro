package com.single.pro.service.custom;

import java.util.List;
import java.util.Map;

import com.single.pro.model.WorkerAptitudeModel;

public interface WorkerAptitudeCustomService {

	List<WorkerAptitudeModel> findWorkerAptitudes(Map<String, Object> params);

}
