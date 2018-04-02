package com.single.pro.service.custom;

import java.util.List;
import java.util.Map;

import com.single.pro.model.UserCustomerModel;

public interface UserCustomerCustomService {

	List<UserCustomerModel> findUserCustomers(Map<String, Object> params);

}
