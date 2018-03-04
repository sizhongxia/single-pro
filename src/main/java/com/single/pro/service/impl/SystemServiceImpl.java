package com.single.pro.service.impl;

import com.single.pro.entity.System;
import com.single.pro.mapper.SystemDao;
import com.single.pro.service.SystemService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 系统基本信息 服务实现类
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-01
 */
@Service
public class SystemServiceImpl extends ServiceImpl<SystemDao, System> implements SystemService {

}
