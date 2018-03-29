package com.single.pro.service.impl;

import com.single.pro.entity.Product;
import com.single.pro.mapper.ProductDao;
import com.single.pro.service.ProductService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 产品表 服务实现类
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@Service
public class ProductServiceImpl extends ServiceImpl<ProductDao, Product> implements ProductService {

}
