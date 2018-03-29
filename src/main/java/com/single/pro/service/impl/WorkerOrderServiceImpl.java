package com.single.pro.service.impl;

import com.single.pro.entity.WorkerOrder;
import com.single.pro.mapper.WorkerOrderDao;
import com.single.pro.service.WorkerOrderService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 劳务工人项目关联订单 服务实现类
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@Service
public class WorkerOrderServiceImpl extends ServiceImpl<WorkerOrderDao, WorkerOrder> implements WorkerOrderService {

}
