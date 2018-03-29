package com.single.pro.service.impl;

import com.single.pro.entity.ProductKind;
import com.single.pro.mapper.ProductKindDao;
import com.single.pro.service.ProductKindService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 产品种类，例：人员管理，起重设备，监控 服务实现类
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@Service
public class ProductKindServiceImpl extends ServiceImpl<ProductKindDao, ProductKind> implements ProductKindService {

}
