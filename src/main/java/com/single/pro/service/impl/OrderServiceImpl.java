package com.single.pro.service.impl;

import com.single.pro.entity.Order;
import com.single.pro.mapper.OrderDao;
import com.single.pro.service.OrderService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 订单 服务实现类
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-04-13
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderDao, Order> implements OrderService {

}
