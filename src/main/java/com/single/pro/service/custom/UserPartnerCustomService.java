package com.single.pro.service.custom;

import java.util.List;
import java.util.Map;

import com.single.pro.model.UserPartnerModel;

public interface UserPartnerCustomService {

	List<UserPartnerModel> findUserPartners(Map<String, Object> param);

}
