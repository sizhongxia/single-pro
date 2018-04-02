package com.single.pro.service.custom;

import java.util.List;
import java.util.Map;

import com.single.pro.model.UserWorkerModel;
import com.single.pro.model.WorkerAptitudeModel;

public interface UserWorkerCustomService {

	List<UserWorkerModel> findUserWorkers(Map<String, Object> param);

	List<WorkerAptitudeModel> findWorkerAptitudes(Map<String, Object> param);

}
