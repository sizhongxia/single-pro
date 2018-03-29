package com.single.pro.service.impl;

import com.single.pro.entity.LoginLog;
import com.single.pro.mapper.LoginLogDao;
import com.single.pro.service.LoginLogService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 系统用户登陆记录表 服务实现类
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@Service
public class LoginLogServiceImpl extends ServiceImpl<LoginLogDao, LoginLog> implements LoginLogService {

}
