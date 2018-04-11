package com.single.pro.service;

import org.springframework.transaction.annotation.Transactional;

import com.baomidou.mybatisplus.service.IService;
import com.single.pro.entity.User;

/**
 * <p>
 * 用户基础信息表 服务类
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@Transactional
public interface UserService extends IService<User> {

}
