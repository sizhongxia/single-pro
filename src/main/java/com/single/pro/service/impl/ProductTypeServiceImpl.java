package com.single.pro.service.impl;

import com.single.pro.entity.ProductType;
import com.single.pro.mapper.ProductTypeDao;
import com.single.pro.service.ProductTypeService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 产品类型，例：人脸识别，塔吊 服务实现类
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@Service
public class ProductTypeServiceImpl extends ServiceImpl<ProductTypeDao, ProductType> implements ProductTypeService {

}
