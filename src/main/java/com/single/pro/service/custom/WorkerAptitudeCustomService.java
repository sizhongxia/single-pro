package com.single.pro.service.custom;

import java.util.List;
import java.util.Map;

import com.single.pro.model.WorkerAptitudeModel;
import com.single.pro.model.WorkerAptitudeUserModel;

public interface WorkerAptitudeCustomService {

	List<WorkerAptitudeModel> findWorkerAptitudes(Map<String, Object> params);

	List<WorkerAptitudeUserModel> selectValidWorker(Map<String, Object> params);

}
