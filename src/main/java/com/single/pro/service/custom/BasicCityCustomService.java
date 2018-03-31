package com.single.pro.service.custom;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.single.pro.model.BasicCityModel;

/**
 * <p>
 * 城市查询自定义接口
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
public interface BasicCityCustomService {

	List<BasicCityModel> findBasicCityWithParent(@Param("s") String s);
}
