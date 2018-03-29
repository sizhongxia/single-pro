package com.single.pro.service.impl;

import com.single.pro.entity.SystemUser;
import com.single.pro.mapper.SystemUserDao;
import com.single.pro.service.SystemUserService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 系统用户 服务实现类
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@Service
public class SystemUserServiceImpl extends ServiceImpl<SystemUserDao, SystemUser> implements SystemUserService {

}
