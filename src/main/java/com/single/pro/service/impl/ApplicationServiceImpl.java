package com.single.pro.service.impl;

import com.single.pro.entity.Application;
import com.single.pro.mapper.ApplicationDao;
import com.single.pro.service.ApplicationService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-01-08
 */
@Service
public class ApplicationServiceImpl extends ServiceImpl<ApplicationDao, Application> implements ApplicationService {

}
