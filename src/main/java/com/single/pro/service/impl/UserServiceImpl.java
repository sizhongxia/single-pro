package com.single.pro.service.impl;

import com.single.pro.entity.User;
import com.single.pro.mapper.UserDao;
import com.single.pro.service.UserService;
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
public class UserServiceImpl extends ServiceImpl<UserDao, User> implements UserService {

}
