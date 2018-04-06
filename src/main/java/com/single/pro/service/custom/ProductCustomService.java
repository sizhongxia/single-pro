package com.single.pro.service.custom;

import java.util.List;
import java.util.Map;

import com.single.pro.model.ProductModel;

public interface ProductCustomService {

	List<ProductModel> selectProductList(Map<String, Object> params);

}
