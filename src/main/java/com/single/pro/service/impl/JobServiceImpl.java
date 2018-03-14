package com.single.pro.service.impl;

import com.single.pro.entity.Job;
import com.single.pro.mapper.JobDao;
import com.single.pro.service.JobService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 定时任务 服务实现类
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-03-07
 */
@Service
public class JobServiceImpl extends ServiceImpl<JobDao, Job> implements JobService {

}
