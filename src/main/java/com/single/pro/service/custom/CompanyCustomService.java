package com.single.pro.service.custom;

import java.util.List;
import java.util.Map;

import com.single.pro.entity.Company;

public interface CompanyCustomService {

	List<Company> selectCompanyList(Map<String, Object> params);
	
}
