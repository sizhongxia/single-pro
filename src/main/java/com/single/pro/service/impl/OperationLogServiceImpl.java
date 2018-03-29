package com.single.pro.service.impl;

import com.single.pro.entity.OperationLog;
import com.single.pro.mapper.OperationLogDao;
import com.single.pro.service.OperationLogService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 系统用户操作记录表（记录关键数据） 服务实现类
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-29
 */
@Service
public class OperationLogServiceImpl extends ServiceImpl<OperationLogDao, OperationLog> implements OperationLogService {

}
