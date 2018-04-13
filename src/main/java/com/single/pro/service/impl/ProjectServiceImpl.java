package com.single.pro.service.impl;

import com.single.pro.entity.Project;
import com.single.pro.mapper.ProjectDao;
import com.single.pro.service.ProjectService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 施工项目表 服务实现类
 * </p>
 *
 * @author SiZhongxia
 * @since 2018-04-13
 */
@Service
public class ProjectServiceImpl extends ServiceImpl<ProjectDao, Project> implements ProjectService {

}
